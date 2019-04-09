//
//  AlarmAlertViewController.swift
//  Snoozie
//
//  Created by Xavier Davis on 4/3/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit
import UserNotifications
import AVFoundation
import TimeIntervals

class AlarmAlertViewController: UIViewController {
    var alarmAlertView = AlarmAlertView()
    var notificationRequest : UNNotificationRequest?
    var noteSoundEffect : AVAudioPlayer?
    weak var stopButton : UIButton!
    weak var snoozeButton : UIButton!
    weak var alarmTitle : UILabel!
    weak var alarmTime : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(alarmAlertView)
        stopButton = alarmAlertView.stopButton
        stopButton.addTarget(self, action: #selector(stopButtonPressed), for: .touchUpInside)
        snoozeButton = alarmAlertView.snoozeButton
        snoozeButton.addTarget(self, action: #selector(snoozeButtonPressed), for: .touchUpInside)
        alarmTime = alarmAlertView.alarmTime
        alarmTitle = alarmAlertView.alarmTitle
        alarmAlertView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        playNotificationSound()
        // Do any additional setup after loading the view.
       
    }
    
    @objc func stopButtonPressed (_ sender : UIButton){
         print("STOP button selected...")
        noteSoundEffect?.stop()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func snoozeButtonPressed (_ sender : UIButton) {
        print("Snooze button selected...")
        noteSoundEffect?.stop()
        snoozAlarm()
        dismiss(animated: true, completion: nil)

    }
    
    func snoozAlarm(){
        guard let notificationRequest = notificationRequest else {
            fatalError()
        }
        let  snoozeDate = Date() + 5.minutes
        let id = notificationRequest.identifier
        let content = notificationRequest.content
        let triggerDate = Calendar.current.dateComponents([.weekday,.hour,.minute,.second,], from: snoozeDate)
        let trigger =  UNCalendarNotificationTrigger.init(dateMatching: triggerDate, repeats: false)
        let request = UNNotificationRequest(identifier: id + " Snooze Reminder", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
                fatalError()
            }else{
                print("Snooze set for 5 mins")
            }
        }
        
    }
    
    func playNotificationSound(){
        let url = Bundle.main.url(forResource: "analog-watch-alarm_daniel-simion", withExtension:"wav")!
        do {
            
            noteSoundEffect = try AVAudioPlayer(contentsOf: url)
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
            //            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            noteSoundEffect?.play()
            noteSoundEffect?.setVolume(1, fadeDuration: 3.0)
            noteSoundEffect?.numberOfLoops = -1
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            
        } catch {
            print(error.localizedDescription)
        }
    }

}



//extension AlarmAlertViewController: UNUserNotificationCenterDelegate{
//    
//    
//    //MARK: UserNotificationCenter Delegate Methods
//    ///////////////////////////////////////////////////////////////////
//    
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                willPresent notification: UNNotification,
//                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        // Play sound and show alert to the user
//        completionHandler([.alert,.sound])
//       
//        
//        
//        present(self, animated: true, completion: nil)
//        playNotificationSound()
//       alarmTitle.text = notification.request.content.userInfo["title"] as? String
//        alarmTime.text = notification.request.content.userInfo["time"] as? String
//    }
//    
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        
//        switch response.actionIdentifier {
//        case "STOP":
//           stopButtonPressed(UIButton())
//            
//        default:
//            snoozAlarm(response: response, center: center)
//            
//        }
//        
//        completionHandler()
//    }
//    
//}
//
//
//
