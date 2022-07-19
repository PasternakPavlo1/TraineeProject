//
//  MapWeatherTableViewCell.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 01.07.2022.
//

import UIKit
import MapKit
import CoreLocation

class MapWeatherTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var weatherMapView: MKMapView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        let blureEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blureEffect)
        blurEffectView.frame = self.frame
        self.backgroundView = blurEffectView
    }
    
    // MARK: - Public method
    func configure(with latitude: Double, longitude: Double) {
        let annontation = MKPointAnnotation()
        var region = MKCoordinateRegion()

        annontation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

        region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        weatherMapView.setRegion(region, animated: true)
        weatherMapView.addAnnotation(annontation)
    }
}
