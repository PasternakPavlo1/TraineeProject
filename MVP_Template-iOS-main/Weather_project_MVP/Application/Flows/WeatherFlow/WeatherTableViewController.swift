//
//  WeatherTableViewController.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 22.06.2022.
//

import UIKit
import CoreLocation
import SwiftUI

// MARK: - WeatherTableViewProtocol
protocol WeatherTableViewProtocol: AnyObject {
    func setupUI()
    func tableViewReloadData()
    func pushDetailWeather(weatherResponse: WeatherResponseModel, cityElementModel: CityElementModel)
}

class WeatherTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Public Propertie
    var presenter: WeatherPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        presenter.tableViewLoaded()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCityList().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = presenter.getCityList()[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        cell.textLabel?.text = "\(cellData.name), \(cellData.country)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectCell(indexPath: indexPath)
    }
}

extension WeatherTableViewController: WeatherTableViewProtocol {
    
    // MARK: - Public methods
    func pushDetailWeather(weatherResponse: WeatherResponseModel, cityElementModel: CityElementModel) {
        let detailWeatherVC = WeatherViewController.instantiateFromStoryboard()
        detailWeatherVC.presenter = DetailWeatherPresenter(view: detailWeatherVC,
                                                           weatherResponse: weatherResponse,
                                                           cityElementModel: cityElementModel)
        navigationController?.pushViewController(detailWeatherVC, animated: true)
    }
    
    func tableViewReloadData() {
        tableView.reloadData()
    }
    
    func setupUI() {
        searchBar.delegate = self
    }
}

extension WeatherTableViewController: UISearchBarDelegate {
     func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         presenter.getCity(by: searchText)
    }
}
