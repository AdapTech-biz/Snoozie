//
//  StartPointViewController.swift
//  Snoozie
//
//  Created by Xavier Davis on 4/8/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit

class StartPointViewController: UIViewController {
    var startPointView = StartPointView()
     var snoozieNavigationBar = SnoozieNavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(startPointView)
        view.addSubview(snoozieNavigationBar)
        
        startPointView.snp.makeConstraints { (make) in
            make.top.equalTo(snoozieNavigationBar.snp.bottom)
            make.left.right.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        snoozieNavigationBar.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
