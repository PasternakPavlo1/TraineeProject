//
//  Log.swift
//  Weather_project_MVP
//
//  Created by Oleh on 30.03.2021.
//

import Foundation

public final class Log {
    
    // MARK: - Static methods
    /// Not so important 💜
    static func verbose(_ message: Any) {
        let appendix = "💜 VERBOSE -"
        print(appendix, message)
    }

    /// Something to debug 💚
    static func debug(_ message: Any) {
        let appendix = "💚 DEBUG -"
        print(appendix, message)
    }

    /// Good to know ℹ️
    static func info(_ message: Any) {
        let appendix = "ℹ️ INFO -"
        print(appendix, message)
    }

    /// Something bad happened ⚠️
    static func warning(_ message: Any) {
        let appendix = "⚠️ WARNING -"
        NSLog("\(appendix) \(message)")
        print(appendix, message)
    }

    /// ERROR!!!!11 ⛔️
    static func error(_ message: Any) {
        let appendix = "⛔️ ERROR -"
        NSLog("\(appendix) \(message)")
        print(appendix, message)
    }
}