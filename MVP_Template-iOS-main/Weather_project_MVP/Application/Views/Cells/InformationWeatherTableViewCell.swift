//
//  InformationWeatherTableViewCell.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 01.07.2022.
//

import UIKit

class InformationWeatherTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var firstDegreeLabel: UILabel!
    @IBOutlet weak var secondDegreeLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        let blureEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blureEffect)
        blurEffectView.frame = self.frame
        self.backgroundView = blurEffectView
    }
    
    // MARK: - Public method
    func configure(with day: String, image: UIImage, degree: String, secondDegree: String) {
        dayLabel.text = day
        weatherImage.image = image
        firstDegreeLabel.text = degree
        secondDegreeLabel.text = secondDegree
    }
}
