//
//  ViewController.swift
//  Gestures
//
//  Created by Carlos Butron on 01/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var netRotation:CGFloat = 0
    
    
    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        
        //ROTACION
        var rotateGesture = UIRotationGestureRecognizer(target: self, action: "rotateGesture:")
        image.addGestureRecognizer(rotateGesture)
        
        
        
        //SWIPE
        var swipeGestureRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureRight.direction = UISwipeGestureRecognizerDirection.Right
        image.addGestureRecognizer(swipeGestureRight)
        
        var swipeGestureDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureDown.direction = UISwipeGestureRecognizerDirection.Down
        image.addGestureRecognizer(swipeGestureDown)
        
        var swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureLeft.direction = UISwipeGestureRecognizerDirection.Left
        image.addGestureRecognizer(swipeGestureLeft)
        
        var swipeGestureUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureUp.direction = UISwipeGestureRecognizerDirection.Up
        image.addGestureRecognizer(swipeGestureUp)
        
        
        
        //LONG PRESS
        var longPressGesture = UILongPressGestureRecognizer(target: self, action: "action:")
        
        longPressGesture.minimumPressDuration = 2.0;
        
        image.addGestureRecognizer(longPressGesture)
        
        
        
        super.viewDidLoad()
        image.image = UIImage(named: "imagen1.png")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ROTACION
    @IBAction func rotateGesture(sender : UIRotationGestureRecognizer) {
        var rotation:CGFloat = sender.rotation
        var transform:CGAffineTransform  =
        CGAffineTransformMakeRotation(rotation + netRotation)
        sender.view?.transform = transform
        if (sender.state == UIGestureRecognizerState.Ended){
            netRotation += rotation;
        }
    }
    
    
    //SWIPE
    @IBAction func respondToSwipeGesture(send: UIGestureRecognizer) {
        
        if let swipeGesture = send as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                changeImage()
                println("Swiped right")
            case UISwipeGestureRecognizerDirection.Down:
                changeImage()
                println("Swiped down")
            case UISwipeGestureRecognizerDirection.Left:
                changeImage()
                println("Swiped left")
            case UISwipeGestureRecognizerDirection.Up:
                changeImage()
                println("Swiped up")
            default:
                break
            }
        }
    }
    
    
    //LONG PRESS
    @IBAction func action(gestureRecognizer:UIGestureRecognizer) {
        
        if (gestureRecognizer.state == UIGestureRecognizerState.Began){
            
            
            var myAlertView = UIAlertView()
            
            myAlertView.title = "Alerta"
            myAlertView.message = "Gesto Long Press"
            myAlertView.addButtonWithTitle("ok")
            
            myAlertView.show()
            
            
        }
        
        
        
    }
    
    func changeImage(){
        if (image.image == UIImage(named: "imagen1.png")){
            image.image = UIImage(named: "imagen2.png")}
        else{
            image.image = UIImage(named: "imagen1.png")
        }
    }
    
    
}

