//
//  File.swift
//  
//
//  Created by Victor Melo on 12/08/20.
//

import Foundation

extension Date {
    
    var isLastDayOfMonth: Bool {
        let lastMonthDay = Calendar.current.dateInterval(of: .month, for: self)?.lastDay
    
        return Calendar.current.component(.day, from: self) == lastMonthDay
    }
    
    var isoFormatted: String {
        let dateFormatter = DateFormatter()
        let enUSPosixLocale = Locale(identifier: "en_US_POSIX")
        dateFormatter.locale = enUSPosixLocale
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.calendar = Calendar.current
        return dateFormatter.string(from: self)
    }
    
    /// Return seconds between dates
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
    
}

extension DateInterval {
    var lastDay: Int? {
        Calendar.current.dateComponents([.day], from: start, to: end).day
    }
}
