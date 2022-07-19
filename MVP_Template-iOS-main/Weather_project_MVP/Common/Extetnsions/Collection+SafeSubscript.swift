//
//  Collection+SafeSubscript.swift
//  Weather_project_MVP
//
//  Created by Oleh on 13.04.2021.
//

import Foundation

// MARK: - Collection
extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
