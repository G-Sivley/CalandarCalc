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
        dateLabel.text = calendarBrain.dateFormatter(date: currentDate)
        calendarBrain.fillPickerCount()

        calculateButtonOutlet.layer.cornerRadius = calculateButtonOutlet.frame.height/2
    }

    @IBAction func calculateDateButton(_ sender: UIButton) {
        
        let seconds = calendarBrain.calculateSecondsFromDays(Days: Double(pickerCountSelected))
        let newDate = currentDate.advanced(by: seconds)
        dateLabel.text = calendarBrain.dateFormatter(date: newDate)
        selectionLabel.text = "Calculated Date"
            
    }
    
}

//MARK: - UIPickerViewDataSource

extension DateViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 365
    }
}

//MARK: - UIPickerViewDelegate

extension DateViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        calendarBrain.pickerCount[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerCountSelected = row + 1
    }
}



