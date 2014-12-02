//
//  ViewController.swift
//  NSURLSession
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var ciudad: UILabel!
    @IBOutlet weak var temperaturaCelsius: UITextField!
    @IBOutlet weak var temperaturaCelsiusMax: UITextField!
    @IBOutlet weak var temperaturaCelsiusMin: UITextField!
    @IBOutlet weak var temperaturaKelvin: UITextField!
    @IBOutlet weak var temperaturaKelvinMax: UITextField!
    @IBOutlet weak var temperaturaKelvinMin: UITextField!
    @IBOutlet weak var humedad: UITextField!
    @IBOutlet weak var viento: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var sessionConfig: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfig.allowsCellularAccess = false
        //Solo acepta respuestas en JSON
        sessionConfig.HTTPAdditionalHeaders = ["Accept":"application/json"]
        //timeouts y conexiones permitidas
        sessionConfig.timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 60.0
        sessionConfig.HTTPMaximumConnectionsPerHost = 1
        //Creamos la sesión, asignándole una configuración
        var session = NSURLSession(configuration: sessionConfig)
        session.dataTaskWithURL(NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=Madrid,es")!, completionHandler: {(data, response, error) in
            var dic:NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions(0), error: nil) as NSDictionary
            
            println(dic)
            
            var ciudad: NSString = (dic["name"] as NSString)
            var kelvin: AnyObject! = (dic["main"] as NSDictionary) ["temp"]
            var kelvin_min: AnyObject! = (dic["main"] as NSDictionary) ["temp_min"]
            var kelvin_max: AnyObject! = (dic["main"] as NSDictionary) ["temp_max"]
            var celsius = kelvin as Float - 274.15 as Float
            var celsius_min = kelvin_min as Float - 274.15 as Float
            var celsius_max = kelvin_max as Float - 274.15 as Float
            var humedad: AnyObject! = (dic ["main"] as NSDictionary) ["humidity"]
            var viento: AnyObject! = (dic ["wind"] as NSDictionary) ["speed"]
            
            
            //Forzamos ejecución en hilo principal
            dispatch_async(dispatch_get_main_queue(), { () in
                self.ciudad.text = "\(ciudad)"
                self.temperaturaCelsius.text = "\(celsius)"
                self.temperaturaCelsiusMax.text = "\(celsius_max)"
                self.temperaturaCelsiusMin.text = "\(celsius_min)"
                self.temperaturaKelvin.text = "\(kelvin)"
                self.temperaturaKelvinMax.text = "\(kelvin_max)"
                self.temperaturaKelvinMin.text = "\(kelvin_min)"
                self.humedad.text = "\(humedad)"
                self.viento.text = "\(viento)"
            })
            
        }).resume()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


