//
//  AuthProvider.swift
//  Template_project
//
//  Created by Volodymyr Ilkiv on 20.08.2020.
//  Copyright © 2020 Oleh. All rights reserved.
//

import Foundation
import Moya

enum AuthProvider {
    
//    case signUp(parameters: SignUpParameters)
//    case signIn(parameters: SignInParameters)
//    case verificationCode(email: String, code: Int)
//    case resendCode(email: String)
//    case resetPassword(email: String)
//    case confirmResetPassword(email: String, code: Int, newPassword: String)
//    case refreshToken(parameters: SignInParameters)
//    case facebookSignIn(credentials: SocialCredentialsModel)
//    case googleSignIn(credentials: SocialCredentialsModel)
//    case appleSignIn(credentials: SocialCredentialsModel)
}

extension AuthProvider: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://api.dev.cannabotech.com/api/Account")!
    }
    
    var path: String {
//        switch self {
//        case .signUp:
//            return "sign-up"
//        case .signIn:
//            return "sign-in"
//        case .verificationCode:
//            return "confirm"
//        case .resendCode:
//            return "confirm/resend"
//        case .resetPassword:
//            return "password-reset"
//        case .refreshToken:
//            return "sign-in/refresh"
//        case .confirmResetPassword:
//            return "password-reset/confirm"
//        case .facebookSignIn:
//            return "sign-in/facebook"
//        case .googleSignIn:
//            return "sign-in/google"
//        case .appleSignIn:
//            return "sign-in/appleId"
//        }
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
//        switch self {
//        case .signUp(let signUpParameters):
//            return .requestJSONEncodable(signUpParameters)
//        case .signIn(let signInParameters):
//            return .requestJSONEncodable(signInParameters)
//        case let .verificationCode(email, code):
//            let parameters: [String: Any] = [
//                "email": email,
//                "code": code
//            ]
//            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
//        case let .resendCode(email):
//            let parameters: [String: Any] = [
//                "email": email
//            ]
//            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
//        case let .resetPassword(email):
//            let parameters: [String: Any] = [
//                "email": email
//            ]
//            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
//        case let .refreshToken(signInParameters):
//            return .requestJSONEncodable(signInParameters)
//        case let .confirmResetPassword(email, code, newPassword):
//            let parameters: [String: Any] = [
//                "email": email,
//                "code": code,
//                "newPassword": newPassword
//            ]
//            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
//
//        case .facebookSignIn(let credentials),
//             .googleSignIn(let credentials),
//             .appleSignIn(let credentials):
//            return .requestJSONEncodable(credentials)
//        }
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
