//
//  ViewController.swift
//  NSURLSessionDownloadDelegate
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLSessionDownloadDelegate {
    
    var session = NSURLSession()
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var progreso: UIProgressView!
    
    @IBAction func cargar(sender: UIButton) {
        
        var imageUrl: NSString = "http://carlosbutron.es/wp-content/uploads/2014/11/logo-carlosbutrondev.jpg"
        var getImageTask: NSURLSessionDownloadTask =
        session.downloadTaskWithURL(NSURL(string: imageUrl)!)
        getImageTask.resume()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var sessionConfig =
        NSURLSessionConfiguration.defaultSessionConfiguration()
        session = NSURLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL){
        println("Descarga Terminada")
        var downloadedImage = UIImage(data: NSData(contentsOfURL: location)!)
        dispatch_async(dispatch_get_main_queue(), {() in
            self.imagen.image = downloadedImage
        })
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64,totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64){
        dispatch_async(dispatch_get_main_queue(), {() in
            var variable = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
            self.progreso.progress = variable
        }) }
    
    
}


