//
//  AddressResultTableViewCell.swift
//  Snoozie
//
//  Created by Xavier Davis on 4/6/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit

class AddressResultTableViewCell : UITableViewCell {
    var streetAddress : UILabel
    var cityStateZip : UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        streetAddress = {
            let label = UILabel()
            label.text = "123 Street Ave."
             label.textColor = UIColor.black
            return label
        }()
        cityStateZip = {
            let label = UILabel()
            label.text = " City, St 12345"
             label.textColor = UIColor.black
            return label
        }()
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "addressResult")
        contentView.addSubview(streetAddress)
        contentView.addSubview(cityStateZip)
        contentView.backgroundColor = UIColor.white
        
        streetAddress.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
        }
        cityStateZip.snp.makeConstraints { (make) in
            make.top.equalTo(streetAddress.snp.bottom).offset(5)
            make.left.equalTo(streetAddress)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
