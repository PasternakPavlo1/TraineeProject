//
//  StoryboardInstantiatable.swift
//  Template_project_MVP
//
//  Created by Oleh on 13.04.2021.
//

import UIKit

protocol StoryboardInstantiatable {}

extension StoryboardInstantiatable where Self: NibRepresentable {
    static func instantiateFromStoryboard(name: String = Self.identifier) -> Self {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: Self.identifier)
        // swiftlint:disable force_cast
        return viewController as! Self
        // swiftlint:enable force_cast
    }
    
    static func instantiateLaunchScreen() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: Self.identifier)
        // swiftlint:disable force_cast
        return viewController as! Self
        // swiftlint:enable force_cast
    }
}
