![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

OAuth 📱
===============
---

Week 7 - Day 2 

By: Eric Giannini 

---


# CONNECTION TO LONG-TERM OBJECTIVE

OAuth 2.0 is standard authorization framework that enables  a third-party application to obtain limited access to an HTTP / HTTPS service. 

# LEARNING OBJECTIVES

* **Discuss** `OAuth`

* **Explore** Firebase 

* **Implement** `OAuth`in Firebase

## STUDENT PRE-WORK

Students should know:

* Cocoapods
* Xcode
* Swift  

# LESSON GUIDE

<table>
  <tr>
    <td>TIMING</td>
    <td>TYPE</td>
    <td>TOPIC</td>
  </tr>
  <tr>
    <td>10</td>
    <td>Opening</td>
    <td>What is OAuth</td>
  </tr>
  <tr>
    <td>15</td>
    <td>Introduction </td>
    <td>Write Pair Share </td>
  </tr>
  <tr>
   	<td>15</td>
   	<td>Introduction Firebase</td>
   	<td>OAuth</td>
  </tr>
  <tr>
    <td>10</td>
    <td>Independent Practice</td>
    <td>Firebase OAuth</td>
  </tr>
    <tr>
    <td>15</td>
    <td>Pair Programming</td>
    <td>Google Signin</td>
  </tr>
  <tr>
    <td>5</td>
    <td>Conclusion</td>
    <td>Key takeaways</td>
  </tr>
</table>


# OPENING (10 mins)
What is `OAuth`? What is the problem? Users don’t want to give up their Facebook passwords with good reason but authentication is required in order to access their data (i.e., name or profile picture).


## PRACTICE PROBLEM

Please find an app that uses OAuth 2.0 & a personal use case. 

---

## Definition 

- OAuth, which is pronounced "oh-auth," stands for Open Authorization. 
- OAuth is a standard for authentication based on tokens. 
- token-based authentication allows an end user's account information to be used by third-party services, such as Google, Facebook, etc., without exposing the end user's password
- OAuth 1.0 
- OAuth 2.0 differs from 1.0 in that it provides specific authorization work flows for web applications, desktop applications, mobile phones, and living room devices. 

## Authentication

These three steps cover authentication with OAuth 2.0.

- the first step : API key 
- the second step : pass the API key to the API server
- the third step : receive the access token 

An example is Instagram. You register your app at the API server; the API server hands you a key. You send the key in a POST request to the API server. The API server receives the POST request's API key; the API server returns an access token with which to access its data like the latest posts. 


# Write Pair Share - (2 mins)

Engage in a mock OAuth 2.0 authentication session. 
 

# INTRODUCTION: Firebase 

Firebase does the heavy lifting for us. 

## OAuth

1. Install the Firebase SDK
2. Open the Firebase console. 
3. Add a new app in the console. 
4. Create a single view Xcode project. 
5. In the Xcode project's directory run `pod init`.
6. Run `nano Podfile`. 
7. Under the target for the name of the Xcode project's target add: `pod 'Firebase/Auth'`.
8. Run `pod install`
5. Open the `.xcworkspace` file. 
6. In the `AppDelegate` write `import Firebase` to add the library to the `AppDelegate`. 
7. In the method `application:didFinishLaunchingWithOptions:` add `FIRApp.configure()`, which sets up Firebase's initial configuration for the iOS app. 
8. In the custom sublcass of `UIViewController` called `ViewController` let's create a property in the following way: `private var _authHandle: FIRAuthStateDidChangeListenerHandle!`. The handler will serve as a reference for the state changes that authentication trigger. 
9. If there is no `viewWillAppear`, simply start typing
 `viewWillAppear` to add the listener:  
 
 ``` 
 _authHandle = FIRAuth.auth()?.addStateDidChangeListener({ (auth: FIRAuth, user: FIRUser?) in
            if user != nil {
                print(" CONFIGURATION : The user is being printed as: \(user?.email!)")
                print(" CONFIGURATION : The user is being printed as: \(user?.email!)")
                print(" CONFIGURATION : The user is being printed as: \(user?.email!)")
            }
        })
```
10. Detach the handler in `viewWillDisappear` with `FIRAuth.auth()?.removeStateDidChangeListener(handle!)`.

10. Configure the UI in `Main.storyboard` such that two instances `UILabel` as `emailLoginTextField` & `passwordLoginTextField` & two instances of `UIButton` as an action called `didTapCreateLogin` & `didTapEmailLogin`
11. Configure `didTapCreateLogin` with the following code: 

``` 
@IBAction func didTapCreateLogin(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: emailLoginTextField.text!, password: passwordLoginTextField.text!) {
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
    
```
12.
 Configure `didTapEmailLogin` with the following code: 

```
@IBAction func signup(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Signup", message: "Sign up", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            
            
            FIRAuth.auth()?.createUser(withEmail: emailLoginTextField.text!, password: passwordLoginTextField.text!) { (user, error) in
                
                FIRAuth.auth()!.signIn(withEmail: self.eemailLoginTextField.text!, password: self.passwordLoginTextField.text!)
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

```

13. In an `extension` beyond the scope of the custom subclass of `UIViewController` called `ViewController` add the following code: 

```
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailLoginTextField {
            emailLoginTextField.becomeFirstResponder()
        }
        if textField == passwordLoginTextField {
            passwordLoginTextField.resignFirstResponder()
        }
        
        return true
    }
    
}

```

14.
Go to the Firebase console. Add an app. Use the Xcode project's bundle identifer. Download the `GoogleService-Info.plist` & add it to the Xcode project.

15.
<b>Run the project!</b>


16.
Print out the user's name. 

# INDEPENDENT PRACTICE (10 mins)

Implement OAuth 2.0 in an application with Firebase. 

## PRACTICE PROBLEMS

* Read through the [documentation](https://firebase.google.com/docs/auth/ios/start)

* Create a new single view application.

* Print out the name of the current user after authentication.

* Compare your app with Firebase's own sample code.



# PAIR-PROGRAMMING PRACTICE (15 mins)

Implement OAuth 2.0 Using Google Sign-In on iOS with Firebase.

## PRACTICE PROBLEMS

* Read through the [documentation](https://firebase.google.com/docs/auth/ios/google-signin)

* Create a new single view application.

* Print out the name of the current user after authentication.

* Compare your app with Firebase's own sample code.

---

# CONCLUSION (5 mins)

## CHECK-FOR-UNDERSTANDING: WRITE-SHARE

*Write down what you think is the purpose of a OAuth 2.0 is.*

## TAKEAWAYS

* OAuth 2.0 is standard authorization framework that enables  a third-party application to obtain limited access to an HTTP / HTTPS service. 

* Integrating with a third party SDK often solves the problem of OAuth. 

## Further Reading 

- [The OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749)

- [OAuth Bible](http://oauthbible.com)


