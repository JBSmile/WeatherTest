//
//  WeatherView.swift
//  WeatherTest1
//
//  Created by apple on 2018/9/26.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import UIKit

class WeatherView:UIView{
    @IBOutlet var TimeLabel: UILabel!
    @IBOutlet var TempLabel: UILabel!
    @IBOutlet var WetLabel: UILabel!
    @IBOutlet var WindDLabel: UILabel!
    @IBOutlet var WindLLabel: UILabel!
    @IBOutlet var ApLabel: UILabel!
    @IBOutlet var CityLabel: UILabel!
    @IBOutlet var RadarLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
