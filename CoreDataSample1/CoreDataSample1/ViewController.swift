//
//  ViewController.swift
//  CoreDataSample1
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import CoreData
        

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var results : NSArray?
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var context : NSManagedObjectContext = appDel.managedObjectContext!
        
        
        //INSERT
        //        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as
        //        AppDelegate
        //        var context:NSManagedObjectContext = appDel.managedObjectContext!
        //
//                var celda = NSEntityDescription.insertNewObjectForEntityForName("Celda", inManagedObjectContext:  context) as NSManagedObject
//                celda.setValue("Yoda Tux", forKey: "titulo")
//                celda.setValue("Science Fiction", forKey: "subtitulo")
//                celda.setValue("yodaTux.png", forKey: "imagen")
//                if(!context.save(nil)){
//                    println("Error!")
//                }
        

            
            var request = NSFetchRequest (entityName: "Celda")
            request.returnsObjectsAsFaults = false
            
            results = context.executeFetchRequest(request, error: nil)
            
            if (results!.count>0){
                
                for res in results! {
                println(res)
                }
                
            }
            
            // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
                    super.didReceiveMemoryWarning()
                    // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
                        
                        var cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
                        
                        var aux = results![indexPath.row] as NSManagedObject
                        
                        cell.textLabel.text = aux.valueForKey("titulo") as? String
                        cell.detailTextLabel?.text = aux.valueForKey("subtitulo") as? String
                        cell.imageView.image = UIImage(named: aux.valueForKey("imagen") as String)
                        
                        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                            return results!.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int)-> String  {
        return "TuxMania"
    }
    
    
}

