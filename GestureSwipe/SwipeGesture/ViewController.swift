//
//  ViewController.swift
//  SwipeGesture
//
//  Created by Carlos Butron on 01/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imagen2: UIImageView!
    
    
    override func viewDidLoad() {
        
        
        var swipeGestureRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureRight.direction = UISwipeGestureRecognizerDirection.Right
        imagen2.addGestureRecognizer(swipeGestureRight)
        
        var swipeGestureDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureDown.direction = UISwipeGestureRecognizerDirection.Down
        imagen2.addGestureRecognizer(swipeGestureDown)
        
        var swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureLeft.direction = UISwipeGestureRecognizerDirection.Left
        imagen2.addGestureRecognizer(swipeGestureLeft)
        
        var swipeGestureUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureUp.direction = UISwipeGestureRecognizerDirection.Up
        imagen2.addGestureRecognizer(swipeGestureUp)
        
        
        super.viewDidLoad()
        
        imagen2.image = UIImage(named: "apple.png")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
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
    
    func changeImage(){
        if (imagen2.image == UIImage(named: "apple.png")){
            imagen2.image = UIImage(named: "imagen1.png")}
        else{
            imagen2.image = UIImage(named: "apple.png")
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


