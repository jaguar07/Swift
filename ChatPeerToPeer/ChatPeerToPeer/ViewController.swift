//
//  ViewController.swift
//  ChatPeerToPeer
//
//  Created by Carlos Butron on 07/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController,  MCSessionDelegate, MCBrowserViewControllerDelegate,UITextFieldDelegate {
    var browserVC:MCBrowserViewController!
    var advertiserAssistant: MCAdvertiserAssistant!
    var session: MCSession!
    var peerID: MCPeerID!
    
    @IBAction func button(sender: UIButton) {
        showBrowserVC()
    }
    
    
    @IBOutlet weak var textBox: UITextView!
    @IBOutlet weak var sendText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMultipeer()
    }
    
    func setUpMultipeer(){
        peerID = MCPeerID(displayName: UIDevice.currentDevice().name)
        session = MCSession(peer: peerID)
        session.delegate = self
        browserVC = MCBrowserViewController(serviceType: "chat", session: session)
        browserVC.delegate = self
        advertiserAssistant = MCAdvertiserAssistant(serviceType: "chat", discoveryInfo: nil, session: session)
        advertiserAssistant.start()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func enviarMensaje(){
        var mensaje:NSString = self.sendText.text
        self.sendText.text = ""
        var data :NSData = mensaje.dataUsingEncoding(NSUTF8StringEncoding)!
        var error:NSError?
        self.session.sendData(data, toPeers:
            self.session.connectedPeers, withMode: MCSessionSendDataMode.Unreliable, error: &error)
        self.recepcionMensaje(mensaje, peer: self.peerID)
    }
    
    func recepcionMensaje(mensaje:NSString, peer:MCPeerID){
        var finalText:NSString
        if(peer == self.peerID){
            finalText = "\nYo: \(mensaje)"
        }
        else{
            finalText = "\n\(peer.displayName): \(mensaje)"
        }
        self.textBox.text =
            self.textBox.text.stringByAppendingString(finalText)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        self.enviarMensaje()
        return true
    }
    
    
    func session(session: MCSession!, peer peerID: MCPeerID!, didChangeState state: MCSessionState){
    }
    
    func session(session: MCSession!, didReceiveData data: NSData!, fromPeer peerID: MCPeerID!){
        var mensaje = NSString(data: data, encoding:
            NSUTF8StringEncoding)
        dispatch_async(dispatch_get_main_queue(),
            {self.recepcionMensaje(mensaje!, peer: peerID)})
    }
    
    func session(session: MCSession!, didReceiveStream stream: NSInputStream!, withName streamName: String!, fromPeer peerID:MCPeerID!){
    }
    func session(session: MCSession!, didStartReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, withProgress progress: NSProgress!){
    }
    func session(session: MCSession!, didFinishReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, atURL localURL: NSURL!, withError error: NSError!){
    }
    
    func browserViewControllerDidFinish(browserViewController:
        MCBrowserViewController!){
            self.dismissBrowserVC()
    }
    // Notifies delegate that the user taps the cancel button.
    func browserViewControllerWasCancelled(browserViewController: MCBrowserViewController!){
        self.dismissBrowserVC()
    }
    func showBrowserVC(){
        self.presentViewController(self.browserVC, animated: true,
            completion: nil)
    }
    func dismissBrowserVC(){
        self.browserVC.dismissViewControllerAnimated(true, completion:
            nil) }
    
    
}

