//
//  Collection+SafeSubscript.swift
//  Template_project_MVP
//
//  Created by Oleh on 13.04.2021.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
