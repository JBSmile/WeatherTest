//
//  WeatherViewController.swift
//  WeatherTest1
//
//  Created by apple on 2018/9/25.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import MBProgressHUD
class WeatherViewController: UIViewController,WeatherViewControllerDelegate {
     var weather:Weather=Weather()
     var weatherView:WeatherView?{
        guard isViewLoaded else{
            return nil
        }
        return (view as! WeatherView)
    }
    func fetchRecentWeather(){
        configWithModel(WeatherModel: weather)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        weather=Weather(delegate:self)
        weatherView?.activity.startAnimating()
        weather.fetchData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func configWithModel(WeatherModel:Weather) {
        weatherView?.activity.hidesWhenStopped = true
        weatherView?.activity.stopAnimating()
        weatherView?.TimeLabel.text = WeatherModel.time
        weatherView?.TempLabel.text = WeatherModel.temp
        weatherView?.WetLabel.text = WeatherModel.wet
        weatherView?.WindDLabel.text = WeatherModel.windD
        weatherView?.WindLLabel.text = WeatherModel.windL
        weatherView?.ApLabel.text = WeatherModel.ap
        weatherView?.CityLabel.text = WeatherModel.city
        weatherView?.RadarLabel.text = WeatherModel.radar
    }
}
