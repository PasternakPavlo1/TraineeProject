//
//  WeatherModel.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 30.06.2022.
//

import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable {
    let main: String
    let weatherDescription: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case main
        case weatherDescription = "description"
        case icon
    }
}
