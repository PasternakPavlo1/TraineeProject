//
//  ModitNetwork.swift
//  Weather_project_MVP
//
//  Created by Володимир Ільків on 24.06.2020.
//  Copyright © 2020 Oleh. All rights reserved.
//

import Moya

// MARK: - WeatherProjectNetwork
final class WeatherProjectNetwork: Networkable {
    
    // MARK: - Public constants
    let provider: MoyaProvider<WeatherProjectProvider>
    let dataConverter: JSONDataConverterService
    
    // MARK: - Lifecycle
    init(converter: JSONDataConverterService,
         plugins: [PluginType],
         interceptor: EnvironmentInterceptor = EnvironmentInterceptor()) {
        self.dataConverter = converter
        let session = Session(startRequestsImmediately: false, interceptor: interceptor)
        let provider = MoyaProvider<WeatherProjectProvider>(session: session, plugins: plugins)
        self.provider = provider
    }
    
    // MARK: - Public method
    func getWeather(longtitude: Double, latitude: Double) -> WeatherPromise<WeatherResponseModel> {
        return executeAndMap(request: .getWeather(longtitude: longtitude, latitude: latitude))
    }
}
