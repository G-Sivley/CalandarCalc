//
//  K.swift
//  CalandarCalc
//
//  Created by Grant Sivley on 2/12/21.
//

import Foundation

struct K {
    static let secondsInADay: Double = 86400
    
    static let colors = [
        Colors(colors: #colorLiteral(red: 0.5058823529, green: 0.8, blue: 0.8352941176, alpha: 1)),
        Colors(colors: #colorLiteral(red: 0.6274509804, green: 0.8039215686, blue: 0.7176470588, alpha: 1)),
        Colors(colors: #colorLiteral(red: 0.7411764706, green: 0.7254901961, blue: 0.6352941176, alpha: 1)),
        Colors(colors: #colorLiteral(red: 0.8431372549, green: 0.5803921569, blue: 0.4431372549, alpha: 1)),
        Colors(colors: #colorLiteral(red: 0.6784313725, green: 0.3882352941, blue: 0.3490196078, alpha: 1))
    ]
    static let resultSegue = "goToResult"
    
    static let pickerRows = 365
}
