//
//  ListadoTableViewController.swift
//  AgendaBasica
//
//  Created by Carlos Butron on 30/11/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit


class ListadoTableViewController: UITableViewController, NuevoContactoDelegate {
    
    var contactosArray = Array<Contacto>()

    override func viewDidLoad() {
        super.viewDidLoad()


        for i in 1...50 {
            var contacto = Contacto()
            
            contacto.nombre = "Nombre\(i)"
            contacto.apellidos = "Apellidos\(i)"
            contacto.telefono = "Teléfono\(i)"
            contacto.email = "Email\(i)"
            
            contactosArray.append(contacto)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactosArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let contacto = contactosArray[indexPath.row]
        cell.textLabel.text = contacto.nombre + " " + contacto.apellidos
        cell.tag = indexPath.row
        println("Celda número: \(indexPath.row)")
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToDetalleFromListado" {
            var detalleViewController = segue.destinationViewController as DetalleViewController
            var celda = sender as UITableViewCell
            
            detalleViewController.contacto = contactosArray[celda.tag]
        } else if segue.identifier == "goToNuevoContactoFromListado" {
            var navigationController = segue.destinationViewController as UINavigationController
            var nuevoContactoViewController = navigationController.viewControllers[0] as NuevoContactoViewController
            nuevoContactoViewController.delegate = self
            
        }
    }
    
    // MARK: - Delegate
    
    func nuevoContacto(contacto: Contacto) {
        contactosArray.append(contacto)
        tableView.reloadData()
        
    }
    

}
