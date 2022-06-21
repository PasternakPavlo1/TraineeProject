//
//  String+Localized.swift
//  Template_project_MVP
//
//  Created by Oleh on 26.03.2021.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
