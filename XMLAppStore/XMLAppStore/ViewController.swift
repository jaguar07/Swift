//
//  ViewController.swift
//  XMLAppStore
//
//  Created by Carlos Butron on 07/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, NSURLConnectionDelegate, NSXMLParserDelegate, UITableViewDataSource, UITableViewDelegate, ImagesOperationDelegate {
    
    @IBOutlet weak var tabla: UITableView!
    var listData: NSMutableData!
    var currentString: NSMutableString!
    var shouldParse:Bool!
    var apps:NSMutableArray!
    var currentApp:AppInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var queue = NSOperationQueue()
        var urlRequest = NSURLRequest(URL: NSURL(string:"http://phobos.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=75/xml")!)
        
        NSURLConnection(request: urlRequest, delegate: self)
        currentString = NSMutableString(string: "")
        apps = NSMutableArray()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!){
        listData = NSMutableData()
        println("Did receive Response")
    }
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        listData.appendData(data)
        println("Did Receive Data")
    }
    func connectionDidFinishLoading(connection: NSURLConnection!){
        println("Did finish loading")
        let parser = NSXMLParser(data: listData)
        parser.delegate = self
        parser.parse()
        tabla.reloadData()
        var queue = NSOperationQueue()
        for it in apps{
            var imagesOperation = ImagesOperation()
            imagesOperation.app = it as AppInfo
            imagesOperation.delegate = self
            queue.addOperation(imagesOperation)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!){
        
        let elementsToParse = NSArray(objects: "id","im:name","im:image")
        
        if(elementName == "entry"){
            self.currentApp = AppInfo()
        }
        shouldParse = elementsToParse.containsObject(elementName)
    }
    
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!){
        if(self.currentApp != nil){
            //if(shouldParse || elementName == "entry"){
            var trimmedString = currentString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            currentString.setString("")
            if(elementName == "id"){
                self.currentApp.urlApp = trimmedString
                println("URL APP: \(trimmedString)")
            }
            else if(elementName == "im:name"){
                self.currentApp.name = trimmedString
                println("NAME: \(trimmedString)")
            }
            else if(elementName == "im:image"){
                self.currentApp.urlImage = trimmedString
                println("URL IMAGE: \(trimmedString)")
            }
            else if(elementName == "entry"){
                self.currentApp.index = apps.count
                apps.addObject(currentApp)
                currentApp = nil
            }
            // }
        }
    }
    
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!)
    {
        if((shouldParse) != nil){
            currentString.appendString(string)
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = tabla.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        var label: UILabel = cell.viewWithTag(101) as UILabel
        var app = apps.objectAtIndex(indexPath.row) as AppInfo
        label.text = app.name
        var imageView = cell.viewWithTag(100) as UIImageView
        imageView.image = app.image
        
        return cell
    }
    
    func imageOperation(imagesOperation:ImagesOperation, app:AppInfo){
        var visibleCells = tabla.visibleCells()
        var firstIndex = tabla.indexPathForCell(visibleCells[0] as UITableViewCell)?.row
        var lastIndex = tabla.indexPathForCell(visibleCells.last as UITableViewCell)?.row
        if(app.index >= firstIndex && app.index <= lastIndex){
            var cell = tabla.cellForRowAtIndexPath(NSIndexPath(forRow: app.index, inSection: 0))
            var imageView = cell?.viewWithTag(100) as UIImageView
            imageView.image = app.image
        }
    }
    
    
}


