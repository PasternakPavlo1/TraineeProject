//
//  TimeHelper.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 06.07.2022.
//

import Foundation

// MARK: - TimeFormat
enum TimeFormat: String {
    case day = "EEE"
    case hour = "HH"
}

// MARK: - TimeHelper
final class TimeHelper {
    
    class func getDateString(by timestampeDate: Int, with format: TimeFormat) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestampeDate))
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.locale = .current
        return formatter.string(from: date)
    }
}
