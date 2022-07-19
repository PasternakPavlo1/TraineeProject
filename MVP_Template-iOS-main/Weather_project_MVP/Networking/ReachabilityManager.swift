//
//  ReachabilityManager.swift
//  Weather_project_MVP
//
//  Created by Oleh on 30.06.2020.
//  Copyright © 2020 Oleh. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - ReachabilityManagerDelegate
protocol ReachabilityManagerDelegate: AnyObject {
    func statusChanged(isReachable: Bool)
}

final class ReachabilityManager {
    
    // MARK: - Private properties
    private let reachabilityManager = NetworkReachabilityManager.default
    
    // MARK: - Public properties
    weak var delegate: ReachabilityManagerDelegate?
    
    // MARK: - Lifecycle
    init() {
        self.setupManager()
    }
    
    // MARK: - Private methods
    private func setupManager() {
        reachabilityManager?.startListening(onUpdatePerforming: { status in
            self.delegate?.statusChanged(isReachable: status != .notReachable)
        })
    }
}
