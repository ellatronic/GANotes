![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

AppDelegate 
===============
---

Week 7 - Day 2 

By: Eric Giannini 

---

# CONNECTION TO LONG-TERM OBJECTIVE

The AppDelegate is responsible for the root object of an app. 

# LEARNING OBJECTIVES

* **Discuss** `AppDelegate`.

* **Review** `AppDelegate` state transitions.

* **Cover** delegate methods for state transitions.


## STUDENT PRE-WORK

Students should know:

* Xcode
* Delegation
* Singleton
* Methods

# LESSON GUIDE

<table>
  <tr>
    <td>TIMING</td>
    <td>TYPE</td>
    <td>TOPIC</td>
  </tr>
  <tr>
    <td>5</td>
    <td>Opening</td>
    <td>What is the AppDelegate?</td>
  </tr>
  <tr>
    <td>15</td>
    <td>Introduction </td>
    <td>AppDelegate</td>
  </tr>
  <tr>
   	<td>2</td>
   	<td>Think - Pair - Share</td>
   	<td>Delegates</td>
  </tr>
  <tr>
    <td>10</td>
    <td>Independent Practice</td>
    <td>Simulation</td>
  </tr>
    <tr>
    <td>15</td>
    <td>Pair Programming</td>
    <td>Simulation</td>
  </tr>
  <tr>
    <td>5</td>
    <td>Conclusion</td>
    <td>Key takeaways</td>
  </tr>
</table>

# OPENING (5 mins)

What is the `AppDelegate`? What is an application delegate? 

## PRACTICE PROBLEM (2 Mins)

What are the transition states for an iOS application? What does the `Home` button do for an application? 

---

## Definition 

- The AppDelegate class creates a single instance (i.e., a singleton) of UIApplication, which is thereafter accessible as `shared` (i.e., the singleton app instance).

- The delegate handles the application's state transitions such as not running (termination), foreground, (i.e., inactive, active), background, suspension, & launch. 

- The app delegate works together with the app object to make sure the app intereacts properply with iOS & other iOS applications.

- Specifically, the app delegate's methods gives the app an opportunity to respond to important changes. 

- For example, the app delegate's methods faciliate the app object's response to state transitions, such as when the app moves from foreground to background execution, and to respond to incoming notifications. 


> Note: The app delegate creates a single instance of `UIApplication` through which state transitions are delegated. What is the iOS design pattern responsible for single instances of a class? 


## App Delegate

* The AppDelegate class creates a single instance (i.e., a singleton) of UIApplication, which is thereafter accessible as `shared` (i.e., the singleton app instance).

* The application object informs the delegate of significant runtime events that cover the lifetime of the application. These are called state transitions.

# State Transitions

* The delegate handles the application states: 
 -  **not running** (termination),
 -  **foreground** (i.e., inactive, active), 
 -  **background**, 
 -  **suspension**,  
 -  **launch**

# INDEPENDENT PRACTICE (10 mins)

* Select an app from the apps on the iOS simulator. 
* Run the app. 
* Press the ⌘ h to simulate the home button 
* Terminate an app by swipping upwards 
* Pass through the different apps, selecting particular apps. 
* Return to the previous app. 

## PRACTICE PROBLEMS

* What is the name of each of the methods in the `AppDelegate`? 
* What do each of these methods do? 

# State Transition Methods aka Delegate Methods: 

### Launch time:

This method is your app’s first chance to execute code at launch time. 

- `application:willFinishLaunchingWithOptions:`
- `application(_: will Finish Launching With Options: )` 

This method allows you to perform any final initialization before your app is displayed to the user.

- `application:didFinishLaunchingWithOptions:`
- `application(_: did Finish Launching With Options: )`


> Note : While the specific tasks you perform during a given state transition depend upon your app and its capabilities, SDKs such as Branch, SupersonicAds, or SDKs are initialized in the delegate willFinishLaunchingWithOptions. 


### Transitioning to foreground:
Lets your app know that it is about to become the foreground app. Use this method for any last minute preparation. 
 
- `applicationDidBecomeActive:`
- `application Did Become Active(_: )` 

### Transitioning to background
Lets you know that your app is now running in the background and may be suspended at any time.

- `applicationDidEnterBackground:`
- `application Did Enter Background(_: )`


### Transitioning to inactive state: 

Lets you know that your app is transitioning away from being the foreground app. Use this method to put your app into a quiescent state.

- `applicationWillResignActive:` 
- `application Will Resign Active(_: )`

Lets you know that your app is moving out of the background and back into the foreground, but that it is not yet active. 

- `applicationWillEnterForeground:`
- `application Will Enter Foreground(_: )` 

### Termination 

Lets you know that your app is being terminate; if suspended, it is not called.

`applicationWillTerminate:`


# PAIR-PROGRAMMING (15 mins)

* Program different `print(_:)` statements to run in each of the app delegate's methods. 
* Observe when each method is called. 
* Write down these observations. 
* Map out which functions correspond to which transition state. 

## PRACTICE PROBLEMS
* Select an app from the apps on the iOS simulator. 
* Run the app. 
* Press the ⌘ h to simulate the home button 
* Terminate an app by swipping upwards 
* Pass through the different apps, selecting particular apps. 
* Return to the previous app. 


---

# CONCLUSION (5 mins)

## CHECK-FOR-UNDERSTANDING

*Write down what you think is the purpose of a AppDelegate is.*

## TAKEAWAYS

* `AppDelegate`'s methods faciliate the app object's response to state transitions

* These state transitions are :
 -  **not running** (termination),
 -  **foreground** (i.e., inactive, active), 
 -  **background**, 
 -  **suspension**,  
 -  **launch**

## Further Reading 

- [The App Life Cycle](https://developer.apple.com/library/content/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/TheAppLifeCycle/TheAppLifeCycle.html)
- [UIApplicationDelegate](https://developer.apple.com/reference/uikit/uiapplicationdelegate)
- [Delegation](https://developer.apple.com/library/prerelease/content/documentation/General/Conceptual/DevPedia-CocoaCore/Delegation.html)
- [UIApplication](https://developer.apple.com/reference/uikit/uiapplication)
- [Strategies for handling state transitions](https://developer.apple.com/library/content/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/StrategiesforHandlingAppStateTransitions/StrategiesforHandlingAppStateTransitions.html)



