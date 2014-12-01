//
//  DetalleViewController.swift
//  AgendaBasica
//
//  Created by Carlos Butron on 30/11/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {

    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var apellidosLabel: UILabel!
    @IBOutlet weak var telefonoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var contacto = Contacto()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        nombreLabel.text = contacto.nombre
        apellidosLabel.text = contacto.apellidos
        telefonoLabel.text = contacto.telefono
        emailLabel.text = contacto.email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
