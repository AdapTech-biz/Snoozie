//
//  AlarmSetupView.swift
//  Snoozie
//
//  Created by Xavier Davis on 3/28/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

class AlarmSetupView: UIView {
    
    var alarmName : UITextField
    var timePicker : UIDatePicker
    var weeklyScheduleLabel : UILabel
    var weeklyScheduleImages : DaysOfWeekImageView
    var dividerArray = [UIImageView]()
    var firstDivider : UIImageView
    var secondDivider : UIImageView
    var alarmSoundsLabel: UILabel
    var alarmSoundsTableView: AlarmSoundTableView
    var setBtn : UIButton
    
    override init(frame: CGRect) {
        alarmName = {
            let textfield = UITextField()
            textfield.text = "Alarm 1"
            textfield.borderStyle = .roundedRect
            textfield.font = UIFont.init(name: "Rubik", size: 16.26)
            textfield.textColor = UIColor("#008464")
            return textfield
        }()
        timePicker = {
            let timePicker = UIDatePicker()
            timePicker.datePickerMode = .time
            return timePicker
        }()
        weeklyScheduleLabel = {
            let label = UILabel()
            label.text = "Repeat"
            label.font = UIFont.init(name: "Rubik", size: 16.26)
            label.textColor = UIColor("#008464")
            return label
        }()
        weeklyScheduleImages = {
            let view = DaysOfWeekImageView()
           
            return view
        }()

        firstDivider = {
            let image = UIImageView(image: UIImage(named: "DividerPrimaryColor"))
            image.contentMode = .scaleAspectFit
            return image
        }()
        secondDivider = {
            let image = UIImageView(image: UIImage(named: "DividerPrimaryColor"))
            image.contentMode = .scaleAspectFit
            return image
        }()
        alarmSoundsLabel = {
            let label = UILabel()
            label.text = "Alarm Sounds"
            label.font = UIFont.init(name: "Rubik", size: 16.26)
            label.textColor = UIColor("#008464")
            return label
        }()
        alarmSoundsTableView = {
            let tableview = AlarmSoundTableView()
            return tableview
        }()
        setBtn = {
            let button = UIButton()
            button.setImage(UIImage(named: "Set-Btn"), for: .normal)
            return button
        }()
        super.init(frame: frame)
        
        addSubview(alarmName)
        addSubview(timePicker)
        addSubview(weeklyScheduleLabel)
        addSubview(weeklyScheduleImages)
        addSubview(firstDivider)
        addSubview(secondDivider)
        addSubview(alarmSoundsLabel)
        addSubview(alarmSoundsTableView)
        addSubview(setBtn)
        
        alarmName.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(113)
            make.left.equalToSuperview().offset(13)
            make.right.equalToSuperview().offset(-13)
            
        }
        timePicker.snp.makeConstraints { (make) in
            make.top.equalTo(alarmName.snp.bottom)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(200)
        }
        firstDivider.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-71)
            make.bottom.equalTo(weeklyScheduleLabel.snp.top).offset(-12)
        }
        weeklyScheduleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(timePicker.snp.bottom)
        }
        weeklyScheduleImages.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(weeklyScheduleLabel.snp.bottom).offset(30)
        }

        secondDivider.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-71)
            make.top.equalTo(weeklyScheduleImages.snp.bottom).offset(10)
        }
        alarmSoundsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(secondDivider).offset(39)
            make.left.equalToSuperview().offset(50)
        }
        setBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(145).multipliedBy(2)
        }
        alarmSoundsTableView.snp.makeConstraints { (make) in
            make.top.equalTo(alarmSoundsLabel.snp.bottom).inset(-10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalTo(setBtn.snp.top).inset(-10)
            make.centerX.equalToSuperview()
        }

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
//    func addButtonTouch(selector : Selector)  {
//        weeklyScheduleImages.addTouchToImage(tapFunc: <#T##Selector#>)
//    }
}
