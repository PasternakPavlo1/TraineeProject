//
//  AuthProvider.swift
//  Weather_project_MVP
//
//  Created by Volodymyr Ilkiv on 20.08.2020.
//  Copyright © 2020 Oleh. All rights reserved.
//

import Foundation
import Moya

// MARK: - AuthProvider
enum AuthProvider { }

extension AuthProvider: TargetType {
    
    // MARK: - Public properties
    var baseURL: URL {
        return URL(string: "https://api.dev.cannabotech.com/api/Account")!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        switch self {
        default:  return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
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
