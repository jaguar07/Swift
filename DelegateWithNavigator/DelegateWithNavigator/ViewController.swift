//
//  ViewController.swift
//  DelegateWithNavigator
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, miDelegate {
    
    @IBOutlet weak var labelPrincipal: UILabel!
    
    @IBAction func botonPrincipal(sender: UIButton) {
        
        //Obtenemos la instancia de la clase destino a través del Storyboard
        
        var segundoController: SegundoViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SegundoViewController") as SegundoViewController
        segundoController.datos = "Texto cogido del Padre"
        //Le decimos quien es su delegado
        segundoController.delegate = self
        //Hacemos el push para que navegue
        self.navigationController?.pushViewController(segundoController,
            animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func escribirDatoEnLabel(dato:NSString){
        self.labelPrincipal.text = dato
    }
    
    
}

