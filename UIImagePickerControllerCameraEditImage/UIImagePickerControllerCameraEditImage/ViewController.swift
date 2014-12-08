//
//  ViewController.swift
//  UIImagePickerControllerCameraEditImage
//
//  Created by Carlos Butron on 08/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import MediaPlayer
import MobileCoreServices



class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imagenRecortada: UIImageView!
    @IBOutlet weak var imagen: UIImageView!
    @IBAction func useCamera(sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        
        //para seleccionar solo los controles de camara y no de video
        imagePicker.mediaTypes = [kUTTypeImage]
        imagePicker.showsCameraControls = true
        imagePicker.allowsEditing = true
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!){
        
        let image = info[UIImagePickerControllerOriginalImage] as UIImage
        let imageEdited = info[UIImagePickerControllerEditedImage] as UIImage
        let imageData = UIImagePNGRepresentation(image) as NSData
        
        //guarda en album de fotos
        UIImageWriteToSavedPhotosAlbum(image, self, "image:didFinishSavingWithError:contextInfo:", nil)
        
        //guarda en documents
        let documentsPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as NSString
        let filePath = documentsPath.stringByAppendingPathComponent("pic.png")
        imageData.writeToFile(filePath, atomically: true)
        
        imagen.image = image
        imagenRecortada.image = imageEdited
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo: UnsafePointer<()>){
        if(error != nil){
            println("ERROR IMAGE \(error.debugDescription)")
        }
    }
    
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController!){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}



