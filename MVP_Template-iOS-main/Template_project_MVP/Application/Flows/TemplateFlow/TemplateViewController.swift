//
//  TemplateViewController.swift
//  Template_project. MVP
//
//  Created by Oleh on 17.03.2021.
//

import UIKit

// MARK: - TemplateViewProtocol
protocol TemplateViewProtocol: AnyObject {
    var presenter: TemplatePresenterProtocol! { get set }
}

// MARK: - TemplateViewController
final class TemplateViewController: UIViewController {
    
    // MARK: - Outlets
    
    // MARK: - Private properties
    
    // MARK: - Public properties
    var presenter: TemplatePresenterProtocol!
    
    // MARK: - Lifecycle
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
}
 
// MARK: - TemplateViewProtocol implementation
extension TemplateViewController: TemplateViewProtocol {
    
}
