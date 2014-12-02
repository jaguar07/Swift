//
//  ViewController.swift
//  CoreAnimationSample2
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var position = true
    
    @IBOutlet weak var imagen: UIImageView!
    @IBAction func animar(sender: UIButton) {
        
        
        
        if (position){  //AMPLIACION 1
            
            var animation:CABasicAnimation! = CABasicAnimation(keyPath:"position")
            
            
            animation.toValue = NSValue(CGPoint:CGPointMake(160, 200))
            
            //AMPLIACION 1
            animation.fillMode = kCAFillModeForwards
            animation.removedOnCompletion = false
            
            var resizeAnimation:CABasicAnimation = CABasicAnimation(keyPath:"bounds.size")
            resizeAnimation.toValue = NSValue(CGSize:CGSizeMake(240, 60))
            
            //AMPLIACION 1
            resizeAnimation.fillMode = kCAFillModeForwards
            resizeAnimation.removedOnCompletion = false
            
            imagen.layer.addAnimation(animation, forKey: "position")
            
            imagen.layer.addAnimation(resizeAnimation, forKey: "bounds.size")
            
            position = false
        }
        else{
            
            var animation:CABasicAnimation! = CABasicAnimation(keyPath:"position")
            
            animation.fromValue = NSValue(CGPoint:CGPointMake(160, 200))
            
            //AMPLIACION 1
            animation.fillMode = kCAFillModeForwards
            animation.removedOnCompletion = false
            
            var resizeAnimation:CABasicAnimation = CABasicAnimation(keyPath:"bounds.size")
            resizeAnimation.fromValue = NSValue(CGSize:CGSizeMake(240, 60))
            
            //AMPLIACION 1
            resizeAnimation.fillMode = kCAFillModeForwards
            resizeAnimation.removedOnCompletion = false
            
            imagen.layer.addAnimation(animation, forKey: "position")
            
            imagen.layer.addAnimation(resizeAnimation, forKey: "bounds.size")
            
            position = true
        }
        
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

