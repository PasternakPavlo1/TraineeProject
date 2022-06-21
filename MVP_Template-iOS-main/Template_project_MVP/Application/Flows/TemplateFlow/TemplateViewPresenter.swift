//
//  TemplateViewPresenter.swift
//  Template_project. MVP
//
//  Created by Oleh on 17.03.2021.
//

import Foundation

// MARK: - TemplatePresenterProtocol
protocol TemplatePresenterProtocol {
    
}

// MARK: - TemplatePresenter
final class TemplatePresenter {
    
    // MARK: - Private properties
    private weak var view: TemplateViewProtocol?
    
    // MARK: - Public properties
    
    // MARK: - Lifecycle
    init(view: TemplateViewProtocol) {
        self.view = view
    }
    
}

// MARK: - TemplatePresenterProtocol implementation
extension TemplatePresenter: TemplatePresenterProtocol {
    
}
