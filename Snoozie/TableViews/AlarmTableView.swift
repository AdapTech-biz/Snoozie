//
//  AlarmTableView.swift
//  Snoozie
//
//  Created by Xavier Davis on 3/27/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit

class AlarmTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: UITableView.Style.grouped)
        register(AlarmTableCell.self, forCellReuseIdentifier: "AlarmCell")
        register(AlarmsTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "AlarmsHeader")
        delegate = self
        dataSource = self
        allowsSelection = false
    }
    
    func setRowHeight(){
        rowHeight = 100.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

extension AlarmTableView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath) as! AlarmTableCell
        return tableCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Test"
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = dequeueReusableHeaderFooterView(withIdentifier: "AlarmsHeader") as! AlarmsTableViewHeaderView
        switch section {
        case 0:
            
            header.alarmTypeLabel.text = "Smart Alarm"
        default:
            header.alarmTypeLabel.text = "Classic Alarm"
        }
        return header
    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
   
    

    
}
