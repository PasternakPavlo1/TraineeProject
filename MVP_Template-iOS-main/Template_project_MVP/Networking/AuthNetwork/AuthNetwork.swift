//
//  AuthNetwork.swift
//  Template_project
//
//  Created by Volodymyr Ilkiv on 20.08.2020.
//  Copyright © 2020 Oleh. All rights reserved.
//

import Moya

final class AuthNetwork: Networkable {

    let provider: MoyaProvider<AuthProvider>
    let dataConverter: JSONDataConverterService

    init(converter: JSONDataConverterService,
         plugins: [PluginType],
         interceptor: EnvironmentInterceptor = EnvironmentInterceptor()) {
        self.dataConverter = converter
        let session = Session(startRequestsImmediately: false, interceptor: interceptor)
        let provider = MoyaProvider<AuthProvider>(session: session, plugins: plugins)
        self.provider = provider
    }

//    func signUp(with parameters: SignUpParameters) -> TemplatePromise<Data> {
//        return execute(request: .signUp(parameters: parameters))
//    }
//
//    func signIn(with parameters: SignInParameters) -> TemplatePromise<LoginResponse> {
//        return executeAndMap(request: .signIn(parameters: parameters))
//    }
//
//    func verificationCode(with email: String, code: Int) -> TemplatePromise<Data> {
//        return execute(request: .verificationCode(email: email, code: code))
//    }
//
//    func resendCode(with email: String) -> TemplatePromise<Data> {
//        return execute(request: .resendCode(email: email))
//    }
//
//    func resetPassword(email: String) -> TemplatePromise<Data> {
//        return execute(request: .resetPassword(email: email))
//    }
//
//    func confirmResetPassword(email: String, code: Int, newPassword: String) -> TemplatePromise<Data> {
//        return execute(request: .confirmResetPassword(email: email, code: code, newPassword: newPassword))
//    }
//
//    func refreshToken(with parameters: SignInParameters) ->  TemplatePromise<LoginResponse> {
//        return executeAndMap(request: .refreshToken(parameters: parameters))
//    }
//    
//    func facebookSignIn(credentials: SocialCredentialsModel) -> TemplatePromise<LoginResponse> {
//        return executeAndMap(request: .facebookSignIn(credentials: credentials))
//    }
//    
//    func googleSignIn(credentials: SocialCredentialsModel) -> TemplatePromise<LoginResponse> {
//        return executeAndMap(request: .googleSignIn(credentials: credentials))
//    }
//    
//    func appleSignIn(credentials: SocialCredentialsModel) -> TemplatePromise<LoginResponse> {
//        return executeAndMap(request: .appleSignIn(credentials: credentials))
//    }
}
