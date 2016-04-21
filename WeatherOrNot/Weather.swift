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
    
    private var _latitude : String!
    var latitude : String {
        if _latitude == nil {
            _latitude = "47.620187"
        }
        return _latitude
    }
    
    private var _longitude : String!
    var longitude : String  {
        if _longitude == nil {
            _longitude = "-122.361176"
        }
        return _longitude
    }
    
    private var _weatherURL : String!
    var weatherURL : String {
        if _weatherURL == nil{
            _weatherURL = ""
        }
        return _weatherURL
    }
    
    init (latitude: String ,longitude: String) {
        self._latitude = latitude
        self._longitude = longitude
        _weatherURL = "\(BASE_URL)\(API_KEY)\(self.latitude),\(self.longitude)"
        //_weatherURL = "\(BASE_URL)\(API_KEY)\(_latitude),-122.361176"
    }
    
    
    func downloadWeatherDetails (completed: DownloadComplete) {
        
        let url = NSURL(string: _weatherURL)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            print(result.value.debugDescription)
            print("\(self.latitude),\(self.longitude)")
        }
    }
}
