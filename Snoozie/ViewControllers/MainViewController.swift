//
//  ViewController.swift
//  Snoozie
//
//  Created by Xavier Davis on 3/27/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit
import UserNotifications
import AVFoundation
import TimeIntervals

class MainViewController: UIViewController {
    var mainView = MainView()
    var noteSoundEffect : AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }


}

extension MainViewController: UNUserNotificationCenterDelegate{
    
    
    //MARK: UserNotificationCenter Delegate Methods
    ///////////////////////////////////////////////////////////////////
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Play sound and show alert to the user
        completionHandler([.alert,.sound])
        let alarmAlertVC = AlarmAlertViewController()
        alarmAlertVC.noteSoundEffect = noteSoundEffect
        alarmAlertVC.notificationRequest = notification.request
        
//        let url = Bundle.main.url(forResource: "analog-watch-alarm_daniel-simion", withExtension:"wav")!
       
        
        present(alarmAlertVC, animated: true, completion: {
            alarmAlertVC.alarmTitle.text = notification.request.content.userInfo["title"] as? String
            alarmAlertVC.alarmTime.text = notification.request.content.userInfo["time"] as? String
        })
        
        
//        do {
//
//            noteSoundEffect = try AVAudioPlayer(contentsOf: url)
//            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
//            //            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
//            try AVAudioSession.sharedInstance().setActive(true)
//            noteSoundEffect?.play()
//            noteSoundEffect?.setVolume(1, fadeDuration: 3.0)
//            noteSoundEffect?.numberOfLoops = -1
//            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
//
//        } catch {
//            print(error.localizedDescription)
//        }
        
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        switch response.actionIdentifier {
        case "STOP":
            print("Stop action seleceted...")
            noteSoundEffect?.stop()
            
        default:
            
            print("Snooze button selected...")
            noteSoundEffect?.stop()
            let  snoozeDate = Date() + 5.minutes
            let id = response.notification.request.identifier
            let content = response.notification.request.content
            let triggerDate = Calendar.current.dateComponents([.weekday,.hour,.minute,.second,], from: snoozeDate)
            let trigger =  UNCalendarNotificationTrigger.init(dateMatching: triggerDate, repeats: false)
            let request = UNNotificationRequest(identifier: id + " Snooze Reminder", content: content, trigger: trigger)
            center.add(request) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                    fatalError()
                }else{
                    print("Snooze set for 5 mins")
                }
            }
            
            
        }
        
        completionHandler()
    }
    
}


