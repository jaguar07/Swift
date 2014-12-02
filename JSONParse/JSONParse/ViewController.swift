//
//  ViewController.swift
//  JSONParse
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var descripcion: UITextView!
    
    var dataJSON = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var stringURL:NSString = "https://itunes.apple.com/es/rss/topfreeapplications/limit=10/json"
        //Construirmos el NSURL
        var url = NSURL(string: stringURL)
        //Construimos la petición NSURLRequest
        var request = NSURLRequest(URL: url!)
        //Creamos la conexion
        var conexion: NSURLConnection? = NSURLConnection(request: request, delegate: self)
        
        if (conexion != nil){
            println("Conectando...")
            dataJSON = NSMutableData()
        }
        else{
            println("Imposible realizar la conexion")
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!){
        println("Error: \(error)")
    }
    
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!){
        println("Received response: \(response)")
        //Como puede ser llamado varias veces, reiniciamos los datos
        dataJSON.length = 0
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data:NSData!){
        self.dataJSON.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!){
        var error: NSError?
        if var dic = NSJSONSerialization.JSONObjectWithData(dataJSON, options: NSJSONReadingOptions.MutableContainers, error: &error) as? NSDictionary{
            //A partir del JSON obtenemos la primera entrada
            var top1: AnyObject = ((dic["feed"] as NSDictionary) ["entry"]! as NSArray) [2]
            var imgJson: AnyObject = (top1["im:image"] as NSArray) [2]
            var url = NSURL(string: imgJson.objectForKey("label") as String)
            var data = NSData(contentsOfURL: url!)
            var img = UIImage(data: data!)
            imagen.image = img
            //Obtenemos el título y la descripción
            var tit = (top1["title"] as NSDictionary) ["label"] as NSString
            var desc = (top1["summary"] as NSDictionary) ["label"] as NSString
            titulo.text = tit
            descripcion.text = desc
        }
    }
    
}

