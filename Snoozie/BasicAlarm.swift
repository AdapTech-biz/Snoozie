//
//  BasicAlarm.swift
//  A.M JumpStart
//
//  Created by Xavier Davis on 7/23/18.
//  Copyright © 2018 Xavier Davis. All rights reserved.
//

import Foundation

class BasicAlarm {
    
   var title = ""
    var alarmHour : Int = 0
    var alarmMin : Int = 0
    var isRepeatable : Bool = false
    var weeklySchedule = Set<DaysofWeek>()
    var alarmTime : Date
    var notificationRequestIDs = [String]()
    
    var alarmManager: AlarmManager?
//    var delegate : NewAlarmCreatedDelegate?
    
    init(alarmName : String, weeklySchedule: Set<DaysofWeek>, isRepeatable: Bool, date: Date) {
        self.title = alarmName
        self.weeklySchedule = weeklySchedule
        self.isRepeatable = isRepeatable
        self.alarmTime = date
        print(alarmTime)
        self.alarmHour = Calendar.current.component(Calendar.Component.hour, from: self.alarmTime)
        self.alarmMin = Calendar.current.component(Calendar.Component.minute, from: self.alarmTime)
        self.alarmManager = AlarmManager(alarmModel: self)

    }
    
    func getFormattedAlarmTime() -> String {
        return "\(alarmHour):\(alarmMin)"
    }
    
}
