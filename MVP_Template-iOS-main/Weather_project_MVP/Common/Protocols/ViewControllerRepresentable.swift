//
//  ViewControllerRepresentable.swift
//  Weather_project_MVP
//
//  Created by Oleh on 13.04.2021.
//

import UIKit

// MARK: - ViewControllerRepresentable
protocol ViewControllerRepresentable: AnyObject {
    var view: UIView! { get }
}
