//
//  ViewController.swift
//  MapKit iPad
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import MapKit




class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var latitud: UILabel!
    @IBOutlet weak var longitud: UILabel!
    @IBOutlet weak var mapa: MKMapView!
    
    var set = NSMutableArray()
    
    @IBAction func creaAnotacion(sender: AnyObject) {
        
        var a = MiAnotacion(c: mapa.centerCoordinate, t: "Centro", st: "El centro del mapa")
        
        mapView(mapa, viewForAnnotation: a)
        
        
        mapa.addAnnotation(a)
        
        
        set.addObject(a)
        
        
    }
    
    @IBAction func borrarAnotacion(sender: AnyObject) {
        
        for (var i=0; i<mapa.annotations.count; i++) {
            mapa.removeAnnotations(set)
        }
        
        
    }
    
    @IBAction func coordenadas(sender: AnyObject) {
        
        
        latitud.text = "\(mapa.centerCoordinate.latitude)"
        longitud.text = "\(mapa.centerCoordinate.longitude)"
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapa.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation:
        MKAnnotation!) -> MKAnnotationView!{
            var pinView:MKPinAnnotationView = MKPinAnnotationView(annotation:
                annotation, reuseIdentifier: "Custom")
            //descomentamos esta linea para darle color purpura y comentamos la siguiente de la imagen
            //pinView.pinColor = MKPinAnnotationColor.Purple
            pinView.image = UIImage(named:"mypin.png")
            return pinView
    }
    
    
    
}



