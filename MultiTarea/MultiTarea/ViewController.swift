//
//  ViewController.swift
//  MultiTarea
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mensaje: UILabel!
    @IBOutlet weak var notificacion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "actualizarInterfaz:", name: UIApplicationWillEnterForegroundNotification, object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func actualizarInterfaz (notification: NSNotification){
        
        notificacion.text = "Volvemos de segundo plano con notificación"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



