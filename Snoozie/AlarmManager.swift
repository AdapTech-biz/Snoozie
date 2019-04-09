//
//  Alarm.swift
//  AlarmTest
//
//  Created by Xavier Davis on 5/30/18.
//  Copyright © 2018 Xavier Davis. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import AVFoundation

class AlarmManager{
    
    let center = UNUserNotificationCenter.current()
    private var alarmModel: BasicAlarm?
    
    
    convenience init(alarmModel: BasicAlarm ) {
        self.init()
        self.alarmModel = alarmModel
        self.createAlarm()
    }
    
    private func createAlarm() {
        constructContent()
    }
    
    
   private func constructContent(){
        var notificationActions = [UNNotificationAction]()
        let content = UNMutableNotificationContent()
        guard  let alarmModel = alarmModel else {
            fatalError()
        }
    
        print("-----constructContent")
        let firstAction = makeAlertAction(withTitle: "Snooze", withIdentifier: "SNOOZE")
        notificationActions.append(firstAction)
        let secondAction = makeAlertAction(withTitle: "Decline", withIdentifier: "STOP")
        notificationActions.append(secondAction)
        
        let alarmCategory = createAlermCategory(withTitle: (alarmModel.title), actions: notificationActions)
        
        
        center.setNotificationCategories([alarmCategory])
        
        content.title = alarmModel.title
        content.body = "The alarm you set is on!"
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "analog-watch-alarm_daniel-simion.wav"))
        content.categoryIdentifier = (alarmModel.title)
        content.userInfo = ["title" : alarmModel.title,
                            "time" : alarmModel.getFormattedAlarmTime()]
    
     

        if (!alarmModel.weeklySchedule.isEmpty) {
            for day in alarmModel.weeklySchedule{
                let currentDay = day.dateComponentValue
               let trigger = setNotificationCondition(weekDay: currentDay, isRepeatable: true, alarmModel: alarmModel)
                createNotificationRequest(trigger: trigger, content: content, alarmModel: alarmModel)
            }
        }else{
            let todayDateAndTime = Date()
            var today = Calendar.current.component(Calendar.Component.weekday, from: todayDateAndTime)
            print("Today weekday # before check \(today)")
            if (alarmModel.alarmTime < todayDateAndTime){
                print("Alarm time set for past!!!")
                today = (today == 7 ? 1 : today + 1)
                print("Today weekday # after check \(today)")
            }
            
            
            let trigger = setNotificationCondition(weekDay: today, isRepeatable: alarmModel.isRepeatable, alarmModel: alarmModel)
            createNotificationRequest(trigger: trigger, content: content, alarmModel: alarmModel)
            
        }
        
    }
    
   private func makeAlertAction(withTitle title: String, withIdentifier id: String) -> UNNotificationAction{
        print("---makeAlertAction()")
        let notificationAction = UNNotificationAction(identifier: id,
                                                      title: title,
                                                      options: UNNotificationActionOptions(rawValue: 0))
        
        return notificationAction
        
    }
    
   private func setNotificationCondition(weekDay : Int, isRepeatable: Bool, alarmModel: BasicAlarm) -> UNCalendarNotificationTrigger {
        print("-----setNotificationCondition()")
        // Configure the recurring date.
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        print("trigger details -> weekday = \(weekDay), hour = \(alarmModel.alarmHour)")
        dateComponents.weekday = weekDay  // Tuesday
        dateComponents.hour =   alarmModel.alarmHour  // 14:00 hours
        dateComponents.minute = alarmModel.alarmMin
        
        // Create the trigger as a repeating event.
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: dateComponents, repeats: isRepeatable)
        print(trigger.dateComponents)
        return trigger
    }
    
    private func createNotificationRequest(trigger: UNCalendarNotificationTrigger, content: UNNotificationContent, alarmModel: BasicAlarm){
        print("---createNotificationRequest()")
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                                            content: content, trigger: trigger)
        alarmModel.notificationRequestIDs.append(uuidString)
        scheduleNotification(request: request)
    }
    
    private func scheduleNotification(request: UNNotificationRequest) {
        print("----scheduleNotification()")
        // Schedule the request with the system.
         getNotificationAccess()
        center.add(request) { (error) in
            if error != nil {
                // Handle any errors.
            }
        }

    }
    
    
    //MARK: Request Access Notification Center
    //////////////////////////////////////////////////////////////////
    
    func getNotificationAccess(){
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
            if let error = error {
                print(error)
            }else {
                print("Access granted!")
            }
        }
    }
    
    //////////////////////////////////////////////////////////////////
    
    //MARK: Construct Alarm Components
    //////////////////////////////////////////////////////////////////
    
    func createAlermCategory(withTitle title: String, actions: [UNNotificationAction]) -> UNNotificationCategory{
        
        
        let alarmCategory =
            UNNotificationCategory(identifier: title,
                                   actions: actions,
                                   intentIdentifiers: [],
                                   hiddenPreviewsBodyPlaceholder: "",
                                   options: .hiddenPreviewsShowSubtitle)
        
        return alarmCategory
        
    }
    
    func cancelFutureAlarms()  {
        guard let alarmModel = self.alarmModel else {
            print("Can not cancel alarm events")
            fatalError()
        }
        center.removePendingNotificationRequests(withIdentifiers: alarmModel.notificationRequestIDs)
    }
    
    
    
}

