//
//  CreateAlarmNavigationItem.swift
//  Snoozie
//
//  Created by Xavier Davis on 3/30/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit

class CreateAlarmNavigationItem : UINavigationItem {
    override init(title: String) {
        super.init(title: title)
        let newAlarmTitleView = NavigationTitleView()
        newAlarmTitleView.currentScreenTitle.text = title
        titleView = newAlarmTitleView
//        var leftBarItem = UIBarButtonItem(
//        leftBarButtonItem =
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
