//
//  WeatherTempModel.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 30.06.2022.
//

import Foundation

// MARK: - TempModel
struct TempModel: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}
