//
//  WeatherCurrentModel.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 30.06.2022.
//

import Foundation

// MARK: - CurrentModel
struct CurrentModel: Codable {
    // swiftlint:disable variable_name
    let dt: Int
    let temp: Double
    let weather: [WeatherModel]
}
