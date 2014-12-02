//
//  SegundoViewController.swift
//  T11E4CarlosButron
//
//  Created by Carlos Butron on 02/09/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

protocol miDelegate {
    func escribirDatoEnLabel(dato:NSString)
}

class SegundoViewController: UIViewController {

    var datos: NSString = ""
    var delegate: miDelegate?
    
    @IBOutlet weak var labelSegundo: UILabel!
    
    @IBAction func botonSegundo(sender: AnyObject) {
        self.delegate?.escribirDatoEnLabel("¡Lo logré!")
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelSegundo.text = datos
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
