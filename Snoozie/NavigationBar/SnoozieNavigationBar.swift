//
//  SnoozieNavigationBar.swift
//  Snoozie
//
//  Created by Xavier Davis on 3/30/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit

class SnoozieNavigationBar: UINavigationBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        barTintColor = UIColor("#6200EE")
        items = [CreateAlarmNavigationItem(title: "Alarms"), CreateAlarmNavigationItem(title: "New Alarm"), CreateAlarmNavigationItem(title: "End Point"),
                CreateAlarmNavigationItem(title: "Start Point"), CreateAlarmNavigationItem(title: "Review Alarm")]
        delegate = NavigationViewController()
        pushItem(CreateAlarmNavigationItem(title: "New Alarm"), animated: true)
        
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
   
    
}
extension SnoozieNavigationBar : UINavigationBarDelegate{
    
}
