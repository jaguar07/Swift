//
//  RootViewController.swift
//  XML
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController, NSURLConnectionDelegate, NSXMLParserDelegate {
    
    var xmlData:NSMutableData? = nil
    
    var songs:NSMutableArray = []
    var song:Song = Song(title: "")
    
    var currentStringValue: NSMutableString? = NSMutableString() //Variable Global

    override func viewDidLoad() {
        super.viewDidLoad()


            println("Primera Ejecución")
            var url = NSURL(string: "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=10/xml")
            var request = NSURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData, timeoutInterval: 30)
            self.xmlData = NSMutableData()
            NSURLConnection(request: request, delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("AAAAAA \(songs.count)")
        return songs.count

    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("celda") as UITableViewCell
        var elem = songs[indexPath.row] as Song
        println("AAAAAA \(elem.titulo)")
        cell.textLabel.text = (elem.titulo) as String

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!){
        println("Error al acceder a la URL")
    self.xmlData = nil
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.xmlData!.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!){
        var xmlCheck = NSString(data: self.xmlData!, encoding: NSUTF8StringEncoding)
        //println("El xml recibido es \(xmlCheck)")
        var parser:NSXMLParser =  NSXMLParser(data: self.xmlData)
        parser.delegate = self
        parser.shouldResolveExternalEntities = true
        parser.parse()
            for(var i=0; i<songs.count;i++){
                var elem = songs[i] as Song
                println(elem.titulo)
            }
        self.tableView.reloadData()
    }
    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!){
    
        if(elementName == "feed") {
            //feed es la etiqueta principal. Inicializamos el array para contener las canciones.
            songs = NSMutableArray()
            return
        }
    
        if(elementName == "entry") {
            //Hemos encontrado una nueva canción. Creamos un objeto de la clase Song con su información.
            song = Song(title: "")
            return
        }
    
        if(elementName == "title") {
            currentStringValue = NSMutableString(capacity: 50)
        }
    }
    
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        if(currentStringValue != nil) {
            //El parametro siguiente es un NSMutableString donde vamos almacenando
            //los caracteres del elemento actual.
            currentStringValue = NSMutableString(capacity: 50)
        }
        currentStringValue?.appendString(string)
    }
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!){
            if(elementName == "entry"){
                //Al encontrar el fin de los datos de una canción
                //la agregamos al array
                songs.addObject(song)
            }
        
            if(elementName == "title"){
                //Si encontramos la etiqueta title, almacenamos
                //en el objeto el NSString donde estabamos guardando
                //los caracteres.
                song.titulo = currentStringValue!
            }
    }
    
    

}
