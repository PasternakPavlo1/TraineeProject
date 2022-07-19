//
//  WeatherViewController.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 18.07.2022.
//

import UIKit

// MARK: - WeatherViewProtocol
protocol WeatherViewProtocol: AnyObject {}

class WeatherViewController: UIViewController {
    
    // MARK: - Public propertie
    var presenter: DetailWeatherProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
     
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let weatherTableViewController = segue.destination as? DetailWeatherTableViewController
        presenter.tableView = weatherTableViewController
        weatherTableViewController?.presenter = presenter
    }
}

extension WeatherViewController: WeatherViewProtocol {}
