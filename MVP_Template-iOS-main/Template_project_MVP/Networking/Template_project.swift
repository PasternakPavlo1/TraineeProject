//
//  Template_project.swift
//  Template_project
//
//  Created by Володимир Ільків on 24.06.2020.
//  Copyright © 2020 Oleh. All rights reserved.
//

import Moya

struct Template_project {

    static let shared = Template_project()

    let network: TemplateNetwork
    let auth: AuthNetwork

    private init() {

        // TODO: Test this config for possibility to get right logs
        let config = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let loggerPlugin = NetworkLoggerPlugin(configuration: config)

        let converter = JSONDataConverterService()

        network = TemplateNetwork(
            converter: converter,
            plugins: [loggerPlugin])
        
        auth = AuthNetwork(
            converter: converter,
            plugins: [loggerPlugin])
    }
}
