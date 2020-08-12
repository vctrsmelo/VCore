//
//  File.swift
//  
//
//  Created by Victor Melo on 12/08/20.
//

import Foundation

extension Double {
    func currencyFormatted() -> String {
        Formatter.currency.string(from: NSDecimalNumber(value: self)) ?? ""
    }
}
