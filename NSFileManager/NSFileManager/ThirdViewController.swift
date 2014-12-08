//
//  ThirdViewController.swift
//  NSFileManager
//
//  Created by Carlos Butron on 06/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var fileManager = NSFileManager.defaultManager()
    var documentsPath = (NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first as NSString)

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var txtBox: UITextView!
    
    
    @IBAction func open(sender: UIButton) {
    
    if(fileManager.fileExistsAtPath(documentsPath.stringByAppendingPathComponent("\(name.text).txt"))){
        var contenido = NSString(data: fileManager.contentsAtPath(documentsPath.stringByAppendingPathComponent("\(name.text).txt"))!, encoding: NSUTF8StringEncoding)
        txtBox.text = contenido
    }
    
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
