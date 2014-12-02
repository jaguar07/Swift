//
//  ViewController.swift
//  CollectionView
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var items : NSArray = [UIImage(named:"imagen1.jpg")!,UIImage(named:"imagen2.jpg")!,UIImage(named:"imagen3.jpg")!,UIImage(named:"imagen4.jpg")!,UIImage(named:"imagen5.jpg")!,UIImage(named:"imagen6.jpg")!,UIImage(named:"imagen7.jpg")!,UIImage(named:"imagen8.jpg")!,UIImage(named:"imagen9.jpg")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        

        // Dispose of any resources that can be recreated.
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count * 5
    }
    

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var identifier: NSString = "CollectionCell"
        var cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as UICollectionViewCell
        
        var imageView: UIImageView = cell.viewWithTag(1) as UIImageView
        imageView.image = items.objectAtIndex(indexPath.row%9) as? UIImage
        return cell
    }
    
    



}

