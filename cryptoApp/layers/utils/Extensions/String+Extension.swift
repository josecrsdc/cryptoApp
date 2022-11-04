//
//  String+Extension.swift
//  cryptoApp
//
//  Created by Jose carlos Rodriguez on 4/11/22.
//

import Foundation

extension String {
    func priceFormatted(numOfDecimals: Int) -> String {
        let numDoble = Double(self) ?? 0.0
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = numOfDecimals
        if let formattedTipAmount = formatter.string(from: numDoble as NSNumber) {
             return formattedTipAmount
        }
        return "0.0000"
    }
}
