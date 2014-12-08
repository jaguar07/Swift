//
//  ViewController.swift
//  iAdFramework
//
//  Created by Carlos Butron on 07/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.canDisplayBannerAds = true
        
        var bannerView = ADBannerView(adType: .MediumRectangle)
        bannerView.delegate = self
        bannerView.center = self.view.center
        bannerView.hidden = false
        self.view.addSubview(bannerView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

