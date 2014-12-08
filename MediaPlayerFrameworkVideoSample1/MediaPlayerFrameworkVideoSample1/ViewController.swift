//
//  ViewController.swift
//  MediaPlayerFrameworkVideoSample1
//
//  Created by Carlos Butron on 07/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import MediaPlayer


class ViewController: UIViewController {
    
    var theMovie:MPMoviePlayerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var bundle = NSBundle.mainBundle()
        //Nuestro vídeo es 02.mov
        var moviePath = bundle.pathForResource("02", ofType: "mov")
        var url = NSURL(fileURLWithPath: moviePath!)
        theMovie = MPMoviePlayerController(contentURL: url)
        theMovie.view.frame = CGRectMake(25.0, 20.0, 270, 270);
        self.view.addSubview(theMovie.view)
        theMovie.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

