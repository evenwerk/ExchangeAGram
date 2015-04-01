//
//  ProfileViewController.swift
//  ExchangeAGram
//
//  Created by Tim Even on 30-03-15.
//  Copyright (c) 2015 evenwerk. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fbLoginView: FBSDKLoginButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile"]
        self.fbLoginView.publishPermissions = ["publish_actions"]
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "fbProfileChanged:",
            name: FBSDKProfileDidChangeNotification,
            object: nil)
        FBSDKProfile.enableUpdatesOnAccessTokenChange(true)
        
        // If we have a current Facebook access token, force the profile change handler
        if ((FBSDKAccessToken.currentAccessToken()) != nil)
        {
            self.fbProfileChanged(self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if (error != nil) {
            println( "\(error.localizedDescription)" )
        }
        else if (result.isCancelled) {
            // Logged out?
            println( "Login Cancelled")
        }
        else {
            // Logged in?
            println( "Logged in")
        }
    }
    
    func fbProfileChanged(sender: AnyObject!) {
        
        let fbProfile = FBSDKProfile.currentProfile()
        if (fbProfile != nil)
        {
            // Fetch & format the profile picture
            let strProfilePicURL = fbProfile.imagePathForPictureMode(FBSDKProfilePictureMode.Square, size: self.profileImageView.frame.size)
            let url = NSURL(string: strProfilePicURL, relativeToURL: NSURL(string: "http://graph.facebook.com/"))
            let imageData = NSData(contentsOfURL: url!)
            let image = UIImage(data: imageData!)
            
            self.nameLabel.text = fbProfile.name
            self.profileImageView.image = image
            
            self.lblName.hidden = false
            self.imgVwProfile.hidden = false
        }
        else
        {
            self.nameLabel.text = ""
            self.profileImageView.image = UIImage(named: "")
            
            self.lblName.hidden = true
            self.imgVwProfile.hidden = true
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
