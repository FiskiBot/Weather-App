//
//  ViewController.swift
//  WeatherOrNot
//
//  Created by Patrick Moening on 4/18/16.
//  Copyright © 2016 BigFiski. All rights reserved.
//

import UIKit
import CoreLocation

class MainVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var weatherImg: UIImageView!

    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var celcLbl: UILabel!
    @IBOutlet weak var fahrLbl: UILabel!
    
    var weather : Weather!

    var locManager = CLLocationManager()
    
    var currentLocation = CLLocation()
    var lat: String = "47.620187"
    var long : String = "-122.361176"
    
    override func viewDidAppear(animated: Bool) {
        
        weather = Weather(latitude: lat, longitude: long)
        weather.downloadWeatherDetails { () -> () in
        }
        
    }
    func locationAuthStatus(){
        
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse{
            
            currentLocation = locManager.location!
            lat = "\(currentLocation.coordinate.latitude)"
            long = "\(currentLocation.coordinate.longitude)"
            
        } else {
            locManager.requestWhenInUseAuthorization()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        locationAuthStatus()
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.startUpdatingLocation()
        
    }

}

