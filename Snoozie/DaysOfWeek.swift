//
//  DaysOfWeek.swift
//  Snoozie
//
//  Created by Xavier Davis on 4/1/19.
//  Copyright © 2019 AdapTech. All rights reserved.
//

import Foundation
import UIKit



enum DaysofWeek:CustomStringConvertible{
    
    
    
    var description: String{
        switch self {
        // Use Internationalization, as appropriate.
        case .Monday: return "Monday"
        case .Tuesday: return "Tuesday"
        case .Wednesday: return "Wednesday"
        case .Thursday: return "Thursday"
        case .Friday: return "Friday"
        case .Saturday: return "Saturday"
        case .Sunday: return "Sunday"
        }
    }
    
    var dateComponentValue : Int{
        switch self {
        case .Sunday: return 1
        case .Monday: return 2
        case .Tuesday: return 3
        case .Wednesday: return 4
        case .Thursday: return 5
        case .Friday: return 6
        case .Saturday: return 7
        }
    }
    
    case Sunday
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    
    static let allDays = [DaysofWeek.Sunday, DaysofWeek.Monday, DaysofWeek.Tuesday, DaysofWeek.Wednesday, DaysofWeek.Thursday,
                          DaysofWeek.Friday, DaysofWeek.Saturday]
    
    var dayImage : UIImage {
        switch self {
        case .Sunday: return UIImage.init(named: self.description)!
        case .Monday: return UIImage.init(named: self.description)!
        case .Tuesday: return UIImage.init(named: self.description)!
        case .Wednesday: return UIImage.init(named: self.description)!
        case .Thursday: return UIImage.init(named: self.description)!
        case .Friday: return UIImage.init(named: self.description)!
        case .Saturday: return UIImage.init(named: self.description)!
        }
    }
}
