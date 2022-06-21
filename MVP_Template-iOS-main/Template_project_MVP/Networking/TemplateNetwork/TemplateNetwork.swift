//
//  ModitNetwork.swift
//  Template_project
//
//  Created by Володимир Ільків on 24.06.2020.
//  Copyright © 2020 Oleh. All rights reserved.
//

import Moya

final class TemplateNetwork: Networkable {

    let provider: MoyaProvider<TemplateProvider>
    let dataConverter: JSONDataConverterService

    init(converter: JSONDataConverterService,
         plugins: [PluginType],
         interceptor: EnvironmentInterceptor = EnvironmentInterceptor()) {
        self.dataConverter = converter
        let session = Session(startRequestsImmediately: false, interceptor: interceptor)
        let provider = MoyaProvider<TemplateProvider>(session: session, plugins: plugins)
        self.provider = provider
    }
    
    func getTestRequest() -> TemplatePromise<Data> {
        return executeAndMap(request: .testRequest)
    }
}
