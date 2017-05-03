//
//  SellButtonViewController.swift
//  CloudyLove
//
//  Created by Ella on 4/12/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI

class SellButtonViewController: UIViewController {
    @IBOutlet weak var sellCloudyLabelButton: UILabel!
    @IBOutlet weak var sellButton: UIButton!

    @IBAction func sellButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toVendorHomeScreen", sender: self)
    }
    
    // MARK: Properties
    var ref: FIRDatabaseReference!
    var storageRef: FIRStorageReference!
    var remoteConfig: FIRRemoteConfig!
    let imageCache = NSCache<NSString, UIImage>()
    var keyboardOnScreen = false
    var placeholderImage = UIImage(named: "ic_account_circle")
    fileprivate var _refHandle: FIRDatabaseHandle!
    fileprivate var _authHandle: FIRAuthStateDidChangeListenerHandle!
    var user: FIRUser?
    var displayName = "Anonymous"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Sell button
        sellButton.layer.cornerRadius = 20
        sellButton.layer.borderWidth = 1
        
        signedInStatus(isSignedIn: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureAuth()
    }
    
    func configureAuth(completion: ((Bool) -> Void)? = nil) {
        
        // TODO: configure firebase authentication
        
        // MARK: STEP 11 -
        let provider: [FUIAuthProvider] = [FUIGoogleAuth()]
        FUIAuth.defaultAuthUI()?.providers = provider
        
        // MARK: STEP 8 - Creating the email/password authentication. Remember _authHandle is an instance of FIRAuthStateDidChangeListenerHandle. The code to create the listener looks like this:
        
        // listen for changes in the authorization state
        _authHandle = FIRAuth.auth()?.addStateDidChangeListener { (auth: FIRAuth, user: FIRUser?) in
            
            // check if there is a current user
            if let activeUser = user {
                // check if the current app user is the current FIRUser
                if self.user != activeUser {
                    self.user = activeUser
                    self.signedInStatus(isSignedIn: true)
                    let name = user!.email!.components(separatedBy: "@")[0]
                    self.displayName = name
                }
                completion?(true)
            } else {
                // user must \sign in
                self.signedInStatus(isSignedIn: false)
                self.loginSession()
                completion?(false)
            }
        }
    }
    
    func loginSession() {
        // This shows the login screen whenever called, and the call, loginSession(), shows the authViewController, which is setup below
        let authViewController = FUIAuth.defaultAuthUI()!.authViewController()
        FUIAuth.defaultAuthUI()?.delegate = self as? FUIAuthDelegate
        self.present(authViewController, animated: true, completion: nil)
        
    }
    
    func configureDatabase() {
        // TODO: configure database to sync messages
        // MARK: STEP 3  - Configuring the Database in the App... Connecting a.) the app to Firebase, and b.) configure the actual connection to the Database is what we are going to do...Remember, at this point we can assume that the user is signed in and the "configureDatabase" function has been called. The only thing left to do is to connect the app to the database. To do this, we will define a reference to the database that looks like the following. THis series of calls gives us a reference to the root of our Firebase Database. We have now officially established a connection to the database
        FirebaseManager.shared.ref = FIRDatabase.database().reference()
    }
    
    func configureStorage() {
        // TODO: configure storage using your firebase storage
        // MARK: STEP 13 - This is where we add the refernce to the storage. Google.service.plist file contains all info for this file to determine location of photo
        FirebaseManager.shared.storageRef = FIRStorage.storage().reference()
    }
    
    // MARK: Sign In and Out
    
    func signedInStatus(isSignedIn: Bool) {
        // Whether or not to show certain UI elements        
        if (isSignedIn) {
            
            // MARK: STEP 1 and 12 and 17 - Add the ability to change settings to Database, Storage, etc.
            // TODO: Set up app to send and receive messages when signed in
            configureDatabase()
            configureStorage()
        }
    }
}
