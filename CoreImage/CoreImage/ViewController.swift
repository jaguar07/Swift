//
//  ViewController.swift
//  CoreImage
//
//  Created by Carlos Butron on 07/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import CoreImage


class ViewController: UIViewController {
    
    
    //SLIDER APLICADA A LOS DOS PRIMEROS FILTROS
    //el funcionamiento es el siguiente: al cambiar el slider cambia el valor
    //una vez cambiado hay que volver a pulsar sobre el botón del filtro "sepia" o "vignette" para que se aplique
    
    var sliderValue: Float = 0.0
    
    @IBOutlet weak var imagen: UIImageView!
    
    @IBAction func sepia(sender: UIButton) {
        applyfilter(1);
    }
    
    @IBAction func vignette(sender: UIButton) {
        applyfilter(2);
    }
    
    
    @IBAction func invert(sender: UIButton) {
        applyfilter(3);
    }
    
    @IBAction func photo(sender: UIButton) {
        applyfilter(4);
    }
    
    @IBAction func perspective(sender: UIButton) {
        applyfilter(5);
    }
    
    @IBAction func gaussian(sender: UIButton) {
        applyfilter(6);
    }
    
    @IBAction func slider(sender: UISlider) {
        
        sliderValue = sender.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func applyfilter(numberFilter: Int) {
        
        let filePath : NSString = NSBundle.mainBundle().pathForResource("imagen", ofType: "jpg")!
        let fileUrl : NSURL = NSURL (fileURLWithPath: filePath)!
        let inputImage : CIImage = CIImage (contentsOfURL: fileUrl)
        
        switch numberFilter {
        case 1:
            var filtro : CIFilter = CIFilter (name: "CISepiaTone")
            filtro.setValue(inputImage, forKey: kCIInputImageKey)
            //filtro.setValue(1.0, forKey: "InputIntensity")
            filtro.setValue(sliderValue, forKey: "InputIntensity")
            let outputImage : CIImage = filtro.valueForKey(kCIOutputImageKey) as CIImage
            var img : UIImage = UIImage (CIImage: outputImage)!
            imagen.image = img
        case 2:
            var filtro : CIFilter = CIFilter (name: "CIVignette")
            filtro.setValue(inputImage, forKey: kCIInputImageKey)
            filtro.setValue(sliderValue, forKey: "InputRadius")
            filtro.setValue(sliderValue, forKey: "InputIntensity")
            let outputImage : CIImage = filtro.valueForKey(kCIOutputImageKey) as CIImage
            var img : UIImage = UIImage (CIImage: outputImage)!
            imagen.image = img
        case 3:
            var filtro : CIFilter = CIFilter (name: "CIColorInvert")
            filtro.setValue(inputImage, forKey: kCIInputImageKey)
            let outputImage : CIImage = filtro.valueForKey(kCIOutputImageKey) as CIImage
            var img : UIImage = UIImage (CIImage: outputImage)!
            imagen.image = img
        case 4:
            var filtro : CIFilter = CIFilter (name: "CIPhotoEffectMono")
            filtro.setValue(inputImage, forKey: kCIInputImageKey)
            
            let outputImage : CIImage = filtro.valueForKey(kCIOutputImageKey) as CIImage
            var img : UIImage = UIImage (CIImage: outputImage)!
            imagen.image = img
        case 5:
            var filtro : CIFilter = CIFilter (name: "CIPerspectiveTransform")
            filtro.setValue(inputImage, forKey: kCIInputImageKey)
            
            let outputImage : CIImage = filtro.valueForKey(kCIOutputImageKey) as CIImage
            var img : UIImage = UIImage (CIImage: outputImage)!
            imagen.image = img
        case 6:
            var filtro : CIFilter = CIFilter (name: "CIGaussianBlur")
            filtro.setValue(inputImage, forKey: kCIInputImageKey)
            
            let outputImage : CIImage = filtro.valueForKey(kCIOutputImageKey) as CIImage
            var img : UIImage = UIImage (CIImage: outputImage)!
            imagen.image = img
        default:
            println("test")
            
        }
        
        
        
        
        
        
        
    }
    
    
    
    
}
