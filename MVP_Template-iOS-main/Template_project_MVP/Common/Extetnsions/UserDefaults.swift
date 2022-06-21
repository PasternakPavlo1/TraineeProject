//
//  UserDefaults.swift
//  Template_project_MVP
//
//  Created by Oleh on 02.04.2021.
//

import Foundation

extension UserDefaults {
    var isUserAuthDataNeeded: Bool {
        get {
            return self.bool(forKey: Constants.UserDefaults.isUserAuthDataNeeded)
        }
        set {
            self.set(newValue, forKey: Constants.UserDefaults.isUserAuthDataNeeded)
        }
    }
}
