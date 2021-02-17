//
//  TimeViewController.swift
//  CalandarCalc
//
//  Created by Grant Sivley on 2/16/21.
//

import UIKit

class TimeViewController: UIViewController {
    
    @IBOutlet weak var timeOnePicker: UIDatePicker!
    @IBOutlet weak var timeTwoPicker: UIDatePicker!
    @IBOutlet weak var calculateTimeButton: UIButton!
    
    let calendarBrain = CalendarBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateTimeButton.layer.cornerRadius = calculateTimeButton.frame.height/2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculatePushed(_ sender: UIButton) {
        performSegue(withIdentifier: K.resultSegue, sender: self)
    }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.resultSegue {
            let destinationVC = segue.destination as! ResultsViewController
            
            let timeOne = timeOnePicker.date
            let timeTwo = timeTwoPicker.date
            
            let secondsBetween = Int(abs(timeTwo.timeIntervalSince(timeOne).rounded()))
            print(calendarBrain.secondsToHoursMinutesSeconds(seconds: secondsBetween))
            
        }
    }
}
