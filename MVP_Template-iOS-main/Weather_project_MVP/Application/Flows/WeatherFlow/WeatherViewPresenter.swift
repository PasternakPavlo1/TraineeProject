//
//  WeatherViewPresenter.swift
//  Weather_project_MVP
//
//  Created by Oleh on 17.03.2021.
//

import Foundation
import SwiftUI

// MARK: - WeatherPresenterProtocol
protocol WeatherPresenterProtocol {
    func tableViewLoaded()
    func getCityList() -> [CityElementModel]
    func getCity(by text: String)
    func didSelectCell(indexPath: IndexPath)
}

// MARK: - WeatherPresenter
final class WeatherPresenter {
    
    // MARK: - Private properties
    private weak var tableView: WeatherTableViewProtocol?
    private var cityList: [CityElementModel] = []
    private var filteredCityList: [CityElementModel] = []
    private let network = WeatherProject.shared.network
    
    // MARK: - Lifecycle
    init(tableView: WeatherTableViewProtocol) {
        
        self.tableView = tableView
        loadJSON()
    }
    
    // MARK: - Private methods
    private func readLocalJSONFile(name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileURL = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileURL)
                return data
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    private func parse(jsonData: Data) -> [CityElementModel]? {
        do {
            let decodeData = try JSONDecoder().decode([CityElementModel].self, from: jsonData)
            return decodeData
        } catch {
            print(error)
        }
        return nil
    }
    
    private func loadJSON() {
        let jsonData = readLocalJSONFile(name: "city_list")
        guard let data = jsonData else { return }
        if let recordObject = parse(jsonData: data) {
            cityList = recordObject
        }
        
    }
}

// MARK: - WeatherPresenterProtocol implementation
extension WeatherPresenter: WeatherPresenterProtocol {
    
    // MARK: - Public methods
    func getCity(by text: String) {
        if text.isEmpty {
            filteredCityList.removeAll()
        } else {
            filteredCityList = cityList.filter({ city in
                let cityName = city.name
                return cityName.starts(with: text)
            })
        }
        
        tableView?.tableViewReloadData()
    }
    
    func getCityList() -> [CityElementModel] {
        filteredCityList
    }
    
    func tableViewLoaded() {
        tableView?.setupUI()
    }
    
    func didSelectCell(indexPath: IndexPath) {
        network.getWeather(longtitude: filteredCityList[indexPath.row].coord.lon,
                           latitude: filteredCityList[indexPath.row].coord.lat).done { [weak self] weather in
            guard let self = self else { return }
            self.tableView?.pushDetailWeather(weatherResponse: weather,
                                              cityElementModel: self.filteredCityList[indexPath.row])
        }.catch { error in
            Log.error(error.localizedDescription)
        }
    }
}
