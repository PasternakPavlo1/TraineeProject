//
//  DayWeatherTableViewCell.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 27.06.2022.
//

import UIKit

class DayWeatherTableViewCell: UITableViewCell, UICollectionViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet private weak var weatherCollectionView: UICollectionView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        let blureEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blureEffect)
        blurEffectView.frame = self.frame
        self.backgroundView = blurEffectView
    }
    
    // MARK: - Private properties
    private var hourly: [CurrentModel] = []
    
    // MARK: - Public methods
    func setupCell(hourlyArray: [CurrentModel]) {
        hourly = hourlyArray
        weatherCollectionView.registerCell(HourlyForecastCollectionViewCell.self)
    
        weatherCollectionView.delegate = self
        weatherCollectionView.dataSource = self
    }
    
}

extension DayWeatherTableViewCell: UICollectionViewDataSource {
    
    // MARK: - Table view data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourly.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let currentWeather = hourly[indexPath.row]
        let date = TimeHelper.getDateString(by: currentWeather.dt, with: .hour)
        let weatherIcon = WeatherIconType(rawValue: hourly[indexPath.row].weather.first?.icon ?? "")?.image
        let cell = collectionView.dequeueCell(HourlyForecastCollectionViewCell.self,
                                              indexPath: indexPath)
        cell.configure(with: "\(date)", image: weatherIcon ?? UIImage(), degree: "\(Int(currentWeather.temp))°")
        return cell
    }
}
