//
//  ImagesOperation.swift
//  XMLAppStore
//
//  Created by Carlos Butron on 07/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import Foundation


protocol ImagesOperationDelegate{
    func imageOperation(imagesOperation:ImagesOperation, app:AppInfo)
}

class ImagesOperation: NSOperation, NSURLConnectionDelegate {
    
    var delegate: ImagesOperationDelegate?
    var app: AppInfo!
    var currentData:NSMutableData!
    
    override func main(){
        var connection = NSURLConnection(request: NSURLRequest(URL: NSURL(string: app.urlImage)!), delegate: self, startImmediately: false)
        connection!.scheduleInRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
        connection!.start()
        self.currentData = NSMutableData()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.currentData.appendData(data)
    }
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!){
        self.currentData = nil
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!){
        var image: UIImage? = UIImage(data: self.currentData)
            if(image != nil){
                self.app.image = image
                self.delegate?.imageOperation(self, app: self.app)
            }
    }

}