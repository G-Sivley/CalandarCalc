//
//  ViewController.swift
//  CalandarCalc
//
//  Created by Grant Sivley on 2/3/21.
//

import UIKit

class DateViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIPickerView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var selectionLabel: UILabel!
    @IBOutlet weak var calculateButtonOutlet: UIButton!
    
    var currentDate = Date()
    var calendarBrain = CalendarBrain()
    var pickerCountSelected = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.delegate = self
        
        // Displays today's date
        dateLabel.text = calendarBrain.dateFormatter(date: currentDate)
        
        //Fills the picker with the list produced in calendar brain
        calendarBrain.fillPickerCount()
        
        // rounds the edges of the button
        calculateButtonOutlet.layer.cornerRadius = calculateButtonOutlet.frame.height/2
    }

    @IBAction func calculateDateButton(_ sender: UIButton) {
        // moves to the resultsViewController
        performSegue(withIdentifier: K.resultSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.resultSegue {
            
            // initializes the destinationVC from the destination and downcasts it to a "ResultsViewController"
            let destinationVC = segue.destination as! ResultsViewController
            
            // Calculate seconds from days using calendar brain and the number that was selected on the picker
            let seconds = calendarBrain.calculateSecondsFromDays(Days: Double(pickerCountSelected))
            
            // the new date is the current date + the number of seconds
            let newDate = currentDate.advanced(by: seconds)
            
            // creates the result variable in the ResultVC with a String format.
            destinationVC.result = calendarBrain.dateFormatter(date: newDate)
        }
        
    }

}

//MARK: - UIPickerViewDataSource

extension DateViewController: UIPickerViewDataSource {
    
    // number of components per row
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return K.pickerRows
    }
}

//MARK: - UIPickerViewDelegate

extension DateViewController: UIPickerViewDelegate {
    // using the array from calendarBrain, the picker displays the date number per row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        calendarBrain.pickerCount[row]
    }
    
    // when selected what row are they selecting (add one because 1 is indexed as 0)
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerCountSelected = row + 1
    }
}



