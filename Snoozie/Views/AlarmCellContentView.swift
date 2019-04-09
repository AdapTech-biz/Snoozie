//
//  AlarmCellContent.swift
//  Snoozie
//
//  Created by Xavier Davis on 3/27/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit

class AlarmCellContentView: UIView {
    
    var alarmTitle : UILabel
    var alarmTime : UILabel
    var alarmSchedule : UIImageView
    var alarmClockIcon: UIButton
    
    // -MARK: Class initializers
    
    override init(frame: CGRect) {
        alarmTitle = {
            let label = UILabel()
            label.text = "Alarm 1"
            label.textColor = UIColor.black
            label.font  = label.font.withSize(24)
            return label
        }()
        
        alarmTime = {
            let label = UILabel()
            label.text = "0900"
            label.alpha = 0.5
            label.textColor = UIColor.black
            return label
        }()
        
        alarmSchedule = {
            let imageview = UIImageView()
            imageview.image = UIImage(named: "DaysOfWeek")
            imageview.contentMode = .scaleAspectFit
            return imageview
        }()
        
        alarmClockIcon = {
            let button = UIButton()
            button.setImage(UIImage(named: "AlarmClockIcon"), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            return button
        }()
        
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    // -MARK: Class Getters
    
    func getAlarmClockIcon() -> UIButton {
        return alarmClockIcon
    }
    
    // -MARK: UI Element setup
    
    private func addSubViews(){
        addSubview(alarmTitle)
        addSubview(alarmSchedule)
        addSubview(alarmTime)
    }
    
    private func setupConstraints(){
        
        alarmTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(35)
            make.left.equalToSuperview().offset(37)
        }
        
        alarmTime.snp.makeConstraints { (make) in
            
            make.top.equalTo(alarmTitle.snp.bottom).offset(13)
            make.centerX.equalTo(alarmTitle.snp.centerX)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        alarmSchedule.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(alarmTime)
        }
    }
}
