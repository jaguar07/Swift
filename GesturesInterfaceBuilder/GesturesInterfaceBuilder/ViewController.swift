//
//  ViewController.swift
//  GesturesInterfaceBuilder
//
//  Created by Carlos Butron on 01/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var boton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //SWIPE
    @IBAction func respondToSwipeGesture(send: UIGestureRecognizer) {
        
        alert("Swipe")
        
    }
    
    
    //LONG PRESS
    @IBAction func action(gestureRecognizer:UIGestureRecognizer) {
        
        if (gestureRecognizer.state == UIGestureRecognizerState.Began){
            
            alert("Long Press")
            
            
        }
        
    }
    
    
    func alert(cadena: String){
        
        var myAlertView = UIAlertView()
        
        myAlertView.title = "Alerta"
        myAlertView.message = cadena
        myAlertView.addButtonWithTitle("OK")
        
        myAlertView.show()
        
    }
    
    
}



