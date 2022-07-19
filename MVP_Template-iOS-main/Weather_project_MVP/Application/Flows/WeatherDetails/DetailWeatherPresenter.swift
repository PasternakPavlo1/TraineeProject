//
//  DetailWeatherPresenter.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 27.06.2022.
//

import Foundation

// MARK: - DetailWeatherProtocol
protocol DetailWeatherProtocol {
    func getHourly() -> [CurrentModel]
    func getDaily() -> [DailyModel]
    func getCoord() -> (long: Double, lat: Double)
    func tableViewLoaded()
    var tableView: DetailTableViewProtocol? { get set }
}

// MARK: - DetailWeatherPresenter
final class DetailWeatherPresenter {
    
    // MARK: - Private properties
    weak var view: WeatherViewProtocol?
    weak var tableView: DetailTableViewProtocol?
    private var weatherResponse: WeatherResponseModel?
    private var cityElementModel: CityElementModel?
    
    // MARK: - Lifecycle
    init(view: WeatherViewProtocol,
         weatherResponse: WeatherResponseModel,
         cityElementModel: CityElementModel) {
        
        self.view = view
        self.weatherResponse = weatherResponse
        self.cityElementModel = cityElementModel
    }
}

// MARK: - DetailWeatherProtocol implementation
extension DetailWeatherPresenter: DetailWeatherProtocol {
    
    // MARK: - Public methods
    func getHourly() -> [CurrentModel] {
        guard let hourly = weatherResponse?.hourly else {
            return [CurrentModel]()
        }
     return hourly
    }
    
    func getDaily() -> [DailyModel] {
        guard let daily = weatherResponse?.daily else {
            return [DailyModel]()
        }
        return daily
    }
    
    func getCoord() -> (long: Double, lat: Double) {
        let longtitude = cityElementModel?.coord.lon ?? 0
        let latitude = cityElementModel?.coord.lat ?? 0
        
        return (longtitude, latitude)
    }
    
    func tableViewLoaded() {
        tableView?.setupUI(with: weatherResponse, cityName: cityElementModel?.name ?? "")
    }
}
