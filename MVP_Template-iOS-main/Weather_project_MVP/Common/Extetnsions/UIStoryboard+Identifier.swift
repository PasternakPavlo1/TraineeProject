//
//  UIStoryboard+Identifier.swift
//  Weather_project_MVP
//
//  Created by Oleh on 13.04.2021.
//

import UIKit

// MARK: - UIStoryboard
extension UIStoryboard {
    var identifier: String {
        return String(describing: self)
    }
}
