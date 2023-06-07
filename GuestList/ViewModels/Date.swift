//
//  Date.swift
//  GuestList
//
//  Created by Tito Arias on 15/05/2023.
//

import Foundation
extension Date {
    func localDate() -> Date {
        let nowUTC = Date()
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowUTC))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: nowUTC) else {
            return Date()
        }
        return localDate
    }

    func currentTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        let localDate = Date(timeInterval: seconds, since: self)
        return localDate
    }

    func removeTime() -> Date {
        let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self))!
        let dateWithoutTime = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: date)!
        return dateWithoutTime
    }
}
