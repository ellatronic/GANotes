//
//  ViewController.swift
//  CloudyLove
//
//  Created by Theron Jones on 4/4/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var cloudyLoveLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!

    @IBAction func buyButtonPressed(_ sender: UIButton) {
        configureAuth { (authorized) in
            if authorized {
                self.performSegue(withIdentifier: "toHomeScreen", sender: nil)
            }
        }
    }

    // MARK: TJ - Properties 4/3/17

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

    // MARK: TJ - Life Cycle 4/3/17

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up UI
        // Buy button
        buyButton.layer.cornerRadius = 20
        buyButton.layer.borderWidth = 1
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        loginSession()
//        configureAuth { isSignedIn in
//            if isSignedIn {
//                self.performSegue(withIdentifier: "toHomeScreen", sender: nil)
//            }
//        }
    }


    // MARK: TJ - Configuration 4/3/17
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

    deinit {
        FirebaseManager.shared.ref.child("users").removeObserver(withHandle: _refHandle)
        // TODO: set up what needs to be deinitialized when view is no longer being used
        // MARK: STEP 9 - When the listeneer is no longer needed, we should remove it / unregister the listener so that app stops listening for authentication changes. We do it here, and this is the last step in setting up user(email)/password authentication
        FIRAuth.auth()?.removeStateDidChangeListener(_authHandle)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Sign In and Out
    func signedInStatus(isSignedIn: Bool) {
        // Whether or not to show certain UI elements
        buyButton.isHidden = isSignedIn
        //        sellButton.isHidden = isSignedIn

        if (isSignedIn) {
            // MARK: STEP 1 and 12 and 17 - Add the ability to change settings to Database, Storage, etc.
            // TODO: Set up app to send and receive messages when signed in
            configureDatabase()
            configureStorage()
            //            configureRemoteConfig()
            //            fetchConfig()
        }
    }

    func loginSession() {
        // This shows the login screen whenever called, and the call, loginSession(), shows the authViewController, which is setup below
        let authViewController = FUIAuth.defaultAuthUI()!.authViewController()
        FUIAuth.defaultAuthUI()?.delegate = self
        self.present(authViewController, animated: true, completion: nil)
    }
}

extension ViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        self.performSegue(withIdentifier: "toHomeScreen", sender: nil)
    }
}

