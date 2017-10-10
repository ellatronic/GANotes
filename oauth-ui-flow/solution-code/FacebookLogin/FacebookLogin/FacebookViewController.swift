//
//  ViewController.swift
//  FacebookLogin
//
//  Created by Richard Ash on 3/31/17.
//  Copyright © 2017 Richard. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let loginButton = FBSDKLoginButton()
    
    
    loginButton.readPermissions = ["public_profile", "email", "user_friends"]
  
    loginButton.center = view.center
    view.addSubview(loginButton)
    
    if let accessToken = FBSDKAccessToken.current() {
      print("I'm logged in! \(accessToken)")
    }
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

