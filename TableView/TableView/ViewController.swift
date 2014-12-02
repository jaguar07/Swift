//
//  ViewController.swift
//  TableView
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Número de Filas
    func tableView(tableView: UITableView, numberOfRowsInSection section:
        Int) -> Int{
            return 4 }
    //Contenido de las celdas
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell{
            var cell:UITableViewCell = UITableViewCell(style:
                UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
            cell.textLabel.text = "Texto de la Celda"
            cell.detailTextLabel?.text = "Subtitulo de la Celda"
            cell.imageView.image = UIImage(named:"imagen1.png")
            return cell
    }
    //Título de la Cabecera
    func tableView(tableView: UITableView, titleForHeaderInSection section:
        Int) -> String{
            return "Cabecera"
    }
    //Subtítulo del Pie de Tabla
    func tableView(tableView: UITableView, titleForFooterInSection section:
        Int) -> String{
            return "Pie de Tabla"
    }
    
}

