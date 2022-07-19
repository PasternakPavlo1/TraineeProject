//
//  DetailWeatherTableViewController.swift
//  Weather_project_MVP
//
//  Created by Павло Пастернак on 27.06.2022.
//

import UIKit
import MapKit

// MARK: - DetailTableViewProtocol
protocol DetailTableViewProtocol: AnyObject {
    func setupUI(with model: WeatherResponseModel?, cityName: String)
    func tableViewReloadData()
}

class DetailWeatherTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var degreeLabel: UILabel!
    @IBOutlet private weak var weatherDescription: UILabel!
    @IBOutlet private weak var firstDegreeLabel: UILabel!
    @IBOutlet private weak var secondDegreeLabel: UILabel!
    
    // MARK: - Public properties
    var presenter: DetailWeatherProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.tableViewLoaded()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return presenter.getDaily().count
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let dayWeatherCell = tableView.dequeueCell(DayWeatherTableViewCell.self, indexPath: indexPath)
            dayWeatherCell.setupCell(hourlyArray: presenter.getHourly())
            
            return dayWeatherCell
        case 1:
            let cellData = presenter.getDaily()[indexPath.row]
            let date = TimeHelper.getDateString(by: cellData.dt, with: .day)
            let weatherIcon = WeatherIconType(rawValue: cellData.weather[0].icon)?.image
            let informationWeatherCell = tableView.dequeueCell(InformationWeatherTableViewCell.self,
                                                               indexPath: indexPath)
            informationWeatherCell.configure(with: date,
                                             image: weatherIcon ?? UIImage(),
                                             degree: "\(Int(cellData.temp.min))°",
                                             secondDegree: "\(Int(cellData.temp.max))°")
            return informationWeatherCell
        default:
            let mapWeatherCell = tableView.dequeueCell(MapWeatherTableViewCell.self, indexPath: indexPath)
            mapWeatherCell.configure(with: presenter.getCoord().lat, longitude: presenter.getCoord().long)
            
            return mapWeatherCell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return UITableView.automaticDimension
        } else if indexPath.section == 2 {
            return 250
        }
        return 120
    }
   
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView()
        headerView.textLabel.text = ""
        if section == 0 {
            headerView.textLabel.text = "HOURLY FORECAST"
        } else if section == 1 {
            headerView.textLabel.text = "10-DAY FORECAST"
        } else if section == 2 {
            headerView.textLabel.text = "TEMPERATURE"
        }
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView,
                            willDisplay cell: UITableViewCell,
                            forRowAt indexPath: IndexPath) {
        let cornerRadius = 10
        var corners: UIRectCorner = []

        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            corners.update(with: .bottomLeft)
            corners.update(with: .bottomRight)
        }
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: cell.bounds,
                                      byRoundingCorners: corners,
                                      cornerRadii: CGSize(width: cornerRadius,
                                      height: cornerRadius)).cgPath
        cell.layer.mask = maskLayer
    }
}

extension DetailWeatherTableViewController: DetailTableViewProtocol {
    func setupUI(with model: WeatherResponseModel?, cityName: String) {
        tableView.registerCell(DayWeatherTableViewCell.self)
        tableView.registerCell(InformationWeatherTableViewCell.self)
        tableView.registerCell(MapWeatherTableViewCell.self)
        
        cityLabel.text = cityName
        degreeLabel.text = "\(Int(model?.current.temp ?? 0))°"
        weatherDescription.text = model?.current.weather[0].weatherDescription
        firstDegreeLabel.text = "\(Int(model?.daily[0].temp.min ?? 0))°"
        secondDegreeLabel.text = "\(Int(model?.daily[0].temp.max ?? 0))°"
        
    }
    
    func tableViewReloadData() {
        tableView.reloadData()
    }
}
