//
//  MiAnotacion.swift
//  MapKit iPad
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import MapKit

class MiAnotacion: NSObject, MKAnnotation {

    var title: NSString
    var subtitle: NSString
    var coordinate: CLLocationCoordinate2D
    func getTitle() -> NSString{
        return self.title
    }
    func getSubTitle() -> NSString {
        return self.subtitle
    }
    init(c:CLLocationCoordinate2D, t:NSString, st: NSString){
        coordinate = c
        title = t
        subtitle = st
    }
    
    
    
    
}
