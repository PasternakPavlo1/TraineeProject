//
//  Netowrkable.swift
//  Template_project
//
//  Created by Володимир Ільків on 23.06.2020.
//  Copyright © 2020 Oleh. All rights reserved.
//

import Moya
import PromiseKit

typealias TemplatePromise<T> = Promise<T>

protocol Networkable {
    // swiftlint:disable type_name
    associatedtype T: TargetType
    // swiftlint:enable type_name
    var provider: MoyaProvider<T> { get }
    var dataConverter: JSONDataConverterService { get }
}

extension Networkable {

    func execute(request: T) -> Promise<Data> {
        let promise = TemplatePromise<Data>.pending()

        self.provider.request(request) { result in
            switch result {
            case .success(let moyaResponse):
                promise.resolver.fulfill(moyaResponse.data)
            case .failure(let error):
                promise.resolver.reject(error)
            }
        }
        return promise.promise
    }

    func executeAndMap<U: Decodable>(request: T) -> Promise<U> {
        return execute(request: request).compactMap(dataConverter.getParser())
    }
}
