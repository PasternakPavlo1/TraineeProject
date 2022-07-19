//
//  Environment.swift
//  Weather_project. MVP
//
//  Created by Denys White on 20.11.2020.
//

import Foundation

struct Environment {

    // MARK: - PlistKey
    enum PlistKey: String {
        case serverUrl = "https://api.openweathermap.org/data/2.5/"
    }

    // MARK: - Private Methods
    private static var infoDict: [String: Any] {
        if let dict = Bundle.main.infoDictionary {
            return dict
        } else {
            fatalError("Plist file not found")
        }
    }

    // MARK: - Static Methods
    static func configuration(_ key: PlistKey) -> String {
        (infoDict["App configuration"] as! [String: Any])[key.rawValue] as! String
    }
    
    static func appName() -> String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
    }
}
