//
//  Extensions.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-17.
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        return trimmingCharacters(in:.whitespacesAndNewlines).isEmpty
    }
}

// Date extensions

extension Date {
    var isToday : Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(self)
    }
    
    var isTomorrow : Bool {
        let calendar = Calendar.current
        return calendar.isDateInTomorrow(self)
    }
    
    var dateComponents: DateComponents {
        Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self)
    }
}
