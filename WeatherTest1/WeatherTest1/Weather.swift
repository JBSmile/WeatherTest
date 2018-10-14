//
//  Weather.swift
//  WeatherTest1
//
//  Created by apple on 2018/9/25.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
let weatherDataUrl = "http://www.weather.com.cn/data/sk/101280101.html"
let NotificationName = NSNotification.Name(rawValue:"MYNotification")
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
//        self.Time=Time
//        self.Temp=Temp
//        self.Wet=Wet
//        self.WindD=WindD
//        self.WindL=WindL
//        self.Ap=Ap
//        self.City=City
//        self.Radar=Radar
//    }
//    func copyModel(weather:Weather!) {
//        self.time = weather.time
//    }
    func fetchData() {
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
                    self.time=time
                    self.temp=temp
                    self.wet=wet
                    self.windD=windD
                    self.windL=windL
                    self.ap=ap
                    self.city=city
                    self.radar=radar
//                 let   let tmpModel = Weather();
//                    tmpModel.time = time;
//                   self.copyModel(weather: tmpModel)
                    NotificationCenter.default.post(name: NotificationName, object: nil)
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
    }
    
}
