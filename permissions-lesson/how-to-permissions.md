# How To: Permissions

+ Permissions allow us to access the user's sensitive data. (Location, Photos, Contacts, etc.)

## Photo Library 

+ Add the `Photos.framework` to your project
	+ Click on your project -> Target -> Linked Frameworks & Libraries -> plus button
	+ Search and then add the `Photos.framework`
+ Import the Photos framework into the file you want to use it
	+ `import Photos`
+ Add the key `Privacy - Photo Library Usage Description` to your `Info.plist`
+ Check permission using `PHPhotoLibrary.authorizationStatus()`
+ Request permission using `PHPhotoLibrary.requestAuthorization(handler: (PHAuthorizationStatus) -> Void)`

**Example:**

```
  func getPermissionForPhotoLibrary() {
    PHPhotoLibrary.requestAuthorization { (authorizationStatus) in
      switch authorizationStatus {
      case .authorized:
        print("authorized")
      case .denied:
        print("denied")
      case .notDetermined:
        print("not determined")
      case .restricted:
        print("resticted")
      }
    }  
  }
```  

## Location

+ Add the `CoreLocation.framework` to your project
	+ Project -> Target -> Linked Frameworks & Libraries -> Plus Button
	+ Search and Add CoreLocation
+  Import Core Location into the file you want to use the framework
	+ `import CoreLocation`
+ Add either of the following keys to your `Info.plist`. The one you choose should depend on how you want to use the user's location
	+ `Privacy - Location Always Usage Description`
	+ `Privacy - Location When In Use Usage Description`
+ Create a locationManager to manage getting the user's location
	+ `let locationManager = CLLocationManager()`

> **Note:** When a location manager is discarded because its scope ends, its permission requests are cut short. Therefore, locationManager should be a *property* of your View Controller (Or whatever class you're using location in!) 

+ Request permission using:
	+ `locationManager.requestAlwaysAuthorization()`
	+ `locationManager.requestWhenInUseAuthorization()` 

+ Receive the location by implementing the delegate `CLLocationManagerDelegate`

## Contacts

+ Add the `Contacts.framework` to your project 
+ Go to info.plist and add "Privacy - Contacts Usage Description"
+ Import Contacts into the ViewController
+ Create variable 
```swift
let contactManager = CNContactStore()  
```
+ Create `authorizeContactsPermission()`

```swift
func authorizeContactsPermission() {
        
        contactManager.requestAccess(for: .contacts) { (bool, error) in
            guard error == nil else {return}
            if bool {
                print("contacts authorized")
            }
            else {
                print(" contacts denied")
            }
        }
    }
```
+ In viewDidLoad, call authorizeContactsPermission()

## Calendars

+ add `EventKit.framework`
+ add `Privacy - Calendars Usage Description` to Info.plist.
+ Import the calendar framework into the file you want to use it `import EventKit`
+ Create a variable to manage getting access to the user calendar `let eventStore = EKEventStore()`
+ In viewWillAppear, we check calendar authorization status by calling the function. `checkCalendarAuthorizationStatus()`
+ Next step is to write the function.

~~~swift
func checkCalendarAuthorizationStatus() {
	let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
	
	switch status {
	case .notDetermined:
	  requestAccessToCalendar()
	case .authorized:
		loadCalendars()
	case .restricted, .denied:
		needPermissionView.fadeIn()
	}
}
~~~

+ Make another function to request access to calendar.

~~~swift

func requestAccessToCalendar() {
	eventStore.requestAccess(to: EKEntityType.event, completion: { (accessGranted: Bool, error: Error?) in
	if accessGranted == true {
	   DispatchQueue.main.async(execute: { 
	   self.loadCalendars()
	   })
	   
	   } else {
	   DispatchQueue.main.async(execute: {
	    self.needPermissionView.fadeIn()
	    })
	 
		}
	})

	}
}
~~~
+ Function for load calendars

~~~swift

func loadCalendars() { 
	self.calendars = eventStore.calendars(for: EKEntityType.event) 
}

~~~

## Reminders

+ Add the `EventKit.framework` to your project
+ Click on your project -> Target -> Linked Frameworks & Libraries -> plus button
+ Search and then add the `EventKit.framework`
+ Import the EventKit framework into the file you want to use it
+ `import EventKit`
+ Add the key `Privacy - Reminders Usage Description` to your `Info.plist`
+ create function to be called and switch through all possible cases`

**Example:**

```swift
    func setReminderAuthorizationStatus() {
        EKEventStore().requestAccess(to: EKEntityType.reminder) { (Authorized, error) in
            if Authorized {
                print("authorized")
            } else {
                print("denied")
            }
        }
    }
```  
