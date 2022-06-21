//
//  EnvironmentInterceptor.swift
//  Template_project
//
//  Created by Volodymyr Ilkiv on 25.08.2020.
//  Copyright © 2020 Oleh. All rights reserved.
//

import Alamofire

struct EnvironmentInterceptor: RequestInterceptor {

    func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        Log.info("🚀 Running request: \(urlRequest.httpMethod ?? "") - \(urlRequest.url?.absoluteString ?? "")")

        let authKey = "Authorization"
        let userAgentKey = "User-Agent"

        var urlRequest = urlRequest

        if urlRequest.allHTTPHeaderFields?[authKey] != nil,
            let currentUserAuth = UserDetailsStore.accessToken {
            urlRequest.setValue("Bearer " + currentUserAuth, forHTTPHeaderField: authKey)
        }
        let userAgent = UAString()
        urlRequest.setValue(userAgent, forHTTPHeaderField: userAgentKey)
        return completion(.success(urlRequest))
    }

    func retry(_ request: Request,
               for session: Session,
               dueTo error: Error,
               completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse,
            response.statusCode == 401 else {
                completion(.doNotRetry)
                return
        }
        guard let refreshToken = UserDetailsStore.refreshToken else {
            completion(.doNotRetryWithError(error))
            return
        }

//        let params = SignInParameters(refreshToken: refreshToken)
//        Template_project.shared.auth.refreshToken(with: params)
//        .done { loginResponse in
//            UserDetailsStore.accessToken = loginResponse.accessToken
//            UserDetailsStore.refreshToken = loginResponse.refreshToken
//            completion(.retry)
//        }
//        .catch { error in
//            Log.warning(error.localizedDescription)
//        }
    }
}
