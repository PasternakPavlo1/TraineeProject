//
//  ModitProvider.swift
//  Weather_project_MVP
//
//  Created by Володимир Ільків on 24.06.2020.
//  Copyright © 2020 Oleh. All rights reserved.
//

import Moya

// MARK: - WeatherProjectProvider
enum WeatherProjectProvider {
    case getWeather(longtitude: Double, latitude: Double)
}

extension WeatherProjectProvider: TargetType {
    
    // MARK: - Public properties
    var baseURL: URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/")!
    }
    
    var path: String {
        switch self {
        case .getWeather:
            return "onecall"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getWeather:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getWeather(let longtitude, let latitude):
            let parameters: [String: Any] = [
                "lon": longtitude,
                "lat": latitude,
                "exclude": "minutely",
                "appid": "e4ade9ccb453fda961ee12bf66c312d9",
                "units": "metric"
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
            
        }
    }
    
    var headers: [String: String]? {
        var parameters: [String: String] = [
            "Content-Type": "application/json",
            "Accept": "*/*"
        ]
        parameters["Authorization"] = "Bearer " + (UserDetailsStore.accessToken ?? "")
        return parameters
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}
