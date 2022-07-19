//
//  UIViewController+NibRepresentable.swift
//  Weather_project_MVP
//
//  Created by Oleh on 13.04.2021.
//

import UIKit

// MARK: - NibRepresentable
extension UIViewController: NibRepresentable {
    
    // MARK: - Class properties
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    class var identifier: String {
        return String(describing: self)
    }
}
