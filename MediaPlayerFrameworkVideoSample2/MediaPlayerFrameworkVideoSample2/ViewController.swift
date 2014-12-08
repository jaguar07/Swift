//
//  ViewController.swift
//  MediaPlayerFrameworkVideoSample2
//
//  Created by Carlos Butron on 07/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import MediaPlayer


class ViewController: UIViewController {
    
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var buttonPause: UIButton!
    @IBOutlet weak var buttonForward: UIButton!
    @IBOutlet weak var buttonRewind: UIButton!
    @IBOutlet weak var buttonReplay: UIButton!
    
    
    var theMovie:MPMoviePlayerController!
    
    var isPlaying = false
    
    @IBAction func play(sender: UIButton) {
        theMovie.play()
        
    }
    @IBAction func pause(sender: UIButton) {
        theMovie.pause()
        
    }
    @IBAction func forward(sender: UIButton) {
        theMovie.beginSeekingForward()
        
    }
    @IBAction func rewind(sender: UIButton) {
        theMovie.beginSeekingBackward()
        
    }
    
    @IBAction func replay(sender: UIButton) {
        
        theMovie.stop()
        theMovie.play()
        
        buttonReplay.hidden = true
        buttonPlay.hidden = false
        buttonPause.hidden = false
        buttonForward.hidden = false
        buttonRewind.hidden = false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonReplay.hidden = true
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "moviePlayBackDidFinish", name: MPMoviePlayerPlaybackDidFinishNotification, object: theMovie)
        
        var bundle = NSBundle.mainBundle()
        //Nuestro vídeo es 02.mov
        var moviePath = bundle.pathForResource("02", ofType: "mov")
        var url = NSURL(fileURLWithPath: moviePath!)
        theMovie = MPMoviePlayerController(contentURL: url)
        theMovie.view.frame = CGRectMake(25.0, 20.0, 270, 270);
        theMovie.controlStyle = MPMovieControlStyle.None
        
        var tapGesture = UITapGestureRecognizer(target: self, action: "didDetectDoubleTap:")
        tapGesture.numberOfTapsRequired = 2
        theMovie.view.addGestureRecognizer(tapGesture)
        
        self.view.addSubview(theMovie.view)
        //theMovie.play()
    }
    
    func didDetectDoubleTap(tap:UITapGestureRecognizer){
        if(isPlaying){
            theMovie.play()
            isPlaying = !isPlaying
        } else{
            theMovie.pause()
            isPlaying = !isPlaying
        }
    }
    
    func moviePlayBackDidFinish(){
        println("Vídeo Terminado")
        buttonPlay.hidden = true
        buttonPause.hidden = true
        buttonForward.hidden = true
        buttonRewind.hidden = true
        buttonReplay.hidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


