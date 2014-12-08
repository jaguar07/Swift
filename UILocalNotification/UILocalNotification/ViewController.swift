//
//  ViewController.swift
//  UILocalNotification
//
//  Created by Carlos Butron on 08/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var notification = UILocalNotification()
        notification.fireDate = NSDate().dateByAddingTimeInterval(10)
        notification.alertBody = "Alerta"
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

