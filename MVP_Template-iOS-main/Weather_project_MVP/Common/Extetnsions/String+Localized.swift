//
//  String+Localized.swift
//  Weather_project_MVP
//
//  Created by Oleh on 26.03.2021.
//

import Foundation

// MARK: - String
extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
