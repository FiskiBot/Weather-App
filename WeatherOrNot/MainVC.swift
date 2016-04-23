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
        
        weather = Weather()
        weather.downloadWeatherDetails { () -> () in
            
        }
    }

    
    func updateUI(){
        weatherImg.image = UIImage(named: weather.icon)
        locationLbl.text = "\(weather.mainWeather)"
        
        fahrLbl.text = "\((weather.temp))°F"
        var farh = round(Float(weather.temp)!)
        var celc = round((farh - 32) * 5 / 9)
        celcLbl.text = "\(celc)°C"
        
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func getWeather(sender: AnyObject) {
        updateUI()
    }
}

