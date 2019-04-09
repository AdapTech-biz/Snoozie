//
//  NavigationViewController.swift
//  Snoozie
//
//  Created by Xavier Davis on 4/5/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [MainViewController(), AlarmSetupViewController()]
        
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
extension NavigationViewController: UINavigationBarDelegate{
    
}
