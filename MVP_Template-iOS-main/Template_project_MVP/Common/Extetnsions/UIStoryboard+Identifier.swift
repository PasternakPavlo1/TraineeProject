//
//  UIStoryboard+Identifier.swift
//  Template_project_MVP
//
//  Created by Oleh on 13.04.2021.
//

import UIKit

extension UIStoryboard {
    var identifier: String {
        return String(describing: self)
    }
}
