//
//  UIViewController+NibRepresentable.swift
//  Template_project_MVP
//
//  Created by Oleh on 13.04.2021.
//

import UIKit

extension UIViewController: NibRepresentable {
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    class var identifier: String {
        return String(describing: self)
    }
}
