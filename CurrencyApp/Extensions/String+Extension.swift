//
//  String+Extension.swift
//  CurrencyApp
//
//  Created by Piesoft on 18/3/2566 BE.
//

import Foundation

extension String {
    func toDate(withFormat format: String = "yyyyy-MM-dd'T'HH:mm:ssZ", local: Locale = Locale(identifier: "en_US_POSIX"), calendar: Calendar = .current, timezone: TimeZone = TimeZone(abbreviation: "GMT")!) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = timezone
        dateFormatter.locale = local
        dateFormatter.calendar = calendar
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
