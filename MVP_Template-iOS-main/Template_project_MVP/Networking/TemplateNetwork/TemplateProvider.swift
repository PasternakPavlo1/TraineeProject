//
//  ModitProvider.swift
//  Template_project
//
//  Created by Володимир Ільків on 24.06.2020.
//  Copyright © 2020 Oleh. All rights reserved.
//

import Moya

enum TemplateProvider {
    
    case testRequest

}

extension TemplateProvider: TargetType {
    
    var baseURL: URL {
        return URL(string: Environment.configuration(.serverUrl))!
    }
    
    var path: String {
        switch self {
        case .testRequest:
            return "TestRequest"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .testRequest:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .testRequest:
            return .requestPlain
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
