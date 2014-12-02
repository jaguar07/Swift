//
//  ViewController.swift
//  EventKitUI
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import EventKitUI

class ViewController: UIViewController, EKEventEditViewDelegate {
    
    var store = EKEventStore()
    
    @IBAction func calendario(sender: UIButton) {
        
        
        store.requestAccessToEntityType(EKEntityTypeEvent, completion: { (granted, error) -> Void in
            if (granted) {
                println("Acceso concedido")
                
                
                var controller = EKEventEditViewController()
                controller.eventStore = self.store
                controller.editViewDelegate = self
                self.presentViewController(controller, animated: true, completion: nil)
            }else{
                println("Acceso denegado")
            }
        })
        
    }
    
    
    @IBAction func eliminaEventos(sender: UIButton) { //CODIGO DE AMPLIACION 1
        //Obtenemos el calendario
        var calendario = NSCalendar.currentCalendar()
        //Obtenemos las fechas de principio y fin
        let haceUnDiaComponents = NSDateComponents()
        haceUnDiaComponents.day = -1
        let haceUnDia : NSDate = calendario.dateByAddingComponents(haceUnDiaComponents, toDate: NSDate(), options: NSCalendarOptions(0))!
        let pasadoUnAnyoComponents = NSDateComponents()
        pasadoUnAnyoComponents.year = 1
        let pasadoUnAnyo : NSDate = calendario.dateByAddingComponents(pasadoUnAnyoComponents, toDate: NSDate(), options: NSCalendarOptions(0))!
        //Creamos el predicado a partir de las fechas
        let predicado : NSPredicate = self.store.predicateForEventsWithStartDate(haceUnDia, endDate: pasadoUnAnyo, calendars: nil)
        //Obtenemos los eventos asociados
        let eventos : NSArray = self.store.eventsMatchingPredicate(predicado)
        
        
        
        
        //RECORREMOS TODOS LOS EVENTOS DEL INTERVALO DE FECHA SELECCIONADO Y LOS ELIMINAMOS
        for i in eventos{
            self.store.removeEvent(i as EKEvent, span: EKSpanThisEvent, commit: true, error: nil)
            //println(i)
        }
        
    }
    
    
    @IBAction func ponerAlarma(sender: UIButton) { //CODIGO DE AMPLIACION 2
        
        //Obtenemos el calendario
        var calendario = NSCalendar.currentCalendar()
        //Obtenemos las fechas de principio y fin
        let haceUnDiaComponents = NSDateComponents()
        haceUnDiaComponents.day = -1
        let haceUnDia : NSDate = calendario.dateByAddingComponents(haceUnDiaComponents, toDate: NSDate(), options: NSCalendarOptions(0))!
        let pasadoUnAnyoComponents = NSDateComponents()
        pasadoUnAnyoComponents.year = 1
        let pasadoUnAnyo : NSDate = calendario.dateByAddingComponents(pasadoUnAnyoComponents, toDate: NSDate(), options: NSCalendarOptions(0))!
        //Creamos el predicado a partir de las fechas
        let predicado : NSPredicate = self.store.predicateForEventsWithStartDate(haceUnDia, endDate: pasadoUnAnyo, calendars: nil)
        //Obtenemos los eventos asociados
        let eventos : NSArray = self.store.eventsMatchingPredicate(predicado)
        
        
        
        //RECORREMOS TODOS LOS EVENTOS DEL INTERVALO DE FECHA SELECCIONADO Y AÑADIMOS ALARMA
        for i in eventos{
            let eventWithAlarm = i as EKEvent
            let alarm = EKAlarm(relativeOffset: -2.0)
            eventWithAlarm.addAlarm(alarm)
            self.store.saveEvent(eventWithAlarm, span: EKSpanThisEvent, error: nil)
            //println(i)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    override func viewDidAppear(animated: Bool) {
    //
    //    }
    
    func eventEditViewController(controller: EKEventEditViewController!, didCompleteWithAction action: EKEventEditViewAction) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}

