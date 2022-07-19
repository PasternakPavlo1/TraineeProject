//
//  HeaderView.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 18.07.2022.
//

import UIKit

class HeaderView: UIView, NibLoadable {
    
    // MARK: - Outlets
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
     
        xibSetup()
        
        let blureEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blureEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.insertSubview(blurEffectView, at: 0)
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        xibSetup()
    }
}
