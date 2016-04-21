//
//  Location.swift
//  WeatherOrNot
//
//  Created by Patrick Moening on 4/20/16.
//  Copyright © 2016 BigFiski. All rights reserved.
//

import Foundation
import CoreLocation

class Location : NSObject,CLLocationManagerDelegate{
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("location = \(locations)")
    }
    
    
    
    
    
}

