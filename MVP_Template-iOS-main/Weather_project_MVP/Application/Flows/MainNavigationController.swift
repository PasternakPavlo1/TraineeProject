//
//  MainNavigationController.swift
//  Weather_project_MVP
//
//  Created by Oleh on 17.03.2021.
//

import UIKit

final class MainNavigationController: UINavigationController {

    // MARK: - Private properties
    private var viewController: UIViewController {
        let viewController = WeatherTableViewController.instantiateFromStoryboard()
        let presenter = WeatherPresenter(tableView: viewController)
        viewController.presenter = presenter
        return viewController
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setRootViewController()
    }
    
    // MARK: - Private methods
    private func setRootViewController() {
        UINavigationBar.appearance().tintColor = .white
        self.viewControllers = [viewController]
    }
}
