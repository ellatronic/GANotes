# How To: Third Part Frameworks ✅😲😩

## Why Frameworks?

+ Modularity
+ Modularity
+ Modularity

## Dependency Management

+ Helps manage dependencies within third party frameworks
+ Easy updating

## Cocoapods

### Install [Cocoapods](https://cocoapods.org/)

+ Open Terminal
+ Go to your home directory (`cd`)
+ enter the command `sudo gem install cocoapods`
+ enter your password to complete the `sudo` code

### Update Cocoapods

+ Skip if you just installed Cocoapods for the first time. Otherwise,
+ Open Terminal
+ enter the command `sudo gem update cocoapods`
+ enter your password to complete the `sudo` code

## Find SDK

+ Search Google/GitHub for open source projects
+ Research the documentation for that project
	+ [MGSwipeTableCell](https://github.com/MortimerGoro/MGSwipeTableCell)
	+  [Alamofire](https://github.com/Alamofire/Alamofire)
	+  [Google Maps SDK](https://developers.google.com/maps/documentation/ios-sdk/)

## Pod Files

+ Open Terminal
+ Go to your project directory
+ Enter the command `pod init`

> This creates a new Podfile for your project.

+ Open the podfile with **Xcode**! Using TextEdit will give you errors
	+ `open -a Xcode Podfile`
+ In your app target add `pod 'podName', 'versionNumber'`

> Note: 
> The version number is *optional*. If you don't add a version number cocoapods will use the most recent version

### Example Podfie

Notice how I have to add the pods *separately* to both my app target **and** my test target. You have to add the pod to each target you want to use it in.

```
# Uncomment this line to define a global platform for your project
# platform :ios, '8.0'
# Uncomment this line if you're using Swift
use_frameworks!

target 'AcronymFinder' do

pod 'Alamofire', '2.0.2'
pod 'AFNetworking'
pod 'MBProgressHUD'

end

target 'AcronymFinderTests' do

pod 'AFNetworking'
pod 'MBProgressHUD'

end
```

### Download Pods

+ Open Terminal
+ Go to your project directory
+ Enter the command `pod install` to install new pods
+ Enter the command `pod update` to update pods

> To use you project you'll now need to open `MyPoject.xcworkspace` instead of `MyProject.xcodeproj`

### Use Frameworks

+ To use a framework add `import FrameworkName` to the top of the file in which you want to use that framework

## Carthage

Another way to download third party frameworks

+ Download [Homebrew](https://brew.sh/)
+ Open Terminal 
+ Go to your project directory
+ Use Homebrew to download [Carthage](https://github.com/Carthage/Carthage)
	+ `brew update`
	+ `brew install carthage`
+ Create a CartFile
	+ `touch Cartfile`
+ Open the Cartfile with Xcode
	+ `open -a Xcode Cartfile`
+ Add the third party frameworks you want to use!
	+ `github "Alamofire/Alamofire" == 2.0`
	+ `github "SwiftyJSON/SwiftyJSON" ~> 2.3.0`
+ Update your project
	+ `carthage update`  

> Note:
> 
> + **==** means use **that** version
> + **~>** means use a version that is compatible with **that** version
> + **>=** means use **that** version or higher
> + You can even use a specific commit if you want!

+ Link the frameworks to your project
	1. Open `Carthage/Build/iOS/`
	2. In Xcode go to `Target/General/Linked Frameworks and Libraries`
	3. Drag the frameworks from 1. into 2.

## Differences between Carthage and Cocoapods

+ Cocoapods
	+ Need an `.xcworkspace`
	+ Need a Podfile 
+ Carthage
	+ Integrates directly into your project
		+ No `.xcworkspace`  
	+ No centralized repo
	+ No magic

## Legal

**PAY ATTENTION TO LEGAL RAMIFICATIONS OF WHATEVER OPEN SOURCE SOFTWARE YOU USE**

## Resources

+ [Cocoapods](https://cocoapods.org/)
+ [Carthage](https://github.com/Carthage/Carthage)
+ [Homebrew](https://brew.sh/)