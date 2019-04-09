//
//  DaysOfWeekImageView.swift
//  Snoozie
//
//  Created by Xavier Davis on 4/1/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit

class DaysOfWeekImageView: UIView {
    
    var daysOfWeekButtonArray : [UIButton]
    
    override init(frame: CGRect) {
        daysOfWeekButtonArray = {
            var array = [UIButton]()
            for day in DaysofWeek.allDays{
                let image = day.dayImage
                let button = UIButton()
                button.setImage(image, for: .normal)
                button.tag = day.dateComponentValue
                button.alpha = 0.2
                array.append(button)
            }
            return array


        }()
        
        super.init(frame: frame)
        for image in daysOfWeekButtonArray{
            addSubview(image)
        }
        daysOfWeekButtonArray.first?.snp.makeConstraints({ (make) in
            make.centerY.equalToSuperview()
             make.height.width.equalTo(45)
            make.left.equalToSuperview().inset(5)
            
        })
        
        for index in 1...daysOfWeekButtonArray.count-1{
            daysOfWeekButtonArray[index].snp.makeConstraints { (make) in
                make.left.equalTo(daysOfWeekButtonArray[index-1].snp.right).offset(15)
                make.height.width.equalTo(45)
                make.centerY.equalToSuperview()
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
