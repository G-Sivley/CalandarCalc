//
//  CalanedarBrain.swift
//  CalandarCalc
//
//  Created by Grant Sivley on 2/3/21.
//

import UIKit

struct CalendarBrain {
    var pickerCount: [String] = []
    
    // calculates how many seconds from days
    func calculateSecondsFromDays(Days: Double) -> Double {
        return Days * K.secondsInADay
    }
    
    // the reverse of the previous function; get days from seconds by dividing by seconds in a day
    func calculateDaysFromSeconds(Seconds: Int) -> Int {
        return Seconds / Int(K.secondsInADay)
    }
    
    // takes a time interval and turns it into formatted hours minutes and seconds
    func secondsToHoursMinutesSeconds (seconds : Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .full
        
        // bug that the interval would be at 59 and be a minute less
        var interval = seconds
        if interval % 60 != 0 {
            interval += 1
        }
    
        let formattedString = formatter.string(from: TimeInterval(interval))!
        
        return formattedString
        
        
    }
    
    // formats the date in a string as seen in the comment below
    func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        let template = "EE, MMM d, yyyy" // Mon, Feb 15, 2021
        dateFormatter.setLocalizedDateFormatFromTemplate(template)

        // US English Locale (en_US)
        dateFormatter.locale = Locale(identifier: "en_US")
        return "\(dateFormatter.string(from: date))"
    }
    
    // makes list for picker on the DateView. This shows 365 possible days away.
    mutating func fillPickerCount() {
        for number in 1...K.pickerRows {
            pickerCount.append("\(number)")
        }
    }
}
