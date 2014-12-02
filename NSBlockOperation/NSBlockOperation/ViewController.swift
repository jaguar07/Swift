//
//  ViewController.swift
//  NSBlockOperation
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        
        var queue = NSOperationQueue()
        
        let operation1 : NSBlockOperation = NSBlockOperation (
            {
                self.getWebs()
                
                let operation2 : NSBlockOperation = NSBlockOperation({
                    self.loadWebs()
                })
                queue.addOperation(operation2)
        })
        queue.addOperation(operation1)
        
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadWebs(){
        let urls : NSMutableArray = NSMutableArray (objects:NSURL(string:"http://www.google.es")!, NSURL(string: "http://www.apple.com")!,NSURL(string: "http://carlosbutron.es")!, NSURL(string: "http://www.bing.com")!,NSURL(string: "http://www.yahoo.com")!)
        urls.addObjectsFromArray(googlewebs)
        for iterator:AnyObject in urls{
            NSData(contentsOfURL:iterator as NSURL)
            println("Descargado \(iterator)")
        }
    }
    
    var googlewebs:NSArray = []
    
    func getWebs(){
        let languages:NSArray = ["com","ad","ae","com.af","com.ag","com.ai","am","co.ao","com.ar","as","at"]
        var languageWebs = NSMutableArray()
        for(var i=0;i < languages.count; i++){
            var webString: NSString = "http://www.google.\(languages[i])"
            languageWebs.addObject(NSURL(fileURLWithPath: webString)!)
        }
        googlewebs = languageWebs
    }
    
    
    
    
    
}




