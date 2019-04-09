//
//  SearchAddressTableView.swift
//  Snoozie
//
//  Created by Xavier Davis on 4/6/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit

class SearchAddressTableView: UITableView {
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: UITableView.Style.plain)
        register(AddressResultTableViewCell.self, forCellReuseIdentifier: "AddressResultCell")
        layer.borderColor = UIColor("#6200EE").cgColor
        layer.borderWidth = 2.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
