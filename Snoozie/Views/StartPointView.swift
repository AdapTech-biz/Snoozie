//
//  EndPointView.swift
//  Snoozie
//
//  Created by Xavier Davis on 4/6/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit

class StartPointView : UIView {
    
//    var addressResultTableView : UITableView
//    var searchLocationTextField : UITextField
    var currentLocationButton : UIButton
    var leftDivider : UIImageView
    var dividerImageView : UIImageView
    var rightDivider : UIImageView
    var streetAddressTextField : UITextField
    var cityTextField : UITextField
    var stateTextField : UITextField
    var zipCodeTextField : UITextField
    var prepTimeLabel : UILabel
    var timeSlider  : UISlider
    var setAlarmButton : UIButton
    
    override init(frame: CGRect) {
        

        currentLocationButton = {
            let button = UIButton()
            button.backgroundColor = UIColor("#6B00F8")

            button.setTitle("Current Location", for: .normal)
            return button
        }()
        leftDivider = {
            let image = UIImageView(image: UIImage(named: "DividerPrimaryColor"))
            image.contentMode = .scaleAspectFit
            return image
        }()
        dividerImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "alarm-clock")
            return imageView
        }()
        rightDivider = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "DividerPrimaryColor")
            return imageView
        }()
        streetAddressTextField = {
            let textfield = UITextField()
            textfield.placeholder = "Street Address"
            textfield.borderStyle = .roundedRect
            textfield.font = UIFont.init(name: "Rubik", size: 16.26)
            textfield.textColor = UIColor("#008464")
            return textfield
        }()
        cityTextField = {
            let textfield = UITextField()
            textfield.placeholder = "City"
            textfield.borderStyle = .roundedRect
            textfield.font = UIFont.init(name: "Rubik", size: 16.26)
            textfield.textColor = UIColor("#008464")
            return textfield
        }()
        stateTextField = {
            let textfield = UITextField()
            textfield.placeholder = "State"
            textfield.borderStyle = .roundedRect
            textfield.font = UIFont.init(name: "Rubik", size: 16.26)
            textfield.textColor = UIColor("#008464")
            return textfield
        }()
        zipCodeTextField = {
            let textfield = UITextField()
            textfield.placeholder = "Zip Code"
            textfield.keyboardType = .numberPad
            textfield.borderStyle = .roundedRect
            textfield.font = UIFont.init(name: "Rubik", size: 16.26)
            textfield.textColor = UIColor("#008464")
            return textfield
        }()
        prepTimeLabel = {
            let label = UILabel()
            label.text = "Needed Preperation Time"
            label.font = UIFont.init(name: "Rubik", size: 16.26)
            label.textColor = UIColor("#008464")
            return label
        }()
        timeSlider = {
            let slider = UISlider()
            slider.maximumValue = 120
            slider.minimumValue = 5
            slider.minimumTrackTintColor = UIColor.blue
            slider.maximumTrackTintColor = UIColor.gray
            let image = UIImageView(image: UIImage(named: "small-alarm-clock"))
//            image.draw(CGRect(x: 0, y: 0, width: 20, height: 20))
//            image.sizeThatFits(CGSize(width: 30, height: 30))
//            image.frame.size.width = 20
//            image.frame.size.height = 20
            image.clipsToBounds = true
            slider.setThumbImage(image.image, for: .normal)
           return slider
        }()
        setAlarmButton = {
            let button = UIButton()
            button.setTitle("Set Alarm", for: .normal)
            button.backgroundColor = UIColor("#6B00F8")
            button.layer.shadowRadius = 5.0
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.cornerRadius = 5.0
            return button
        }()
        
        
        super.init(frame: frame)
        backgroundColor = UIColor.white
        addSubview(currentLocationButton)
        addSubview(leftDivider)
        addSubview(dividerImageView)
        addSubview(rightDivider)
        addSubview(streetAddressTextField)
        addSubview(cityTextField)
        addSubview(stateTextField)
        addSubview(zipCodeTextField)
        addSubview(prepTimeLabel)
        addSubview(timeSlider)
        addSubview(setAlarmButton)
        
        dividerImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(42)
            make.top.equalToSuperview().offset(130)
        }
        
        
        currentLocationButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(40)
            make.left.right.equalTo(self.safeAreaLayoutGuide).inset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
        }

        leftDivider.snp.makeConstraints { (make) in
            make.right.equalTo(dividerImageView.snp.left).inset(-30)
            make.centerY.equalTo(dividerImageView)
            make.width.equalToSuperview().dividedBy(2.3)
            //             make.right.equalTo(dividerImageView.snp.left).offset(-20)
        }
        rightDivider.snp.makeConstraints { (make) in
            make.left.equalTo(dividerImageView.snp.right).inset(-30)
            make.centerY.equalTo(dividerImageView)
            make.width.equalToSuperview().dividedBy(2.3)
            //            make.left.equalTo(dividerImageView.snp.right).offset(20)
            
            //            make.width.equalTo(98)
        }
        
        streetAddressTextField.snp.makeConstraints { (make) in
            make.left.equalTo(self.safeAreaLayoutGuide).inset(30)
            make.top.equalTo(dividerImageView.snp.bottom).offset(15)
            //            make.height.width.equalTo(50)
            make.width.equalTo(self.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(60)
        }
        
        cityTextField.snp.makeConstraints { (make) in
            make.top.equalTo(streetAddressTextField.snp.bottom).offset(15)
            make.left.equalTo(streetAddressTextField)
            make.width.equalTo(streetAddressTextField)
            make.height.equalTo(60)
        }
        
        stateTextField.snp.makeConstraints { (make) in
            make.top.equalTo(cityTextField.snp.bottom).offset(15)
            make.left.equalTo(cityTextField)
            make.width.equalTo(cityTextField.snp.width).dividedBy(1.6)
            make.height.equalTo(60)
        }
        
        zipCodeTextField.snp.makeConstraints { (make) in
            make.top.equalTo(stateTextField)
            make.left.equalTo(stateTextField.snp.right).offset(15)
            make.right.equalTo(cityTextField)
            make.height.equalTo(60)
        }
        
        setAlarmButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(145).multipliedBy(2)
            make.height.equalTo(50)
        }
        
        prepTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(stateTextField.snp.bottom).offset(35)
            make.left.equalTo(self.safeAreaLayoutGuide).inset(30)
        }
        timeSlider.snp.makeConstraints { (make) in
           make.top.equalTo(prepTimeLabel.snp.bottom).offset(20)
//            make.bottom.equalTo(setAlarmButton.snp.top).offset(-40)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(40)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
