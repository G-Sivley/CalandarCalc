//
//  CalanedarBrain.swift
//  CalandarCalc
//
//  Created by Grant Sivley on 2/3/21.
//

import UIKit

struct CalendarBrain {
    var pickerCount: [String] = []
    
    func calculateSecondsFromDays(Days: Double) -> Double {
        return Days * K.secondsInADay
    }
    
    func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        
        
        // US English Locale (en_US)
        dateFormatter.locale = Locale(identifier: "en_US")
        return "\(dateFormatter.string(from: date))"
    }
    
    mutating func fillPickerCount() {
        for number in 1...365 {
            pickerCount.append("\(number)")
        }
    }
}
