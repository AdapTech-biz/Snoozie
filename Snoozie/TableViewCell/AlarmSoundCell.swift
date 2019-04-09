//
//  AlarmSoundCell.swift
//  Snoozie
//
//  Created by Xavier Davis on 3/28/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit

class AlarmSoundCell: UITableViewCell {
    
    var playIcon : UIImageView
    var soundTitle : UILabel
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        playIcon = {
            let image = UIImageView(image: UIImage(named: "play-button"))
            return image
        }()
        soundTitle = {
            let label = UILabel()
            label.text = "Sound title"
            return label
        }()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryView = UIView()
        accessoryView?.addSubview(playIcon)
        contentView.addSubview(soundTitle)
//        accessoryView?.snp.makeConstraints({ (make) in
//            make.left.top.bottom.equalToSuperview()
//        })
        playIcon.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        soundTitle.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
