//
//  ViewController.swift
//  GestureLongPress
//
//  Created by Carlos Butron on 01/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        
        var longPressGesture = UILongPressGestureRecognizer(target: self, action: "action:")
        
        longPressGesture.minimumPressDuration = 2.0;
        
        image.addGestureRecognizer(longPressGesture)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func action(gestureRecognizer:UIGestureRecognizer) {
        
        if (gestureRecognizer.state == UIGestureRecognizerState.Began){
            
            
            var myAlertView = UIAlertView()
            
            myAlertView.title = "Alerta"
            myAlertView.message = "Gesto Long Press"
            myAlertView.addButtonWithTitle("ok")
            
            myAlertView.show()
            
            
        }
        
        
        
    }
    
}

