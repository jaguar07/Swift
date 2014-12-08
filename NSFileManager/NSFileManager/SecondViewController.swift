//
//  SecondViewController.swift
//  NSFileManager
//
//  Created by Carlos Butron on 06/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var nameDirectory: UITextField!
    
    
    
    @IBAction func createFile(sender: UIButton) {
        
        var content = text.text.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        if(fileManager.createFileAtPath(documentsPath.stringByAppendingPathComponent("\(name.text).txt"), contents: content, attributes: nil)){
            println("created")
        }
        
    }
    
    @IBAction func createDirectory(sender: UIButton) {
            
        var newDirectory:NSString = documentsPath.stringByAppendingPathComponent(nameDirectory.text)
        if(fileManager.createDirectoryAtPath(newDirectory, withIntermediateDirectories: true, attributes: nil, error: nil) == true){
            println("creado")
        }
            
    }
    
    var fileManager = NSFileManager.defaultManager()
    var documentsPath = (NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first as NSString)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.delegate = self
        nameDirectory.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
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
