//
//  ViewController.swift
//  NSFileManager
//
//  Created by Carlos Butron on 06/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var files: NSMutableArray = []
    var fileManager:NSFileManager!
    var documentsPath: NSString!
    var filelist:NSArray!
    
    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        files = []
        fileManager = NSFileManager.defaultManager()
        documentsPath = (NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first as NSString)
        filelist = fileManager.contentsOfDirectoryAtPath(documentsPath,error: nil)!
        
        println("documentspath:  \(documentsPath)")
        println(files.count)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        filelist = fileManager.contentsOfDirectoryAtPath(documentsPath, error: nil)!
        files = []
        for file in filelist {
            files.addObject(file)
            println("file:  \(file)")
        }
        tabla.reloadData()
        
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return files.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var identifier:NSString = "CollectionCell"
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as UITableViewCell
        
        
        cell.textLabel.text = files.objectAtIndex(indexPath.row).description
        
        var isDir: ObjCBool = ObjCBool(false)
        if(fileManager.fileExistsAtPath(documentsPath.stringByAppendingPathComponent(files[indexPath.row] as String), isDirectory: &isDir)){
            if(isDir){
                cell.imageView.image = UIImage(named: "directorio.png")
            } else{
                cell.imageView.image = UIImage(named: "fichero.png")
            }
        }
        
        
        
        return cell
    }
    
    
    
    
    
    
}


