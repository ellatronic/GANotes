/*:
 
 # Swift Structs & Classes
 =======================
 
 ## Learning Objectives
 
 * **Define** structs & classes
 
 * **Create** structs & classes
 
 * **Add** properties to classes and structs
 
 * **Instantiate** structs & classes
 
 * **Call** methods and properties in structs & classes
 
 ## Connection to long term goal:
 
 One way to think of creativity or an art of programming, so to speak, is to ask yourself: How will I model data in an iOS application? Fundamental to modeling data is architecture. Structs & Classes are one way to deal with architecture of data models in Swift.
 
 ## Opening (5 - 10 Mins)
 
 What is a Struct? What is a Class? Both of these
 
 ## Practice Problem
 
 Make a list of every single type learned thus far that whose underlying structure is either a `struct` or a `class`. What are the differences? What are the similarities?
 
 ## DEFINITION
 
Both of these programming concepts are ways of developing an architecture for data models. There are a few similarities & differences.
 
 Both can: 
 
- Define properties to store values
- Define methods to provide functionality
- Define subscripts to provide access to their values using subscript syntax
- Define initializers to set up their initial state
- Be extended to expand their functionality beyond a default implementation
- Conform to protocols to provide standard functionality of a certain kind
 
 Classes have but Structs do not: 
 
 - Inheritance, which is covered in the next lessons, enables one class to inherit the characteristics and behavior of another.
 - Type casting enables you to check and interpret the type of a class instance at runtime as is the case with `as`.
 - Deinitializers enable an instance of a class to free up any resources it has assigned.
 - Reference counting allows more than one reference to a class instance.
 
 ## Think - Pair - Share 
 
 Why are the types whose underlying architecture is a struct or class, modeled in that form? What about the functionality of that particular aspect of Swift or iOS makes it such that the best way to define it is in terms of a struct or class?
 
 ## Syntax 
 
 The way that either are declared is identical.
 
 **Struct**:
 
 `struct : SomeClass {
 } `
 
 **Class**:
 
 `class : SomeStruct {
 
  }`

 
 "Whenever you define a new class or structure, you effectively define a brand new Swift type." 'SomeClass' & 'SomeStruct' are types.
 
 ## Naming Conventions: 
 
 Give types `UpperCamelCase` names (such as `SomeClass` and `SomeStructure` here) to match the capitalization of standard Swift types (such as `String`, `Int`, and `Bool`). Conversely, always give properties and methods `lowerCamelCase` names (such as `frameRate` and `incrementCount`) to differentiate them from type names."
 
 ## Introduction: Structs (10 mins)
 
Do not be fooled by terminology. Objects are instances of a struct or class. Objects are work horses for us. A `UITableView` object is a work horse for us in that `UITableView` recycles cells for us. Can you think of anymore objects? 
 
 ## Initialization 
 
 Structs provide a memberwise initializer for free.
 
 */

// Create a

struct Televsion {
    var diagonal: Double // properties
    let make: String
    let model: String

    func shortDescription() -> String { // method
        return "\(make) \(model) : \(diagonal) inches"
    }
}

var myTelevision = Televsion(diagonal: 50, make: "Sony", model: "X850")
myTelevision.diagonal = 75

/*:
 
 # DEMO (15 mins)
 
 * Observe nested `Struct` in action from a `FriendlyChat` app in Swift. 
 * Note how properties are accessed through __dot syntax__.
 
 ---
 
 */




/*:
 
 # INDEPENDENT PRACTICE (10 mins)
 
 ## PRACTICE PROBLEMS
 
 * Define a struct called Dog, including properties for the dog's breed, weight and age. 
 
 * Add a method to your Dog struct called bark, that prints a barking sound. If the dog's weight is above a certain amount, the bark should be more of a groan.
 
 * Instantiate three Dog objects, each with different properties.

 */

// write code here...

struct Dog {
    let breed: String
    let weight: Int
    let age: Int

    func bark() {
        if weight > 100 {
            print("groan")
        } else {
            print("bark")
        }
    }
}

let pickle = Dog(breed: "pug", weight: 25, age: 7)
let teddy = Dog(breed: "golden retriever", weight: 101, age: 2)
let mochi = Dog(breed: "maltese", weight: 15, age: 5)

teddy.bark()
pickle.bark()

/*:
 
 ## Value Types vs. Reference types 
 
 `structs` are "pass by value" :  The computer reads the object’s value and copies it over to be the value for a new object.
 
 `classes` are "pass by references" : The computer points the new object at the old object. Any time the new object is referenced, it returns the current value of the old object.
 
 
 ## Kata & Dojo 
 
   1) Create a class called Dojo. This class should feature a variable for its address and a variable for its students. 
   2) Create a struct called Kata. This struct should feature a variable for a list of move names and a method that prints each move in order, following them with exclamation points. 
   3) Instantiate a Dojo object. Declare another Dojo and assign its value to the first Dojo. Change the second Dojo's address. Print the first Dojo's address. 
   4) Instantiate a Kata object. Declare another Kata and assign its value to the first Kata. Change the second Kata's moves. Print the first Kata's moves.

 ## Write - Pair - Share
 
 * Compare whether these instances are identical to each other `  ===  ` or equal to ` == ` each other. 
 
 - “Identical to” means that two constants or variables of class type **refer** to exactly the same class instance.
 
 - “Equal to” means that two instances are considered **“equal”** or **“equivalent”** in value, for some appropriate meaning of “equal”, as defined by the type’s designer.
 
 - Can you figure out the results for Kata & Dojo instances without `print(:)`?
 
 */

// Write code here.

/*: 
 
 ## instance methods 
 
 instance methods are functions declared in a class or a struct; copy & paste a globally declared function into a class & voila, there is the instance method!

 ```
 `class Counter {
 var count = 0
 func increment() {
 count += 1
 }
 func increment(by amount: Int) {
 count += amount
 }
 func reset() {
 count = 0
 }
 }`
 ```
 
*/

// write code here


/*:
 
 ## Properties
 
 Properties are variables or constancts declared in a class. While there are many different kinds of properties, we cover the following:
 
 * stored properties
 * compted properties (getter / setter)
 * property observers
 
 
 ### Stored Properties 
 
 ```
 class Dragon {
 var lengthOfWing: Int = 0
 var spanOfWings: Int = 0
 }
 ```
 */

// write code here Kalesi

/*:
 
 ### Computed Properties
 
 ```
 class Dragon {
 var lengthOfWing: Int
 var spanOfWings: Int {
 get {
 // This computed property is based on wingLength.
 return lengthOfWing * 2
 }
 set(setValue) {
 // Store the results of a computed property.
 lengthOfWing = setValue / 2
 }
 }
 init() {
 lengthOfWing = 0
 }
 }
 
 ```
 
 
 If a computed property’s setter does not provide a name for the new value, a default name of ``newValue`` is provided.
 
 
 ```
 class Dragon {
 var lengthOfWing: Int
 var spanOfWings: Int {
 get {
 // This computed property is based on wingLength.
 return lengthOfWing * 2
 }
 set {
 // Store the results of a computed property.
 lengthOfWing = newValue / 2
 }
 }
 init() {
 lengthOfWing = 0
 }
 }
 ```
 
 Think - Pair - Share 
 
 * create an instance of the dragon class
 * assign a value to that instance's `lengthOfWing`
 * print the value of `spanOfWings`
 
 * create a different instance of the dragon class
 * assign a value to that instance's `spanOfWings`
 * print the value of `lengthOfWing`
 
 * create an instance of a new class with two properties, one stored, another computed
 * assign a value to that instance's stored property
 * print the value of the computed property

 * create a new instance of that class with two properties, one stored, another computed
 * assign a value to that instance's computed property
 * print the value of the stored property
 
 ## Property Observers
 
``` 
 `class StepCounter {
 var totalSteps: Int = 0 {
 willSet(newTotalSteps) {
 print("About to set totalSteps to \(newTotalSteps)")
 }
 didSet {
 if totalSteps > oldValue  {
 print("Added \(totalSteps - oldValue) steps")
 }
 }
 }
 }
 let stepCounter = StepCounter()
 stepCounter.totalSteps = 200
 // About to set totalSteps to 200
 // Added 200 steps
 stepCounter.totalSteps = 360
 // About to set totalSteps to 360
 // Added 160 steps
 stepCounter.totalSteps = 896
 // About to set totalSteps to 896
 // Added 536 steps`
 
 ```
 
 
*/

// write code here.

/*:
 
 # PAIR-PROGRAMMING PRACTICE (15 mins)
 
 ## PRACTICE PROBLEMS
 
 * Create a shape class or struct
 
 * create properties or methods to compute properties.
 
 * Use __instances__ of these classes to solve simple geometric problems
 
 * Explain why or how one may way to use a struct over a class? How would a struct or class deal with a series, sequence, or related shapes like triangle, square, or other polygons?
 
* In the next lesson inheritance is __a__ solution to dealing with the problem of a series, sequence, or many different related data models.
 
 */

// write code here

/*:
 
 */


/*:
 # CONCLUSION (5 mins)
 
 ## CHECK-FOR-UNDERSTANDING: WRITE-SHARE
 
 * What is the purpose of the difference between `struct` & `class` in Swift? What do the differences or similarities help us accomplish in each?
 
 ## TAKEAWAYS
 
 * Creativity is the definitive touch of programming with `struct` or `class` types. What are best practices for using either?
 
 ## Further Reading
 [Structs & Classes](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html)

 
 */


