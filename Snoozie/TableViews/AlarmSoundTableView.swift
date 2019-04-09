//
//  AlarmSoundTable.swift
//  Snoozie
//
//  Created by Xavier Davis on 3/28/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit

class AlarmSoundTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        register(AlarmSoundCell.self, forCellReuseIdentifier: "AlarmSoundCell")
        dataSource = self
        delegate = self
        separatorColor = UIColor.init("#c1d9ff")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
extension AlarmSoundTableView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "AlarmSoundCell", for: indexPath)
//        tableView.frame.size.height = tableView.contentSize.height
        let selectedCellView = UIView()
        selectedCellView.backgroundColor = UIColor.init("#F1EBFD")
        cell.selectedBackgroundView = selectedCellView
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    

   
    
}
