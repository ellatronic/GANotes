# Swift Optionals
=======================
---

Week 2 - Day 3

By: Richard Ash

---

## Connection to long term goal: 

Optionals are a fundamental type in Swift, a modern typing concept that enables many iOS features

## Learning Objectives

+ **Identify** the difference between `!` and `?` in relation to Optionals
+ **Identify** the proper terminology when discussing Optional values (e.g. "Optional String")
+ **Use** the `as` keyword to cast values from superclass to subclasses
+ **Declare** variables and constants that contain Optional types
+ **Write** a guard statement

## Opening: Why Optionals (5 mins)

Why are optionals even needed? What happens if we have a piece of our code that is missing? Or one that might return at a later time?

## Introduction: Optionals (10 mins)

Optionals are like a black box that can either have a value, or not have a value. 

**Syntax**:


`var optionalName: Type? = nil`

```
 var optionalString: String?
 var optionalInt: Int?
 var optionalBool: Bool?
```

```
var optionalArray: [Int]?
var arrayWithOptionalElements: [Int?] // compiler error!
```

```
var optionalDictionary: [String: Any]?
var dictionaryWtihOptionalValues: [String: Any?] // compiler error!
```

> Note: Minimal values are **NOT** the same as not having a value.

```
 var optionalString: String?
 print(optionalString == "")  // prints false
 
 var optionalBool: Bool?
 print(optionalBool == false) // prints false
 
 var optionalInt: Int?
 print(optionalInt == 0) // prints false
```
### Check for understanding (2 mins)
 
Write 3 different optionals on your desk. Use a different type for each optional.

## Unwrapping Optionals (15 mins)

### if-let
You can unwrap an optional using the `if-let` syntax.
```
var username: String?if let presentUsername = username {   print("Username exists and is \(presentUsername)")} else {   print("No username exists")}
```

### Force unwrap 

If we are confident an optional value is present, we can force unwrap it with an `!`.

```
var username: String?let presentUsername = username!
```

**Beware**: Force unwrapping an optional that is `nil` will result in a run-time crash.

```
var username: String? = nil
print(username!)
```

### guard-let

You can also unwrap an optional using the `guard-let` syntax. One nice thing about this syntax is that the value `selectedFavoritFlavor` falls through the guard statement.  

```
var favoriteFlavor: String?func announceFavoriteFlavor() {   	guard let selectedFavoriteFlavor = favoriteFlavor else {       return	}   	print(“\(selectedFavoriteFlavor) is my favorite!”)}
```

> Note: You have to return from your function manually when you use a `guard` statement.

### `as`

You can cast values using the `as` keyword as well to unwrap optionals of a specific type.

```
if let value = dictionary[key] as? String {
	print("The value for the key \(key) exists!"
} else {
	print("This dictionary doesn't contain this key")
}
```

## Pair-Programming: Unwrapping Optionals (10 mins)+ Create an optional string called liquidName and an optional double called boilingPoint.+ Set the value of liquidName to “Mercury” and set the value of boilingPoint to 674.1+ Unwrap liquidName to a constant called knownLiquidName. If it has a value, print it. Otherwise, print “No liquid.”+ Force the unwrap of boilingPoint to a constant called 
## Independent Practice (10 mins)+ Write a function named stringToInteger that takes an optional string parameter and returns an optional integer. Use a guard statement to check the parameter, returning nil if the parameter has no value. After the guard, return an integer that was made from the string.
+ Write a function that parses the following dictionary:

```
let dictionary: [String: Any] = ["name": "John", "age": 18, "location": "San Francisco", "isHealthy": true]
```
 
## Conclusion (5 mins)

### Check-for-understanding

*Summarize optionals with your group, and then we'll share as a class.*
    