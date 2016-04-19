//
//  Weather.swift
//  WeatherOrNot
//
//  Created by Patrick Moening on 4/18/16.
//  Copyright © 2016 BigFiski. All rights reserved.
//

import Foundation
import MapKit
import Alamofire

class Weather {
    
    
    private var _weather : String!
    var weather : String {
        if _weather == nil{
            _weather = ""
        }
        return _weather
    }
    
    private var _location : String!
    var location : String {
        if _location == nil {
            _location = ""
        }
        return _location
    }
    
    private var _weatherURL : String!
    var weatherURL : String {
        if _weatherURL == nil{
            _weatherURL = ""
        }
        return _weatherURL
    }
    
    init (weather: String, location: String) {
        self._weather = weather
        self._location = location
        
        _weatherURL = "\(BASE_URL)\(API_KEY)\(_location)"
    }
    
    
    func downloadWeatherDetails (completed: DownloadComplete) {
        
        let url = NSURL(string: _weatherURL)!
        
    }
}
