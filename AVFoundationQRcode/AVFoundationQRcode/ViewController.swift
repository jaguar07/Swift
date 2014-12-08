//
//  ViewController.swift
//  AVFoundationQRcode
//
//  Created by Carlos Butron on 07/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet var previewView: UIView!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var captureSession : AVCaptureSession!
    var metadataOutput: AVCaptureMetadataOutput!
    var videoDevice:AVCaptureDevice!
    var videoInput: AVCaptureDeviceInput!
    var running = false
    
    var sendURL: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupCaptureSession() //Implementado posteriormente
        previewLayer.frame = previewView.bounds
        previewView.layer.addSublayer(previewLayer)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "startRunning:", name:UIApplicationWillEnterForegroundNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "stopRunning:", name:UIApplicationDidEnterBackgroundNotification, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startRunning(){
        captureSession.startRunning()
        metadataOutput.metadataObjectTypes =
            metadataOutput.availableMetadataObjectTypes
        running = true
    }
    func stopRunning(){
        captureSession.stopRunning()
        running = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.startRunning()
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.stopRunning()
    }
    
    func setupCaptureSession(){
        
        if(captureSession != nil){
            return
        }
        videoDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        if(videoDevice == nil){
            println("No camera on this device")
        }
        captureSession = AVCaptureSession()
        videoInput = AVCaptureDeviceInput.deviceInputWithDevice(videoDevice, error: nil) as AVCaptureDeviceInput
        
        if(captureSession.canAddInput(videoInput)){
            captureSession.addInput(videoInput)
        }
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        metadataOutput = AVCaptureMetadataOutput()
        var metadataQueue = dispatch_queue_create("com.example.QRCode.metadata", nil)
        metadataOutput.setMetadataObjectsDelegate(self, queue: metadataQueue)
        
        if(captureSession.canAddOutput(metadataOutput)){
            captureSession.addOutput(metadataOutput)
        } }
    
    func captureOutput(captureOutput: AVCaptureOutput!,
        didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection
        connection: AVCaptureConnection!) {
            var elemento = metadataObjects.first as?
            AVMetadataMachineReadableCodeObject
            if(elemento != nil){
                println(elemento!.stringValue)
                sendURL = elemento!.stringValue

            }
    }
    

    
}



