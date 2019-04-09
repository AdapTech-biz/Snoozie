//
//  MainView.swift
//  Snoozie
//
//  Created by Xavier Davis on 3/27/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    var alarmTable : UITableView
    
    override init(frame: CGRect) {
        alarmTable = {
           let table = AlarmTableView()
            return table
        }()
        
        super.init(frame: frame)
        addSubview(alarmTable)
        alarmTable.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

