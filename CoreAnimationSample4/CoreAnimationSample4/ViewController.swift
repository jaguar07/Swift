//
//  ViewController.swift
//  CoreAnimationSample4
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
            
            
            
            //AMPLIACION 3
            
            var subLayer : CALayer = self.imagen.layer
            var thePath : CGMutablePathRef = CGPathCreateMutable();
            CGPathMoveToPoint(thePath, nil, 160.0, 200.0);
            CGPathAddCurveToPoint(thePath, nil, 83.0, 50.0, 100.0, 100.0, 160.0, 200.0);
            //CGPathAddCurveToPoint(thePath, nil, 320.0, 500.0, 566.0, 500.0, 566.0, 74.0);
            var theAnimation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath:"position")
            theAnimation.path = thePath
            theAnimation.duration = 5.0
            
            theAnimation.fillMode = kCAFillModeForwards
            theAnimation.removedOnCompletion = false
            
            var resizeAnimation:CABasicAnimation = CABasicAnimation(keyPath:"bounds.size")
            resizeAnimation.toValue = NSValue(CGSize:CGSizeMake(240, 60))
            
            //AMPLIACION 1
            resizeAnimation.duration = 5.0
            resizeAnimation.fillMode = kCAFillModeForwards
            resizeAnimation.removedOnCompletion = false
            
            subLayer.addAnimation(theAnimation, forKey: "position")
            
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



