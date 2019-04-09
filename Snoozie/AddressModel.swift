//
//  AddressModel.swift
//  Snoozie
//
//  Created by Xavier Davis on 4/6/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import Foundation

struct AddressModel {
    var streetNumber : String = ""
    var streetName : String = ""
    var city : String = ""
    var stateName : String = ""
    var zipCode : String = ""
    
    func formattedStreetName () -> String{
        return "\(streetNumber) \(streetName)"
    }
    
    func formatCityState() -> String {
        return "\(city), \(stateName) \(zipCode)"
    }
}
