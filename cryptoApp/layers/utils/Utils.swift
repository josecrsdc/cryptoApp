//
//  Utils.swift
//  cryptoApp
//
//  Created by Jose carlos Rodriguez on 23/6/22.
//

import Foundation
import SwiftUI

func decimalFormat(_ num: String) -> String {
    let numDoble = Double(num) ?? 0.0
    let result = String(format: "%.4f", numDoble)
    return result
    
}

// Dismiss the keyboard
func dismissKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}


// Colors

struct Styles {
    
    static let colorHeader: UIColor                 = UIColor(red: 0.24, green: 0.12, blue: 0.28, alpha: 1.00)
    static let colorOnHeader: UIColor               = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
    static let colorSurface: UIColor                = UIColor(red: 0.42, green: 0.07, blue: 0.46, alpha: 1.00)
    static let colorOnSurface: UIColor              = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
    static let colorBackground: UIColor             = UIColor(red: 0.16, green: 0.14, blue: 0.20, alpha: 1.00)
    static let colorOnBackground: UIColor           = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
}
