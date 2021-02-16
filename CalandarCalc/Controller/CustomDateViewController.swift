//
//  CustomDateViewController.swift
//  CalandarCalc
//
//  Created by Angelina Olmedo on 2/16/21.
//

import Foundation
import UIKit

class CustomDateViewController: UIViewController {
    
    // connected to each of the date pickers
    @IBOutlet weak var dayOnePicker: UIDatePicker!
    @IBOutlet weak var dayTwoPicker: UIDatePicker!
    @IBOutlet weak var calculateDateButton: UIButton!
    
    // you can make the helper function dateFormatter() static to avoid having to create a new instance of this class
    var calendarBrain = CalendarBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateDateButton.layer.cornerRadius = calculateDateButton.frame.height/2
    }
    
    // same as in DateViewController
    @IBAction func calculateDateButton(_ sender: Any) {
        performSegue(withIdentifier: K.resultSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.resultSegue {
            // we can use the same logic here as in DateViewController
            let destinationVC = segue.destination as! ResultsViewController
            
            // set up the result string as "There are __ days between DAY1 and DAY2"
            
            // get day 1 from dayOnePicker
            let dayOne = dayOnePicker.date
            
            // get day 2 from dayTwoPicker
            let dayTwo = dayTwoPicker.date
            
            // find the time between day 1 and day 2
            var timeBetween = Int( dayTwo.timeIntervalSince(dayOne).rounded()) // rounded to whole seconds
            
            // if timeBetween is negative, the dates are in the wrong order and should be reversed
            if timeBetween < 0 {
                timeBetween = Int(dayOne.timeIntervalSince(dayTwo).rounded())
            }
            
            //now convert timeBetween from seconds to days
            timeBetween = calendarBrain.calculateDaysFromSeconds(Seconds: timeBetween)
            
            // format result
            destinationVC.result = "There are \(timeBetween) days between \(calendarBrain.dateFormatter(date: dayOne)) and \(calendarBrain.dateFormatter(date: dayTwo))"
        }
    }
}
