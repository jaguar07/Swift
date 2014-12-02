//
//  ViewController.swift
//  CoreDataSample2
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var results: NSArray?
    
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var apellido: UITextField!
    @IBOutlet weak var tabla: UITableView!
    @IBAction func guardar(sender: UIButton) {
        
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        var celda = NSEntityDescription.insertNewObjectForEntityForName("Formulario", inManagedObjectContext:  context) as NSManagedObject
        celda.setValue(nombre.text, forKey: "nombre")
        celda.setValue(apellido.text, forKey: "apellido")
        
        context.save(nil)
        
        if(!context.save(nil)){
            println("Error!")
        }
        
        
        self.loadTabla()
        self.tabla.reloadData()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTabla() //Carga inicial
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
        var aux = results![indexPath.row] as NSManagedObject
        cell.textLabel.text = aux.valueForKey("nombre") as NSString
        cell.detailTextLabel?.text = aux.valueForKey("apellido") as NSString
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results!.count
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String  {
        return "Contactos"
    }
    
    func loadTabla(){
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        var request = NSFetchRequest(entityName: "Formulario")
        request.returnsObjectsAsFaults = false
        results = context.executeFetchRequest(request, error: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



