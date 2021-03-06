//
//  ResultsViewController.swift
//  CalandarCalc
//
//  Created by Grant Sivley on 2/15/21.
//

import UIKit

class ResultsViewController: UIViewController {
   
    var result: String = ""
    
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    var calendarBrain = CalendarBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // button look
        returnButton.layer.cornerRadius = returnButton.frame.height/2
        
        // presents the results everytime the view is loaded.
        dateLabel.text = result
    }
    

    @IBAction func returnButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
