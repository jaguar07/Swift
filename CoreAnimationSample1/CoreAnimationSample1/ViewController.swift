//
//  ViewController.swift
//  CoreAnimationSample1
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imagen: UIImageView!
    @IBAction func animar(sender: UIButton) {
        
        var animation:CABasicAnimation = CABasicAnimation(keyPath: "position")
        animation.fromValue = NSValue(CGPoint:CGPointMake(imagen.frame.midX, imagen.frame.midY))
        animation.toValue = NSValue(CGPoint:CGPointMake(imagen.frame.midX, 340))
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.duration = 1.0
        imagen.layer.addAnimation(animation, forKey: "position")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

