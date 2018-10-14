//
//  Weather.swift
//  WeatherTest1
//
//  Created by apple on 2018/9/25.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
let weatherDataUrl = "http://www.weather.com.cn/data/sk/101280101.html"
public class Weather{
    public var time:String?
    public var temp:String?
    public var wet:String?
    public var windD:String?
    public var windL:String?
    public var ap:String?
    public var city:String?
    public var radar:String?
    
//    init(Time:String,Temp:String,Wet:String,WindD:String,WindL:String,Ap:String,City:String,Radar:String) {
//       self.time=Time
//       self.temp=Temp
//       self.wet=Wet
//       self.windD=WindD
//       self.windL=WindL
//       self.ap=Ap
//       self.city=City
//       self.radar=Radar
//    }
//    func copyModel(weather:Weather!) {
//        self.time = weather.time
    //    }
    func fetchData() -> Weather {
        let weather1=Weather()
        let url:NSURL! = NSURL(string: weatherDataUrl)
        let request:NSURLRequest = NSURLRequest(url: url as URL )
        let config=URLSessionConfiguration.default
        let session=URLSession(configuration:config)
        let task=session.dataTask(with: request as URLRequest){
            (data,respose,error)->Void in
            if let jsonData=data{
                do{
                    let json=try
                        JSONSerialization.jsonObject(with: jsonData,options:[]) as! [String:AnyObject]
                    let jasonDictionary=json["weatherinfo"] as! NSDictionary
                    print(json)
                    let time=(jasonDictionary["time"]! as! String)
                    let temp=(jasonDictionary["temp"]! as! String)
                    let wet=(jasonDictionary["SD"]! as! String)
                    let windD=(jasonDictionary["WD"]! as! String)
                    let windL=(jasonDictionary["WS"]! as! String)
                    let ap=(jasonDictionary["AP"]! as! String)
                    let city=(jasonDictionary["city"]! as! String)
                    let radar=(jasonDictionary["Radar"]! as! String)
                    weather1.time=time
                    weather1.temp=temp
                    weather1.wet=wet
                    weather1.windD=windD
                    weather1.windL=windL
                    weather1.ap=ap
                    weather1.city=city
                    weather1.radar=radar
                    
//                 let   let tmpModel = Weather();
//                    tmpModel.time = time;
//                   self.copyModel(weather: tmpModel)
                }
                catch let error{
                    print("Error creating JSON object:\(error)")
                }
            }
            else if let requesterror=error{
                print("Error fetching recent weather:\(requesterror)")
            }
            else{
                print("Unexpected error with the request")
            }
        }
        task.resume()
        return weather1
    }
    
}
