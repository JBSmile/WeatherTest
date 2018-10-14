//
//  WeatherViewController.swift
//  WeatherTest1
//
//  Created by apple on 2018/9/25.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import MBProgressHUD

class WeatherViewController: UIViewController {
    var weather:Weather=Weather(){
    didSet{
       fetchRecentWeather()
    }
    }
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
        let weather2=weather.fetchData()
        sleep(1)
        weather=weather2
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func configWithModel(WeatherModel:Weather) {
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
