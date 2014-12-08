//
//  DocumentPhoto.swift
//  iCloud
//
//  Created by Carlos Butron on 07/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class DocumentPhoto: UIDocument {
    var image : UIImage!
    
    override func loadFromContents(contents: AnyObject, ofType typeName: String, error outError: NSErrorPointer) -> Bool {
        
        var data = NSData(bytes: contents.bytes, length: contents.length)
        self.image = UIImage(data: data)
        
        return true
    }
    
    override func contentsForType(typeName: String, error outError: NSErrorPointer) -> AnyObject? {
        
        return UIImageJPEGRepresentation(self.image, 1.0)
    }
    
//    override func loadFromContents(contents: AnyObject, ofType typeName:
//        String, error outError: NSErrorPointer) -> Bool {
//        if (contents.length > 0){
//        var data = NSData(bytes: contents.bytes, length:
//        contents.length)
//        self.image = UIImage(data: data)
//        }
//        return true
//    }
//    override func contentsForType(typeName: String, error outError:
//        NSErrorPointer) -> AnyObject? {
//        if (self.image == nil){
//        image = UIImage()
//        }
//        return UIImageJPEGRepresentation(self.image, 1.0)
//    }
    
    
    
    
    
}
