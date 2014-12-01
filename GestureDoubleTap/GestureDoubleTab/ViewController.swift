//
//  ViewController.swift
//  GestureDoubleTab
//
//  Created by Carlos Butron on 01/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imagen: UIImageView!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleTap(sender : UIGestureRecognizer) {
        if (sender.view?.contentMode == UIViewContentMode.ScaleAspectFit){
            sender.view?.contentMode = UIViewContentMode.Center
        }
        else{
            sender.view?.contentMode = UIViewContentMode.ScaleAspectFit
        } }
    override func viewDidLoad() {
        var tapGesture = UITapGestureRecognizer(target: self, action:
            "handleTap:")
        tapGesture.numberOfTapsRequired = 2;
        imagen.addGestureRecognizer(tapGesture)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
}


