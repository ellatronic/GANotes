//
//  ViewController.swift
//  AuthenticationProject
//
//  Created by Eric Giannini on 3/28/17.
//  Copyright © 2017 Unicorn Mobile, LLC. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    private var _authHandle: FIRAuthStateDidChangeListenerHandle!
    
    var user: FIRUser?

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    func configureAuth() {
        _authHandle = FIRAuth.auth()?.addStateDidChangeListener({ (auth: FIRAuth, user: FIRUser?) in
            if user != nil {
                print(" CONFIGURATION : The user is being printed as: \(user?.email!)")
                print(" CONFIGURATION : The user is being printed as: \(user?.email!)")
                print(" CONFIGURATION : The user is being printed as: \(user?.email!)")
            }
        })
    }
    
    func deconfigureAuth() {
    
        FIRAuth.auth()?.removeStateDidChangeListener(_authHandle!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configureAuth()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        deconfigureAuth()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func login(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) {
        (user, error) in
        
            if user != nil && error == nil {
                
                print("LOGIN : The user is logged in now as \(user?.email!)")
                print("LOGIN : The user is logged in now as \(user?.email!)")
                print("LOGIN : The user is logged in now as \(user?.email!)")
            } else {
                print("Here is the error: \(error)")
                print("Here is the user: \(user)")
            }
        }
    }
    
    // signup triggers the `.createUser()` method on our 
    // single instance of FIRAuth (i.e., singleton)
    
    @IBAction func signup(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Signup", message: "Sign up", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            
            
            FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                
                FIRAuth.auth()!.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!)
            }
            
        }
        
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField { textEmail in
            textEmail.placeholder = "Enter your email"
        }
        
        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "Enter your password"
        }
        
       alert.addAction(saveAction)
       alert.addAction(cancelAction)
        
       present(alert, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            emailTextField.becomeFirstResponder()
        }
        if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
        }
        
        return true
    }
    
}

