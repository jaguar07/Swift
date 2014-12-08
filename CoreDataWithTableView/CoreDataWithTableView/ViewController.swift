//
//  ViewController.swift
//  CoreDataWithTableView
//
//  Created by Carlos Butron on 06/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var results: NSArray! = NSArray()
    var appDel: AppDelegate!
    var context: NSManagedObjectContext!
    var request : NSFetchRequest!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDel = UIApplication.sharedApplication().delegate as AppDelegate
        context = appDel.managedObjectContext!
        
        //Codigo para añadir una pelicula
//                var pelicula = NSEntityDescription.insertNewObjectForEntityForName("Pelicula", inManagedObjectContext:  context) as NSManagedObject
//                pelicula.setValue("El Hobbit: Un viaje inesperado", forKey: "titulo")
//                pelicula.setValue("2013", forKey: "year")
//                pelicula.setValue("Peter Jackson", forKey: "director")
//                pelicula.setValue("hobbit.jpg", forKey: "imagen")
//                    if(!context.save(nil)){
//                    println("Error!")
//                }

        
        
        loadTabla()
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadTabla(){
        var request = NSFetchRequest(entityName: "Pelicula")
        request.returnsObjectsAsFaults = false
        results = context.executeFetchRequest(request, error: nil)!
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: MyTableViewCell = tableView.dequeueReusableCellWithIdentifier("MyTableViewCell") as MyTableViewCell
        
        var aux = results[indexPath.row] as NSManagedObject
        cell.titulo.text = aux.valueForKey("titulo") as? String
        cell.director.text = aux.valueForKey("director") as? String
        cell.year.text = aux.valueForKey("year") as? String
        cell.imagen.image = UIImage(named:aux.valueForKey("imagen") as String)
        
        return cell
        
    }
    
    
    
    
    
    
}


