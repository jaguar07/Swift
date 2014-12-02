//
//  ViewController.swift
//  SocialFramework
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import Social
import Accounts

class ViewController: UIViewController {
    
    @IBAction func facebook(sender: UIButton) {
        
        var url: NSURL = NSURL(string: "http://www.google.es")!
        
        var fbController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        fbController.setInitialText("")
        fbController.addURL(url)
        
        var completionHandler = {(result:SLComposeViewControllerResult) -> () in
            fbController.dismissViewControllerAnimated(true, completion:nil)
            switch(result){
            case SLComposeViewControllerResult.Cancelled:
                println("El usuario ha cancelado")
            case SLComposeViewControllerResult.Done:
                println("El usuario ha posteado")
            default:
                break
            }
        }
        
        fbController.completionHandler = completionHandler
        self.presentViewController(fbController, animated: true, completion:nil)
    }
    
    
    @IBAction func twitter(sender: UIButton) {
        
        var image: UIImage = UIImage(named: "imagen2.png")!
        
        var twitterController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        twitterController.setInitialText("")
        twitterController.addImage(image)
        
        var completionHandler = {(result:SLComposeViewControllerResult) -> () in
            twitterController.dismissViewControllerAnimated(true, completion: nil)
            switch(result){
            case SLComposeViewControllerResult.Cancelled:
                println("El usuario ha cancelado")
            case SLComposeViewControllerResult.Done:
                println("El usuario ha twitteado")
            default:
                break
            }
        }
        
        twitterController.completionHandler = completionHandler
        self.presentViewController(twitterController, animated: true, completion: nil)
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

