//
//  CityElementModel.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 23.06.2022.
//

import Foundation

// MARK: - CityModelElement
struct CityElementModel: Codable {
    // swiftlint:disable variable_name
    let id: Int
    let name, state, country: String
    let coord: CoordinateModel
}
