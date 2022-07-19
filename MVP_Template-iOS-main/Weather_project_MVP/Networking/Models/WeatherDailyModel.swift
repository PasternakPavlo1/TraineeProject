//
//  WeatherDailyModel.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 30.06.2022.
//

import Foundation

// MARK: - DailyModel
struct DailyModel: Codable {
    // swiftlint:disable variable_name
    let dt: Int
    let temp: TempModel
    let weather: [WeatherModel]
}
