//
//  ViewController.swift
//  Calendar
//
//  Created by Carlos Butron on 07/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var eventStore : EKEventStore!
    var calendar: EKCalendar!
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var eventCalendario: UITextField!
    @IBOutlet weak var titleEvent: UITextField!
    
    @IBAction func saveCalendar(sender: UIButton) {
        var date = datePicker.date
        var name = textField.text
        var localSource: EKSource
        var calendar = EKCalendar(eventStore: eventStore)
        eventStore.requestAccessToEntityType(EKEntityTypeEvent, completion: {(granted,error) in
            if(granted == false){
                println("Acceso no Permitido")
            }
            else{
                var auxiliar = self.eventStore.sources() as [EKSource]
                calendar.source = auxiliar[0]
                calendar.title = self.textField.text
                println(calendar.title)
                var error:NSError?
                self.eventStore.saveCalendar(calendar, commit: true, error: &error)
            }
        })
    }
    
    @IBAction func saveEvent(sender: UIButton) {
        
        eventStore.requestAccessToEntityType(EKEntityTypeEvent, completion: {(granted,error) in
            if(granted == false){
                println("Acceso no Permitido")
            }
            else{
                var arrayCalendars = self.eventStore.calendarsForEntityType(EKEntityTypeEvent)
                var theCalendar: EKCalendar!
                for calendario in arrayCalendars{
                    if(calendario.title == self.eventCalendario.text){
                        theCalendar = calendario as EKCalendar
                        println(theCalendar.title)
                    }
                }
                if(theCalendar != nil){
                    var event = EKEvent(eventStore: self.eventStore)
                    event.title = self.titleEvent.text
                    event.startDate = self.datePicker.date
                    event.endDate = self.datePicker.date.dateByAddingTimeInterval(3600)
                    event.calendar = theCalendar
                    var error:NSError?
                    if(self.eventStore.saveEvent(event, span: EKSpanThisEvent, error: &error)){
                        var alert = UIAlertController(title: "Calendario", message: "Creado evento \(event.title) en \(theCalendar.title)", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: nil))
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.presentViewController(alert, animated: true, completion: nil)
                        })
                    }
                }
                else{
                    println("No hay ningún calendario con ese nombre")
                }
            }
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventStore = EKEventStore()
        
        let tapGestureRecognizer : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyBoard")
        
        self.view.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyBoard() {
        self.textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    //called when users tap out of textfield
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    
}

