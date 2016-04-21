//
//  Weather.swift
//  WeatherOrNot
//
//  Created by Patrick Moening on 4/18/16.
//  Copyright © 2016 BigFiski. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

class Weather {
    
    //Some comment
   
    
    
    private var _weather : String!
    var weather : String {
        if _weather == nil{
            _weather = ""
        }
        return _weather
    }
    
    private var _latitude : Float!
    var location : Float{
        if _latitude == nil {
            _latitude = 47.621344
        }
        return _latitude
    }
    
    private var _longitude : Float!
    var longitude : Float {
        if _longitude == nil {
            _longitude = -122.361176
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
    
    init (weather: String) {
        self._weather = weather
        //self._latitude = latitude
        //self._longitude = longitude
        //_weatherURL = "\(BASE_URL)\(API_KEY)\(self._latitude),\(self._longitude)"
        _weatherURL = "\(BASE_URL)\(API_KEY)47.621344,-122.361176"
    }
    
    
    func downloadWeatherDetails (completed: DownloadComplete) {
        
        let url = NSURL(string: _weatherURL)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            print(result.value.debugDescription)
        }
    }
}
