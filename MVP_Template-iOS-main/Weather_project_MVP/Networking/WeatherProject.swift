//
//  Weather_project.swift
//  Weather_project_MVP
//
//  Created by Володимир Ільків on 24.06.2020.
//  Copyright © 2020 Oleh. All rights reserved.
//

import Moya

// MARK: - WeatherProject
struct WeatherProject {

    static let shared = WeatherProject()
    
    // MARK: - Public properties
    let network: WeatherProjectNetwork
    let auth: AuthNetwork
    
    // MARK: - Lifecycle
    private init() {

        let config = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let loggerPlugin = NetworkLoggerPlugin(configuration: config)

        let converter = JSONDataConverterService()

        network = WeatherProjectNetwork(
            converter: converter,
            plugins: [loggerPlugin])
        
        auth = AuthNetwork(
            converter: converter,
            plugins: [loggerPlugin])
    }
}
