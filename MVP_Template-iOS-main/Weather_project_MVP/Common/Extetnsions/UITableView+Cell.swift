//
//  UITableView+Cell.swift
//  Weather_project_MVP
//
//  Created by Oleh on 26.03.2021.
//

import UIKit

// MARK: - UITableView
extension UITableView {
    
    // MARK: - Public methods
    func dequeueCell<T: UITableViewCell>(_ type: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(
            withIdentifier: type.identifier,
            for: indexPath) as! T
    }

    func registerCell<T: UITableViewCell>( _ type: T.Type) {
        self.register(type.nib, forCellReuseIdentifier: type.identifier)
    }

    func registerHeader<T: UITableViewHeaderFooterView>(_ type: T.Type) {
        self.register(
            type.nib,
            forHeaderFooterViewReuseIdentifier: type.identifier)
    }
}
