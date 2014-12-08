//
//  NuevoContactoViewController.swift
//  AgendaBasica
//
//  Created by Carlos Butron on 30/11/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

protocol NuevoContactoDelegate {
    func nuevoContacto(contacto: Contacto)
}

class NuevoContactoViewController: UIViewController {

    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var apellidosTextField: UITextField!
    @IBOutlet weak var telefonoTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var delegate: NuevoContactoDelegate?
    
    @IBAction func guardarPushButton(sender: AnyObject) {
        
        var contacto = Contacto()
        
        contacto.nombre = nombreTextField.text
        contacto.apellidos = apellidosTextField.text
        contacto.telefono = telefonoTextField.text
        contacto.email = emailTextField.text
        
        delegate?.nuevoContacto(contacto)
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func cancelarPushButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
