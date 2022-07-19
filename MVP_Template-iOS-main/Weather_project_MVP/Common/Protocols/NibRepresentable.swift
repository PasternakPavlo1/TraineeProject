//
//  NibRepresentable.swift
//  Weather_project_MVP
//
//  Created by Oleh on 13.04.2021.
//

import UIKit

// MARK: - NibRepresentable
protocol NibRepresentable {
    static var nib: UINib { get }
    static var identifier: String { get }
}
