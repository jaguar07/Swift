//
//  ViewController.swift
//  PinchGesture
//
//  Created by Carlos Butron on 01/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var lastScaleFactor:CGFloat = 1
    @IBOutlet weak var imagen: UIImageView!
    
    
    override func viewDidLoad() {
        let pinchGesture:UIPinchGestureRecognizer =
        UIPinchGestureRecognizer(target: self, action: "pinchGesture:")
        imagen.addGestureRecognizer(pinchGesture)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pinchGesture(sender : UIPinchGestureRecognizer) {
        var factor = sender.scale
        if (factor > 1) {
            //aumentamos el zoom
            sender.view?.transform = CGAffineTransformMakeScale(
                lastScaleFactor + (factor-1),
                lastScaleFactor + (factor-1));
        } else {
            //reducimos el zoom
            sender.view?.transform = CGAffineTransformMakeScale(
                lastScaleFactor * factor,
                lastScaleFactor * factor);
        }
        if (sender.state == UIGestureRecognizerState.Ended){
            if (factor > 1) {
                lastScaleFactor += (factor-1);
            } else {
                lastScaleFactor *= factor;
            } }
    }
    
    
}

