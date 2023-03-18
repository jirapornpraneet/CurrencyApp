//
//  Date+Extension.swift
//  CurrencyApp
//
//  Created by Piesoft on 18/3/2566 BE.
//

import Foundation

extension Date {
    func toString(format: String = "d/M/yy HH:mm", style: DateFormatter.Style = .short, local: Locale = Locale(identifier: "en_US_POSIX"), calender: Calendar = .current) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        formatter.dateFormat = format
        formatter.locale = local
        formatter.calendar = calender
        return formatter.string(from: self)
    }
}
