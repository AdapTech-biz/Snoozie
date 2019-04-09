//
//  AlarmTableCell.swift
//  Snoozie
//
//  Created by Xavier Davis on 3/27/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit

class AlarmTableCell: UITableViewCell {
    
    var alarmCellContent = AlarmCellContentView()
    var alarmIcon : UIButton!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "AlarmCell")
        contentView.addSubview(alarmCellContent)
//        contentView.backgroundColor = UIColor.green
        alarmCellContent.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        alarmIcon = alarmCellContent.getAlarmClockIcon()
        accessoryView = UIView()
        
        accessoryView?.addSubview(alarmIcon)
        alarmIcon.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
        }
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
