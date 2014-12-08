//
//  ViewController.swift
//  SegueWithpresentViewController
//
//  Created by Carlos Butron on 07/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonAction(sender: UIButton) {
        var storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        var viewController:UIViewController = storyboard.instantiateViewControllerWithIdentifier("NuevoViewController") as UIViewController
        self.presentViewController(viewController, animated: true,
            completion: nil)
    }
    
    
    @IBAction func buttonAction2(sender: UIButton) {
        
        var newControlador = UIViewController (nibName: "NuevaClase", bundle: nil)
        self.presentViewController(newControlador, animated: true,
            completion: nil)
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
