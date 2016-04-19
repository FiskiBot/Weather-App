//
//  ViewController.swift
//  WeatherOrNot
//
//  Created by Patrick Moening on 4/18/16.
//  Copyright © 2016 BigFiski. All rights reserved.
//

import UIKit
import MapKit

class MainVC: UIViewController {
    @IBOutlet weak var weatherImg: UIImageView!

    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var celcLbl: UILabel!
    @IBOutlet weak var fahrLbl: UILabel!
    
    let locationManager = CLLocationManager()
    var weather : Weather!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        locationAuthStatus()
    }
    
    func locationAuthStatus(){
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse{
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }

}

