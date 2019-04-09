//
//  AlarmSetupViewController.swift
//  Snoozie
//
//  Created by Xavier Davis on 3/28/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import UIKit



class AlarmSetupViewController: UIViewController {
    
    
    var alarmSetupView = AlarmSetupView()
    var snoozieNavigationBar = SnoozieNavigationBar()
    weak var timePicker : UIDatePicker!
    weak var alarmTitle : UITextField!
    weak var setAlarmBtn : UIButton!
    var selectedDays = Set<DaysofWeek>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
       setupOutlets()
        setupContraints()
    }
    

    
    func setupView (){
        //        let statusBarView = UIView()
        //        statusBarView.backgroundColor = UIColor.init("#6200EE")
        //        view.addSubview(statusBarView)
        view.backgroundColor = UIColor.white
        view.addSubview(snoozieNavigationBar)
        view.addSubview(alarmSetupView)
    }
    
    func setupOutlets(){
        let weekDaysButtons :  [UIButton] = alarmSetupView.weeklyScheduleImages.daysOfWeekButtonArray
        _ = weekDaysButtons.map {$0.addTarget(self, action: #selector(dayTapped), for: .touchUpInside)}
        alarmTitle = alarmSetupView.alarmName
        timePicker = alarmSetupView.timePicker
        setAlarmBtn = alarmSetupView.setBtn
        setAlarmBtn.addTarget(self, action: #selector(setAlarmBtnPressed), for: .touchUpInside)
        
    }
    
    func setupContraints()  {
//        statusBarView.snp.makeConstraints { (make) in
//            make.top.left.right.equalToSuperview()
//            make.bottom.equalTo(snoozieNavigationBar.snp.top)
//        }
        
        snoozieNavigationBar.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }
        alarmSetupView.snp.makeConstraints { (make) in
            make.top.equalTo(snoozieNavigationBar)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    @objc func dayTapped (_ sender: UIButton){
        
        UIView.animate(withDuration: 0.75) {
            if sender.alpha < 1.0{
                sender.alpha = 1.0
                self.selectedDays.insert(DaysofWeek.allDays[sender.tag-1])
            }else {
                sender.alpha = 0.2
               self.selectedDays.remove(DaysofWeek.allDays[sender.tag-1])
            }
        }

        
    }
    
    deinit {
        print("Deinit called")
    }
    
    @objc func setAlarmBtnPressed (_ sender: UIButton){
        print("set alarm")
        let isRepeatable = selectedDays.isEmpty
        var alarm = BasicAlarm(alarmName: alarmTitle.text!, weeklySchedule: selectedDays, isRepeatable: isRepeatable, date: timePicker.date)
       
//        alarm.alarmManager?.createAlarm(from: self.timePicker)
        let mainVC = MainViewController()
        alarm.alarmManager?.center.delegate =  mainVC
        present(mainVC, animated: true, completion: nil)
       
        }

}


