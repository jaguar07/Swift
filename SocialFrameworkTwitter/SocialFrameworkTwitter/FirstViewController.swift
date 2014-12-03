//
//  FirstViewController.swift
//
//  Created by Carlos Butron on 11/11/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import Accounts
import QuartzCore
import Social
import CoreGraphics
import Foundation

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var labelUserName: UITextField!
    @IBOutlet weak var labelFollowers: UILabel!
    @IBOutlet weak var labelFollowing: UILabel!
    @IBOutlet weak var textViewDescription: UITextView!
    
    @IBAction func update(sender: UIButton) {
        if(labelUserName.text != ""){
            checkUser() //Método implementado posteriormente
        }
            else{
            println("Debes introducir un nombre!")
        }
        
    }
    
    @IBAction func sendTweet(sender: UIButton) {
        var twitterController = SLComposeViewController(forServiceType:SLServiceTypeTwitter)
        var imageToTweet = UIImage(named:"imagen1.png")
        twitterController.setInitialText("Test from Xcode")
        twitterController.addImage(imageToTweet)
        var completionHandler:SLComposeViewControllerCompletionHandler = {(result) in
        twitterController.dismissViewControllerAnimated(true, completion: nil)
            switch(result) {
            case SLComposeViewControllerResult.Cancelled:
            println("El Usuario ha cancelado")
            case SLComposeViewControllerResult.Done:
            println("El Usuario ha twitteado")
            default:
            println("El Usuario ha cancelado")
            } }
            twitterController.completionHandler = completionHandler
            self.presentViewController(twitterController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelUserName.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    
    func checkUser(){
        var accountStore = ACAccountStore()
        var accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        accountStore.requestAccessToAccountsWithType(accountType, options: nil, completion: {(granted, error) in
                if(granted == true) {
                var accounts = accountStore.accountsWithAccountType(accountType)
                if(accounts.count>0){
                var twitterAccount = accounts[0] as ACAccount
                var twitterInfoRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: NSURL(string: "https://api.twitter.com/1.1/users/show.json"), parameters: NSDictionary(object: self.labelUserName.text, forKey: "screen_name"))
                twitterInfoRequest.account = twitterAccount
                twitterInfoRequest.performRequestWithHandler({(responseData,urlResponse,error) in
                dispatch_async(dispatch_get_main_queue(), {()
                in
                //Comprobar si el acceso fue rechazado
                if(urlResponse.statusCode == 429){
                println("Rate limit reached")
                return
                }
                //Comprobar si existe algun error
                if((error) != nil){
                println("Error \(error.localizedDescription)")
                }
                if(responseData != nil){
                //Si hemos recibido datos TO DO
                var error: NSError?
                var TWData = NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.MutableLeaves, error: &error) as NSDictionary
                //Obtenemos los datos necesarios
                var followers = TWData.objectForKey("followers_count")!.integerValue
                var following = TWData.objectForKey("friends_count")!.integerValue!
                var description = TWData.objectForKey("description") as NSString
                self.labelFollowers.text = "\(followers)"
                self.labelFollowing.text = "\(following)"
                self.textViewDescription.text = description
                
                var profileImageStringURL = TWData.objectForKey("profile_image_url_https") as NSString
                profileImageStringURL = profileImageStringURL.stringByReplacingOccurrencesOfString("_normal", withString: "")
                var url = NSURL(string: profileImageStringURL)
                var data = NSData(contentsOfURL: url!)
                self.imageViewPhoto.image = UIImage(data: data!)
                
                } })
                }) }
    } else {
    println("No access granted")
    }
    }) }


}

