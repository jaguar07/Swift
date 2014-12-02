//
//  ViewController.swift
//  AnimationWithCollisionQuartzCore
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    @IBOutlet weak var gravity: UIButton!
    @IBOutlet weak var push: UIButton!
    @IBOutlet weak var attachment: UIButton!
    
    //AMPLIACION
    var collision: UICollisionBehavior!
    
    
    @IBAction func gravity(sender: UIButton) {
        animator.removeAllBehaviors()
        //gravity, push y attachment son los IBOutlets correspondientes
        var gravity = UIGravityBehavior(items: [self.gravity,self.push,self.attachment])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [self.push, self.gravity, self.attachment])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
    
    @IBAction func push(sender: AnyObject) {
        animator.removeAllBehaviors()
        var push = UIPushBehavior(items: [self.gravity,self.push,self.attachment], mode:UIPushBehaviorMode.Instantaneous)
        push.magnitude = 2
        
        animator.addBehavior(push)
        
        collision = UICollisionBehavior(items: [self.push, self.gravity, self.attachment])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
    
    var attachmentBehavior: UIAttachmentBehavior? = nil
    @IBAction func attachment(sender: AnyObject) {
        animator.removeAllBehaviors()
        var anchorPoint = CGPointMake(self.attachment.center.x, self.attachment.center.y)
        attachmentBehavior = UIAttachmentBehavior(item: self.attachment, attachedToAnchor: anchorPoint)
        attachmentBehavior!.frequency = 0.5
        attachmentBehavior!.damping = 2
        attachmentBehavior!.length = 20
        animator.addBehavior(attachmentBehavior)
        collision = UICollisionBehavior(items: [self.push, self.gravity, self.attachment])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
    }
    
    @IBAction func handleAttachment(sender: UIPanGestureRecognizer) {
        if((attachmentBehavior) != nil){
            attachmentBehavior!.anchorPoint = sender.locationInView(self.view)
        }
    }
    
    
    var animator = UIDynamicAnimator()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        animator = UIDynamicAnimator(referenceView: self.view)
    }
    
    override func viewDidAppear(animated: Bool) {
        var max: CGRect = UIScreen.mainScreen().bounds
        var snap1 = UISnapBehavior(item: self.gravity, snapToPoint: CGPointMake(max.size.width/2, max.size.height/2 - 50))
        var snap2 = UISnapBehavior(item: self.push, snapToPoint: CGPointMake(max.size.width/2, max.size.height/2 ))
        var snap3 = UISnapBehavior(item: self.attachment, snapToPoint: CGPointMake(max.size.width/2, max.size.height/2 + 50))
        snap1.damping = 1
        snap2.damping = 2
        snap3.damping = 4
        animator.addBehavior(snap1)
        animator.addBehavior(snap2)
        animator.addBehavior(snap3)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}



