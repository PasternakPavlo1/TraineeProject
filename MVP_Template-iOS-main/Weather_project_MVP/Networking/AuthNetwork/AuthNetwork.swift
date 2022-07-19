//
//  AuthNetwork.swift
//  Weather_project_MVP
//
//  Created by Volodymyr Ilkiv on 20.08.2020.
//  Copyright © 2020 Oleh. All rights reserved.
//

import Moya

// MARK: - AuthNetwork
final class AuthNetwork: Networkable {
    
    // MARK: - Public constants
    let provider: MoyaProvider<AuthProvider>
    let dataConverter: JSONDataConverterService
    
    // MARK: - Lifecycle
    init(converter: JSONDataConverterService,
         plugins: [PluginType],
         interceptor: EnvironmentInterceptor = EnvironmentInterceptor()) {
        self.dataConverter = converter
        let session = Session(startRequestsImmediately: false, interceptor: interceptor)
        let provider = MoyaProvider<AuthProvider>(session: session, plugins: plugins)
        self.provider = provider
    }
}
