//
//  UIView+NibRepresentable.swift
//  Weather_project_MVP
//
//  Created by Oleh on 26.03.2021.
//

import UIKit

// MARK: - NibRepresentable
extension UIView: NibRepresentable {
    
    // MARK: - Class properties
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    class var identifier: String {
        return String(describing: self)
    }
}

extension NibRepresentable where Self: UIView {
    static var viewFromNib: Self {
        return Bundle.main.loadNibNamed(
            Self.identifier,
            owner: nil, options: nil)?.first as! Self
    }
}
