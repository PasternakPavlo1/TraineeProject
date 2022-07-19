//
//  WeatherResponseModel.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 30.06.2022.
//

import Foundation

// MARK: - WeatherResponseModel
struct WeatherResponseModel: Codable {
    let current: CurrentModel
    let hourly: [CurrentModel]
    let daily: [DailyModel]
    
}
