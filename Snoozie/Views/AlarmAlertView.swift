//
//  AlarmAlertView.swift
//  Snoozie
//
//  Created by Xavier Davis on 4/3/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

class AlarmAlertView : UIView{
    
    var alarmTitle : UILabel
    var alarmClockImageView : UIImageView
    var alarmTime : UILabel
    var stopButton : UIButton
    var snoozeButton : UIButton
    
    override init(frame: CGRect) {
        alarmTitle = {
            let label = UILabel()
            label.text = "Alarm Title"
            label.textColor = UIColor.init("#6B00F8")
            label.font = UIFont(name: "Roboto", size: 48)
            label.font = label.font.withSize(48)
            return label
        }()
        alarmTime = {
            let label = UILabel()
            label.text = "17:00"
            label.textColor = UIColor.init("#03DAC4")
            label.font = UIFont(name: "Roboto", size: 34)
            label.font = label.font.withSize(34)
            return label
        }()
        alarmClockImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "alarm-clock")
            return imageView
        }()
        stopButton = {
            let button = UIButton()
            button.setTitle("STOP", for: .normal)
            button.layer.cornerRadius = 5.0
            button.backgroundColor = UIColor.init("#6B00F8")
            return button
        }()
        snoozeButton = {
            let button = UIButton()
            button.setTitle("SNOOZE", for: .normal)
            button.setTitleColor(UIColor.init("#6B00F8"), for: .normal)
            button.backgroundColor = UIColor.clear
            button.layer.cornerRadius = 5.0
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.init("#6B00F8").cgColor
            return button
        }()
        super.init(frame: frame)
        addSubview(alarmTitle)
        addSubview(alarmTime)
        addSubview(alarmClockImageView)
        addSubview(stopButton)
        addSubview(snoozeButton)
        backgroundColor = UIColor.init("#F1EBFD")
        
        alarmClockImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
        }
        alarmTitle.snp.makeConstraints { (make) in
            make.bottom.equalTo(alarmClockImageView.snp.top).offset(-30)
            make.centerX.equalToSuperview()
        }
        alarmTime.snp.makeConstraints { (make) in
            make.top.equalTo(alarmClockImageView.snp.bottom).offset(48)
            make.centerX.equalToSuperview()
        }
        stopButton.snp.makeConstraints { (make) in
            make.top.equalTo(alarmTime.snp.bottom).offset(38)
            make.height.equalTo(50)
            make.width.equalTo(169)
            make.centerX.equalToSuperview()
        }
        snoozeButton.snp.makeConstraints { (make) in
            make.top.equalTo(stopButton.snp.bottom).offset(48)
            make.height.equalTo(36)
            make.width.equalTo(96)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
