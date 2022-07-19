//
//  WeatherIconType.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 06.07.2022.
//

import Foundation
import UIKit
import SwiftUI

// MARK: - WeatherIconType
enum WeatherIconType: String {
    case clear = "01d"
    case clearNigt = "01n"
    case brokenClouds = "04d"
    case brokenCloudsNight = "04n"
    case fewClouds = "02d"
    case fewCloudsNight = "02n"
    case mist = "50d"
    case mistNight = "50n"
    case rain = "10d"
    case rainNight = "10n"
    case scatteredClouds = "03d"
    case scatteredCloudsNight = "03n"
    case showerRain = "09d"
    case showerRainNight = "09n"
    case snow = "13d"
    case snowNight = "13n"
    case thunderstorm = "11d"
    case thunderstormNight = "11n"
    
    // MARK: - Public propertie
    var image: UIImage {
        switch self {
        case .clear:
            return #imageLiteral(resourceName: "Clear")
        case .brokenClouds:
            return #imageLiteral(resourceName: "BrokenClouds")
        case .fewClouds:
            return #imageLiteral(resourceName: "FewClouds")
        case .mist:
            return #imageLiteral(resourceName: "Mist")
        case .rain:
            return #imageLiteral(resourceName: "Rain")
        case .scatteredClouds:
            return #imageLiteral(resourceName: "ScatteredClouds")
        case .showerRain:
            return #imageLiteral(resourceName: "ShowerRain")
        case .snow:
            return #imageLiteral(resourceName: "Snow")
        case .thunderstorm:
            return #imageLiteral(resourceName: "Thunderstorm")
        case .clearNigt:
            return #imageLiteral(resourceName: "ClearSkyNight")
        case .brokenCloudsNight:
            return #imageLiteral(resourceName: "BrokenClouds")
        case .fewCloudsNight:
            return #imageLiteral(resourceName: "FewCloudsNight")
        case .mistNight:
            return #imageLiteral(resourceName: "Mist")
        case .rainNight:
            return #imageLiteral(resourceName: "RainNight")
        case .scatteredCloudsNight:
            return #imageLiteral(resourceName: "ScatteredClouds")
        case .showerRainNight:
            return #imageLiteral(resourceName: "ShowerRain")
        case .snowNight:
            return #imageLiteral(resourceName: "Snow")
        case .thunderstormNight:
            return #imageLiteral(resourceName: "Thunderstorm")
        }
    }
}
