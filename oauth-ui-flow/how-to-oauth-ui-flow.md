# How To: OAuth UI Flow


+ Create New single view xcode project
+ Go to your project in the terminal
+ iOS SDK in Facebook Developer Documentation 
+ Create an App. 
+ Click getting started, 
+ Facebook login
+ iOS
+ Choose: select or create an app. You must always register your app with Facebook. 
+ Choose create a new app. 
+ Choose a name 
+ Then put in your contact email. 
+ Create an app ID. 
+ read their computo-graffiti and Prove you are not a machine. 
+ Go to the terminal, `cd` to the subdirectory where your project is located, & type pod init to create a pod init
+ Run `ls`
+wait
+Open - podfile
+type in your podfile: `pod 'FBSDKLoginKit'`
+ Type `pod install` back in your terminal
+ wait
+ close current xcode sessions, 
+ Next time you open your project, use xcworkspace
+ `ls` should show new files, only work with Podfile and xcworkspace. 
+ In terminal type `open FacebookLogin.xcworkspace`
+ You can add pods in your Podfile from Xcode now if you like. 
+ Put in your bundle Identifier. 
+ Go to your info.plist, open it as source code. 
+ Paste XML snippet from step 4.
+ then save it.  (command s?)

^^^^^^Steps not clear.
+ Before the end of the dictionary at the end of the plist paste something, not sure what, copy what is in step 4. Sub step 2.
+ Step 5. Copy and paste the code in the app delegate, then edit the code.  Rewrite for swift: import FBSDKCoreKit, delete the pasted import, for the didfinishlaunching withoptions function, drap??????Comment out all the objective c?
+ if Xcode throws an error for your import FB line, run the app and it will likely go away.  
+


> Note : `.xcworkspace` manages (i.e., combines) `.xcodeproj`s
>Note: run pod update frequently. 

[Developer Documentation](https://developers.facebook.com/docs/)

+ on the initial website: developers.facebook.com
+ scrolll down further and click iOS, 
+ Quick start guide
+ Choose your app, 
+ In your xcode proj, in your `didfinishlaunchingwithoptions` in your app delegate, type `FBSDKApllicationDelegate.sharedInstance().application(application, 
didFinishLaunchingWithOptions: launchOptions)`
+ Go to your viewController, type `import FBSDKLoginKit`
+ in your podfile, add pod ‘FacebookLogin’
+ `import FacebookLogin` in your View Controller. 
+ command-r
+ When you get a bug “with Facebook saying you blahblabla”
+ Go back to the objective c way …….really guys…
+ Change the import name FBSDKLoginKit instead of just the Facebook login. 

+ In AppDelegate, Make sure you have this...

```
func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
  let source = options[.sourceApplication] as! String
  let annotation = options[.annotation]
    
  return FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: source, annotation: annotation)
}
```

+ One person per personal device --> currentAccessToken
+ In ViewDidLoad - 
If let accessToken = FBSDKAccessToken.current() {
print(“I’m logged in”)
}
+ The accessToken persists the app. When you close and open, it will still be there. 
+ ask for permissions... still in viewDidLoad
	loginButton.readPermissions = [ “public_profile”, “email”, “user_friends” ]
+ This determines the permissions FB asks for.  These three above are the most common.  Not a good idea to ask for more than these.  Don’t be creepy. 
+ Can also create a custom button, do tests, etc. Can be a custom button. 

In FB for developers...

+ Can go into apps and view analytics... see active log in users, api stats, etc.


