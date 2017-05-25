import UIKit
/*:
 
 # Swift Optionals
 =======================
 
 ## Connection to long term goal:
 
 Optionals are a fundamental type in Swift, a modern typing concept that enables many iOS features
 
 ## Learning Objectives
 
 + **Use** the `as` keyword to cast values from superclass to subclasses
 + **Identify** the difference between `!` and `?` in relation to Optionals
 + **Declare** variables and constants that contain Optional types
 + **Identify** the proper terminology when discussing Optional values (e.g. "Optional String")
 + **Write** a guard statement
 
 ## Opening: Why Optionals (5 mins)
 
 Why are optionals even needed? What happens if we have a piece of our code that is missing? Or one that might return at a later time?
 
 ## Introduction: Optionals (10 mins)
 
 Optionals are like a black box that can either have a value, or not have a value.
 
 **Syntax**:
 
 `var optionalName: Type? = ...`
 ```
 var optionalString: String?
 var optionalInt: Int?
 var optionalBool: Bool?
 ```
 */
/*:
 ```
 var optionalArray: [Int]?
 var arrayWithOptionalElements: [Int?] // compiler error!
 ```
 */

/*:
 ```
 var optionalDictionary: [String: Any]?
 var dictionaryWtihOptionalValues: [String: Any?] // compiler error!
 ```
*/

/*:
 > Note: Minimal values are **NOT** the same as not having a value.
 
 ```
 var optionalString: String?
 print(optionalString == "")  // prints false
 
 var optionalBool: Bool?
 print(optionalBool == false) // prints false
 
 var optionalInt: Int?
 print(optionalInt == 0) // prints false
 ```
 */

var optionalString: String?
print(optionalString == "")
print(optionalString == nil)
print(optionalString ?? "nothing is in optionalString") // Set a default value besides nil

var optionalBool: Bool?
print(optionalBool == false)

var optionalInt: Int?
print(optionalInt == 0)

var optionalArray: [Int]? // The array is the optional and could be nil or not
var optionalArrayTwo: [Int?] // Int elements could be nil or not
/*:
 ## Unwrapping Optionals
 
 ### if-let
 You can unwrap an optional using the `if-let` syntax.
 ```
 var username: String?
 if let presentUsername = username {
    print("Username exists and is \(presentUsername)")
 } else {
    print("No username exists")
 }
 ```
 
 ### Force unwrap
 
 If we are confident an optional value is present, we can force unwrap it with an `!`.
 
 ```
 var username: String?
 let presentUsername = username!
 ```
 
 **Beware**: Force unwrapping an optional that is `nil` will result in a run-time crash.
 
 ```
 var username: String? = nil
 print(username!)
 ```
 
 ### guard-let
 
 You can also unwrap an optional using the `guard-let` syntax. One nice thing about this syntax is that the value `selectedFavoritFlavor` falls through the guard statement.
 
 ```
 var favoriteFlavor: String?
 func announceFavoriteFlavor() {
    guard let selectedFavoriteFlavor = favoriteFlavor else {
        return
    }
    print(“\(selectedFavoriteFlavor) is my favorite!”)
 }
 ```
 
 > Note: You have to return from your function manually when you use a `guard` statement.
 
 */
<<<<<<< HEAD
// In a guard statement, you can use the initialized selectedFavoriteFlavor variable outside of the guard statement if it exists.
=======
var favoriteFlavor: String? = "vanilla"

func announceFavoriteFlavor() {
  guard let selectedFavoriteFlavor = favoriteFlavor else {
    print("No favorite flavor selected")
    return
  }
  print("\(selectedFavoriteFlavor) is my favorite!!")
}

announceFavoriteFlavor()
>>>>>>> 72f6a0ac3b1317c22b7b6dbd6c83479c34890d5d
/*:
 ### `as`
 
 You can cast values using the `as` keyword as well to unwrap optionals of a specific type.
 
 ```
 if let value = dictionary[key] as? String {
    print("The value for the key \(key) exists!"
 } else {
    print("This dictionary doesn't contain this key")
 }
 ```
 
 guard let number = value as? Int else {
    return
 }
 
 */
var dictionary: [String: Any] = ["tj": 0]
<<<<<<< HEAD
if let value = dictionary["tj"] as? Int {
    print(value)
=======
if let value = dictionary["tj"] as? String {
  print(value)
}

var stringNumber = "12?3"
if let integer = Int(stringNumber) {
  print("it is an integer! and the integer is: \(integer)")
>>>>>>> 72f6a0ac3b1317c22b7b6dbd6c83479c34890d5d
}

var stringNumber = "123"
if let integer = Int(stringNumber) {
    print("it is an intger")
}
 /*:
 
 ## Pair-Programming: Unwrapping Optionals
 
 + Create an optional string called liquidName and an optional double called boilingPoint.
 + Set the value of liquidName to “Mercury” and set the value of boilingPoint to 674.1
 + Unwrap liquidName to a constant called knownLiquidName. If it has a value, print it. Otherwise, print “No liquid.”
 + Force the unwrap of boilingPoint to a constant called knownBoilingPoint. Print it.
 
*/
var liquidName: String?
var boilingPoint: Double?

liquidName = "Mercury"
boilingPoint = 674.1

if let knownLiquidName = liquidName {
    print(knownLiquidName)
} else {
    print("No liquid")
}

let knownBoilingPoint = boilingPoint!
/*:
 ## Independent Practice
 + Write a function named stringToInteger that takes an optional string parameter and returns an optional integer. Use a guard statement to check the parameter, returning nil if the parameter has no value. After the guard, return an integer that was made from the string.
 + Write a function that safely pulls all the keys from the following dictionary:
 
 ```
 let dictionary: [String: Any] = ["name": "John", "age": 18, "location": "San Francisco", "isHealthy": true]
 ```
 */
<<<<<<< HEAD
func stringToInteger(string: String?) -> Int? {
    guard let knownString = string else {
        return nil
    }
    return Int(knownString)
}

let dictionary1: [String: Any] = ["name": "John", "age": 18, "location": "San Francisco", "isHealthy": true]

func parseDictionary(_ dictionary: [String: Any]) {
    guard let name = dictionary["name"] as? String else {
        return
    }
    guard let age = dictionary["age"] as? Int else {
        return
    }
    guard let isHealthy = dictionary["isHealthy"] as? Bool else {
        return
    }
    guard let location = dictionary["location"] as? String else {
        return
    }

    print("Hi, my name is \(name) and I am \(age) years old. I live in \(location) and am \(isHealthy).")
}

parseDictionary(dictionary1)

=======
let dictionaryTwo: [String: Any] = ["name": "John", "age": 18, "location": "San Francisco", "isHealthy": true]

func parseDictionary(_ dictionary: [String: Any]) {
  guard let name = dictionary["name"] as? String else {
    return
  }
  guard let age = dictionary["age"] as? Int else {
    return
  }
  guard let isHealthy = dictionary["isHealthy"] as? Bool else {
    return
  }
  guard let location = dictionary["location"] as? String else {
    return
  }
  
  print("Hi my name is \(name) and I am \(age) years old. I live in \(location) and am healthy? \(isHealthy)")
}
parseDictionary(dictionaryTwo)
>>>>>>> 72f6a0ac3b1317c22b7b6dbd6c83479c34890d5d
/*:
 ## Example
 
 ```
 let possibleNumber = "123"
 let convertedNumber = Int(possibleNumber)
 // convertedNumber is inferred to be of type "Int?", or "optional Int”
 
 var serverResponseCode: Int? = 404
 // serverResponseCode contains an actual Int value of 404
 serverResponseCode = nil
 // serverResponseCode now contains no value”
 
 var surveyAnswer: String?
 // surveyAnswer is automatically set to nil”
 
 if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
 }
 // Prints "convertedNumber contains some integer value.”
 
 if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
 }
 // Prints "convertedNumber has an integer value of 123.”
 
 
 if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
 } else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
 }
 // Prints ""123" has an integer value of 123”
 
 ```
 
 Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3.1 Edition).” iBooks. https://itun.es/us/k5SW7.l
 */


 /*:
 ## Conclusion
 
 ### Check-for-understanding
 
 *Summarize optionals with your group, and then we'll share as a class.*
 */

