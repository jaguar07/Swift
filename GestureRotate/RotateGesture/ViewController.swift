//
//  ViewController.swift
//  RotateGesture
//
//  Created by Carlos Butron on 01/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var netRotation:CGFloat = 0
    
    
    @IBOutlet weak var imagen: UIImageView!
    
    override func viewDidLoad() {
        var rotateGesture = UIRotationGestureRecognizer(target: self,
            action: "rotateGesture:")
        imagen.addGestureRecognizer(rotateGesture)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rotateGesture(sender : UIRotationGestureRecognizer) {
        var rotation:CGFloat = sender.rotation
        var transform:CGAffineTransform  =
        CGAffineTransformMakeRotation(rotation + netRotation)
        sender.view?.transform = transform
        if (sender.state == UIGestureRecognizerState.Ended){
            netRotation += rotation;
        }
    }
    
    
}


