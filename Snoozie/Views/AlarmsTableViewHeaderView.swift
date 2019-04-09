//
//  AlarmsTableViewHeaderView.swift
//  Snoozie
//
//  Created by Xavier Davis on 4/5/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit

class AlarmsTableViewHeaderView : UITableViewHeaderFooterView{
    var alarmTypeLabel : UILabel
    var addButton : UIButton
    
    override init(reuseIdentifier: String?) {
        alarmTypeLabel = {
            let label = UILabel()
            label.font = UIFont.init(name: "Rubik", size: 16.26)
            label.textColor = UIColor("#008464")
            return label
        }()
        
        addButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "add-alarm"), for: .normal)
            button.layer.borderWidth = 1.0
            button.layer.cornerRadius = 5.0
            button.layer.borderColor = UIColor("#6200EE").cgColor
            return button
        }()
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(alarmTypeLabel)
        contentView.addSubview(addButton)
        contentView.backgroundColor = UIColor("#F2EBFF")
        
        
        alarmTypeLabel.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        addButton.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
    }
    
  
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
