//
//  HourlyForecastCollectionViewCell.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 27.06.2022.
//

import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var hourLabel: UILabel!
    @IBOutlet private weak var weatherImage: UIImageView!
    @IBOutlet private weak var degreeLabel: UILabel!
    
    // MARK: - Public method
    func configure(with hour: String, image: UIImage, degree: String) {
        hourLabel.text = hour
        weatherImage.image = image
        degreeLabel.text = degree
    }
}
