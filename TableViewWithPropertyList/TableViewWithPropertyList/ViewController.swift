//
//  ViewController.swift
//  TableViewWithPropertyList
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var celdas : NSDictionary? //Variable Global
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().bundlePath
        let plistName:NSString = "Property List.plist"
        let finalPath:NSString = path.stringByAppendingPathComponent(plistName)
        celdas = NSDictionary(contentsOfFile:finalPath)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return celdas!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        
        //let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
        let cell:CeldaPersonalizada = tableView.dequeueReusableCellWithIdentifier("CeldaPersonalizada") as CeldaPersonalizada
        
        let celda: AnyObject = celdas!.objectForKey("celda\(indexPath.row)") as NSDictionary
        
        //cell.textLabel?.text = celda.objectForKey("titulo") as? String
        //cell.detailTextLabel?.text = celda.objectForKey("subtitulo") as? String
        //cell.imageView?.image = UIImage(named: celda.objectForKey("imagen") as String)
        
        cell.titulo?.text = celda.objectForKey("titulo") as? String
        cell.subtitulo?.text = celda.objectForKey("subtitulo") as? String
        cell.imagen?.image = UIImage(named: celda.objectForKey("imagen") as String)
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section:Int) -> String  {
        
        return "TuxMania"
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section:Int) -> String {
        
        return "Hazte con Todos"
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



