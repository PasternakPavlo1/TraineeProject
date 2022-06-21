//
//  NibRepresentable.swift
//  Template_project_MVP
//
//  Created by Oleh on 13.04.2021.
//

import UIKit

protocol NibRepresentable {
    static var nib: UINib { get }
    static var identifier: String { get }
}
