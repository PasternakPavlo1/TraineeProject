//
//  UABuilder.swift
//  Weather_project_MVP
//
//  Created by Володимир Ільків on 23.06.2020.
//  Copyright © 2020 Oleh. All rights reserved.
//

import UIKit

// MARK: - Public methods
func darwinVersion() -> String {
    var sysinfo = utsname()
    uname(&sysinfo)
    let data = Data(bytes: &sysinfo.release, count: Int(_SYS_NAMELEN))
    // swiftlint:disable variable_name
    let dv = String(bytes: data, encoding: .ascii)!
        .trimmingCharacters(in: .controlCharacters)
    return "Darwin/\(dv)"
}

func CFNetworkVersion() -> String {
    let dictionary = Bundle(identifier: "com.apple.CFNetwork")?.infoDictionary!
    let version = dictionary?["CFBundleShortVersionString"] as! String
    return "CFNetwork/\(version)"
}

func deviceVersion() -> String {
    let currentDevice = UIDevice.current
    return "\(currentDevice.systemName)/\(currentDevice.systemVersion)"
}

func deviceName() -> String {
    var sysinfo = utsname()
    uname(&sysinfo)
    let data = Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN))
    return String(bytes: data, encoding: .ascii)!
        .trimmingCharacters(in: .controlCharacters)
}

func appNameAndVersion() -> String {
    let dictionary = Bundle.main.infoDictionary!
    let version = dictionary["CFBundleShortVersionString"] as! String
    let name = dictionary["CFBundleName"] as! String
    return "\(name)/\(version)"
}

func UAString() -> String {
    return "\(appNameAndVersion()) \(deviceName()) \(deviceVersion()) \(CFNetworkVersion()) \(darwinVersion())"
}
