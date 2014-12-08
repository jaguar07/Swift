//
//  ViewController.swift
//  iCloud
//
//  Created by Carlos Butron on 07/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var celdas: NSMutableArray = NSMutableArray()
    
    
    var container = NSFileManager.defaultManager().URLForUbiquityContainerIdentifier(nil)
    var metadataQuery : NSMetadataQuery!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func borrarFotos(sender: UIBarButtonItem) {
        
        removeImagesFromICloud()
    }
    
    @IBAction func elegirFotos(sender: UIBarButtonItem) {
        var action = UIAlertController (title: "Fotos", message: "¿De dónde quieres obtener las fotos?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        action.addAction(UIAlertAction(title: "Cámara", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            println("Elegimos de la camara")
            self.capturaFotos(true)
        }))
        action.addAction(UIAlertAction(title: "Galería", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            println("Elegimos de la galería")
            self.capturaFotos(false)
        }))
        self.presentViewController(action, animated: true, completion: nil)
    }
    
    func capturaFotos (camara: Bool){
        let picker = UIImagePickerController()
        picker.delegate = self
        if (camara){
            picker.sourceType = UIImagePickerControllerSourceType.Camera
        }else{
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            println("Elegimos de la galería2")
        }
        picker.allowsEditing = false
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        self.dismissViewControllerAnimated(true, completion: nil)
        var fullImage = (info as NSDictionary)[UIImagePickerControllerOriginalImage] as UIImage
        println("Elegimos de la galería3")
        savePhotoICloud(fullImage)
    }
    
    
    
    
    func savePhotoICloud (imagen: UIImage){
        var fecha = NSDate()
        var df = NSDateFormatter()
        df.dateFormat = "dd_MM_yy_hh_mm_ss"
        
        var photoName = NSString (format: "PHOTO_%@", df.stringFromDate(fecha))
        
        if (container != nil){
            var fileURLiCloud = container!.URLByAppendingPathComponent("Documents").URLByAppendingPathComponent(photoName)
            var photo = DocumentPhoto (fileURL: fileURLiCloud)
            photo.image = imagen
            
            photo.saveToURL(fileURLiCloud, forSaveOperation: UIDocumentSaveOperation.ForCreating, completionHandler: { (success) -> Void
                in
                self.celdas.addObject(imagen)
                println("Elegimos de la galería4")
                self.collectionView.reloadData()
            })
        }
    }
    
    
    func removeImagesFromICloud (){
        if (container != nil){
            self.metadataQuery = NSMetadataQuery()
            self.metadataQuery.searchScopes = NSArray (object: NSMetadataQueryUbiquitousDocumentsScope)
            
            var predicate = NSPredicate(format: "%K like 'PHOTO*'", NSMetadataItemFSNameKey)
            self.metadataQuery.predicate = predicate
            
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "queryDeleted:", name: NSMetadataQueryDidFinishGatheringNotification,
                object: self.metadataQuery)
            
            self.metadataQuery.startQuery()
        }
    }
    
    func loadImagesFromICloud (){
        if (container != nil){
            self.metadataQuery = NSMetadataQuery()
            self.metadataQuery.searchScopes = NSArray (object: NSMetadataQueryUbiquitousDocumentsScope)
            
            var predicate = NSPredicate(format: "%K like 'PHOTO*'", NSMetadataItemFSNameKey)
            self.metadataQuery.predicate = predicate
            
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "queryFinished:", name: NSMetadataQueryDidFinishGatheringNotification,
                object: self.metadataQuery)
            
            self.metadataQuery.startQuery()
        }
    }
    
    func queryFinished(notification: NSNotification){
        var mq = notification.object as NSMetadataQuery
        mq.disableUpdates()
        mq.stopQuery()
        celdas.removeAllObjects()
        for (var i = 0; i<mq.resultCount;i++){
            var result = mq.resultAtIndex(i) as NSMetadataItem
            var nombre = result.valueForAttribute(NSMetadataItemFSNameKey) as NSString
            var url = result.valueForAttribute(NSMetadataItemURLKey) as NSURL
            var document : DocumentPhoto! = DocumentPhoto(fileURL: url)
            
            
            document?.openWithCompletionHandler({ (success) -> Void in
                if (success == true){
                    self.celdas.addObject(document.image)
                    println("addobject in queryfinished")
                    self.collectionView.reloadData()
                }
            }) }
    }
    
    
    func queryDeleted(notification: NSNotification){
        var mq = notification.object as NSMetadataQuery
        mq.disableUpdates()
        mq.stopQuery()
        celdas.removeAllObjects()
        for (var i = 0; i<mq.resultCount;i++){
            var result = mq.resultAtIndex(i) as NSMetadataItem
            var nombre = result.valueForAttribute(NSMetadataItemFSNameKey) as NSString
            var url = result.valueForAttribute(NSMetadataItemURLKey) as NSURL
            var document : DocumentPhoto! = DocumentPhoto(fileURL: url)
            
            
            var fileManager = NSFileManager()
            fileManager.removeItemAtURL(document.fileURL, error: nil)
            
            self.collectionView.reloadData()
            
            document?.openWithCompletionHandler({ (success) -> Void in
                if (success == true){
                    
                    self.collectionView.reloadData()
                }
            }) }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        savePhotoICloud(UIImage(named: "fondo1.jpg")!)
        loadImagesFromICloud ()
        //        self.collectionView.reloadData()
        //        var imagenView: UIImageView = UIImageView()
        //        imagenView.image = UIImage(named: "imagen1.png")
        //        self.celdas.addObject(imagenView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var identifier:NSString = "CollectionCell"
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as UICollectionViewCell
        
        
        
        var imageView:UIImageView = cell.viewWithTag(1) as UIImageView
        imageView.image = celdas.objectAtIndex(indexPath.row) as? UIImage
        // imageView.image = UIImage(named: "imagen1.png")
        
        
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return celdas.count
    }
    
    
}


