//
//  ViewController.swift
//  WeatherOrNot
//
//  Created by Patrick Moening on 4/18/16.
//  Copyright © 2016 BigFiski. All rights reserved.
//

import UIKit


class MainVC: UIViewController {

    @IBOutlet weak var weatherImg: UIImageView!

    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var celcLbl: UILabel!
    @IBOutlet weak var fahrLbl: UILabel!
    
    var weather : Weather!
    
    override func viewDidAppear(animated: Bool) {
        
        weather.downloadWeatherDetails { () -> () in
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

