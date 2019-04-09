//
//  NavigationTitleView.swift
//  Snoozie
//
//  Created by Xavier Davis on 3/30/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit

class NavigationTitleView : UIView{
    var appNameTitle : UILabel
    var currentScreenTitle : UILabel
    
    override init(frame: CGRect) {
        appNameTitle = {
            let label = UILabel()
            label.text = "Snoozie"
            label.font = UIFont.init(name: "Rubik", size: 16)
            label.font = label.font.withSize(12)
            label.textColor = UIColor("#008464")
            return label
        }()
        
        currentScreenTitle = {
            let label = UILabel()
            label.text = ""
            label.font = UIFont.init(name: "Roboto", size: 34)
            label.font = label.font.withSize(20)
            label.textColor = UIColor("#03DAC4")
            return label
        }()
        super.init(frame: frame)
        addSubview(appNameTitle)
        addSubview(currentScreenTitle)
        
        appNameTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
        }
        currentScreenTitle.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(appNameTitle.snp.bottom)
            
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

}
