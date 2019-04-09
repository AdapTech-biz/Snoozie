//
//  EndPointViewController.swift
//  Snoozie
//
//  Created by Xavier Davis on 4/6/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit
import GooglePlaces

class EndPointViewController: UIViewController {
    
    var endPointView = EndPointView()
    var snoozieNavigationBar = SnoozieNavigationBar()
    weak var searchBar : UITextField!
    weak var streetAddressTextField : UITextField!
    weak var cityTextField : UITextField!
    weak var stateTextField : UITextField!
    weak var zipCodeTextField : UITextField!
    weak var timePicker : UIDatePicker!
    weak var nextButton : UIButton!
    weak var searchResultTable : UITableView!
    var placesClient : GMSPlacesClient?
    var fetcher: GMSAutocompleteFetcher?
    var addressResults = [AddressModel]()
    // Create a new session token.
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(endPointView)
        view.addSubview(snoozieNavigationBar)
        setupContriants()
        setupOutlets()

        // Do any additional setup after loading the view.
    }
    
    func setupContriants() {
        endPointView.snp.makeConstraints { (make) in
            make.top.equalTo(snoozieNavigationBar.snp.bottom)
            make.left.right.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        snoozieNavigationBar.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }
    }
    
    func setupOutlets() {
        searchBar = endPointView.searchLocationTextField
        streetAddressTextField = endPointView.streetAddressTextField
        cityTextField = endPointView.cityTextField
        stateTextField = endPointView.stateTextField
        zipCodeTextField = endPointView.zipCodeTextField
        timePicker = endPointView.timePicker
        nextButton = endPointView.nextButton
        searchResultTable = endPointView.addressResultTableView
        searchResultTable.delegate = self
        searchResultTable.dataSource = self
        
        searchBar.addTarget(self, action: #selector(textFieldDidChange(textField:)),
                             for: .editingChanged)

        placesClient = GMSPlacesClient()
        
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        
        let token: GMSAutocompleteSessionToken = GMSAutocompleteSessionToken.init()
        
        // Create the fetcher.
        fetcher = GMSAutocompleteFetcher(bounds: nil, filter: filter)
        fetcher?.delegate = self
        fetcher?.provide(token)



    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        
        if ((textField.text?.count)! > 4){
            addressResults.removeAll()
            fetcher?.sourceTextHasChanged(textField.text!)
            searchResultTable.isHidden = false
        }
        
    }
    
    func findPlaceInformation (places : [String]) {
//        print(places)
        let placeClient = GMSPlacesClient()
        if (!places.isEmpty){
            for place in places{
                placeClient.fetchPlace(fromPlaceID: place, placeFields: .addressComponents, sessionToken: nil, callback: { (currentPlace, error) in
                    
                    guard let addresses = currentPlace?.addressComponents else {
                        fatalError()
                    }
                    self.parseAddressInformation(addresses: addresses)
                })
            }
        }
    }
    
    func parseAddressInformation (addresses : [GMSAddressComponent]){
        
        var addressModel = AddressModel()
        for address in addresses{
//            print(address)
        switch address.type {
        case "street_number":
            addressModel.streetNumber = address.name
            break
        case "route":
            addressModel.streetName = address.name
            break
        case "locality":
            addressModel.city = address.name
            break
        case "administrative_area_level_1":
            addressModel.stateName = address.name
            break
        case "postal_code": //zip code
            addressModel.zipCode = address.name
            break
        default:
            break
        }
        }
        addressResults.append(addressModel)
        searchResultTable.reloadData()
//        print(addressModel)
    }

    

    

}

extension EndPointViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressResultCell", for: indexPath) as! AddressResultTableViewCell
        let selectedCellView = UIView()
        selectedCellView.backgroundColor = UIColor.init("#F1EBFD")
        cell.selectedBackgroundView = selectedCellView
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let result = cell as! AddressResultTableViewCell
        result.streetAddress.text = addressResults[indexPath.row].formattedStreetName()
        result.cityStateZip.text = addressResults[indexPath.row].formatCityState()
        tableView.frame.size.height = tableView.contentSize.height
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.isHidden = true
        let addressModel = addressResults[indexPath.row]
        streetAddressTextField.text = addressModel.formattedStreetName()
        cityTextField.text = addressModel.city
        stateTextField.text = addressModel.stateName
        zipCodeTextField.text = addressModel.zipCode
    }
    
    
    
}


extension EndPointViewController : GMSAutocompleteFetcherDelegate {
    func didAutocomplete(with predictions: [GMSAutocompletePrediction]) {
        let resultsStr = NSMutableString()
        var placesIDs = [String]()
        for prediction in predictions  {
            
            resultsStr.appendFormat("\n Primary text: %@\n", prediction.attributedPrimaryText)
            resultsStr.appendFormat("Place ID: %@\n", prediction.placeID)
            placesIDs.append(prediction.placeID)

        }

        findPlaceInformation(places: placesIDs)
    }
    
    func didFailAutocompleteWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    


}


    



    
    

