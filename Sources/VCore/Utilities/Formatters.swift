//
//  File.swift
//  
//
//  Created by Victor Melo on 12/08/20.
//

import Foundation

extension Formatter {
    
    static var currency: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.isLenient = true
        return nf
    }
}
