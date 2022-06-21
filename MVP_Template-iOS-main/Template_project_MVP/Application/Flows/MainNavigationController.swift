//
//  MainNavigationController.swift
//  Template_project. MVP
//
//  Created by Oleh on 17.03.2021.
//

import UIKit

final class MainNavigationController: UINavigationController {

    // MARK: - Private properties
    private var viewController: UIViewController {
        let viewController = TemplateViewController.instantiateFromStoryboard()
        let presenter = TemplatePresenter(view: viewController)
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
        self.viewControllers = [viewController]
    }
}
