//
//  Weather.swift
//  WeatherOrNot
//
//  Created by Patrick Moening on 4/18/16.
//  Copyright © 2016 BigFiski. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    
    private var _mainWeather : String!
    var mainWeather : String {
        if _mainWeather == nil{
            _mainWeather = ""
        }
        return _mainWeather
    }
    
    private var _icon : String!
    var icon : String {
        if _icon == nil{
            _icon = ""
        }
        return _icon
    }
    
    private var _temp : String!
    var temp : String {
        if _temp == nil {
            _temp = ""
        }
        return _temp
    }
    
    private var _weatherURL : String!
    var weatherURL : String {
        if _weatherURL == nil{
            _weatherURL = ""
        }
        return _weatherURL
    }
    
    init () {
        //MARK: URL
        _weatherURL = "\(BASE_URL)\(SEATLLE)&\(IMPERIAL_UNITS)&\(API_KEY)"
        
    }
    
    func downloadWeatherDetails (completed: DownloadComplete) {
        
        let url = NSURL(string: _weatherURL)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            //print(result.value.debugDescription)
            if let dict = result.value as? Dictionary<String,AnyObject> {
                //print("in the dictionary")
                //print(dict["weather"])
                if let mainBase = dict["main"] as? Dictionary<String,AnyObject> where mainBase.count > 0 {
                    print("Got temp?")
                    if let tempCall = mainBase["temp"]  {
                        self._temp = "\(tempCall)"
                        print(self._temp)
                    }
                }
                if let weatherCall = dict["weather"] as? [Dictionary<String,AnyObject>] where weatherCall.count > 0{
                    //print("\(weatherCall)")
                    if let main = weatherCall[0]["main"] where weatherCall.count > 0 {
                        self._mainWeather = main.capitalizedString
                        print(self._mainWeather)
                    }
                    if let iconCall = weatherCall[0]["icon"] where weatherCall.count > 0 {
                        self._icon = iconCall as! String
                        print(self.icon)
                    }
                }
            }
        }
    }
}
