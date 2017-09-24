//
//  ViewController.swift
//  OAuthLesson
//
//  Created by Ella on 3/28/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    private var _authHandle: FIRAuthStateDidChangeListenerHandle!
    var user: FIRUser?

    func configureAuth() {
        _authHandle = FIRAuth.auth()?.addStateDidChangeListener({ (auth: FIRAuth, user: FIRUser?) in
            if user != nil {
                print("The user is: \(String(describing: user?.email))")
            }
        })
    }

    func deconfigureAuth() {
        FIRAuth.auth()?.removeStateDidChangeListener(_authHandle)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }

        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if user != nil && error == nil {
                print("The user is logged in now as \(String(describing: user?.email))")
                print("The password is \(password)")
            } else {
                print("Error: \(String(describing: error))")
            }
        })
    }

    @IBAction func register(_ sender: UIButton) {
        // guard let email = emailTextField.text else { return }
        // guard let password = passwordTextField.text else { return }

        let alert = UIAlertController(title: "Sign Up", message: "Sign up for a new account", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action) in
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]

            FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                FIRAuth.auth()!.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: nil)
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alert.addTextField { (textEmail) in
            textEmail.placeholder = "Enter your email"
        }
        alert.addTextField { (textPassword) in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "Enter your password"
        }

        alert.addAction(saveAction)
        alert.addAction(cancelAction)

        present(alert, animated: true, completion: nil)

        //FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
            // ...
        //}
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
