/*:
 # ![GA icon](GAIcon.png) Collection Types - Arrays, Sets, & Dictionaries
 
 Week II DAY II 
 By: Eric Giannini
 
 ## The topics we will cover are:
 
 - collections
 - instance methods / properties
 - structure reference guides on each type
 - implementations
 
 ## By the end of this lesson, we should be able to (i.e., Learning Objectives):
 * discuss similarities / differences of collection types
 * differentiate the practical uses of these types based on data
 * uncover much needed methods or properties
 & implement these data structures to solve problems
 
 ## Connection to long term goal:
Collection Types are basic data structures that are fundamental to programming, creating iOS applications, or solving problems in algorithmic challenges
 
 ## Student prework before we open!
 * constants / variables
 * types
 * loops
 
 
 ## Introduction to Collection Types
 
 ![CollectionTypes](CollectionTypes.png)
 
 * Collection types are for storing collections of values
 * Collection Types conform to the Collection protocol (i.e., bottom-up but not top-down)
 * Collection protocol's requirements are `startIndex` and `endIndex` properties, subscripting, & 
 `index(after:)` methods
 * Arrays are ordered collections of values. 
 * Sets are unordered collections of unique values. 
 * Dictionaries are unordered collections of key-value associations.
 * Each of these sets are "bridged" to their respective immutable counterparts in Objective-C (i.e., Foundations `NSArray`, `NSSet`, `NSDictionary`)?
 * Objective-C collection types NSArray, NSDictionary, and NSSet, which previously only accepted elements of `AnyObject`, now can hold elements of `Any` type
 * Strongly enforced types so that arrays, sets, and dictionaries __dictate__ & __guarantee__ what type of value is stored.
 * elements in __mutable__ collections are subject to addition, removal, or change 
 * elements in __immutable___ collections are NOT.

 
 ## Arrays 
 
 * Arrays are ordered collections of values with repeatable values
 
 */
// Create an array holding the strings "Tom", "Dick", "Harry"
var nameArray = ["Tom", "Dick", "Harry"]

// Create an array variable that will hold doubles
var doubleArray = [Double]()

// Create an empty array
var emptyArray: [Any]


// Arrays : Declaration & Initialization
var array1: [String] // declare only
var array2 = [String]() // declare & initialize
var array3: Array<String> // declare only
var array4 = Array<String>() // declare & initialize

// empty initialization 

var basketOfFruit = [String]()
var groupOfNumbers = [Int]()

// empty array with empty array literal; empty array literals are permitted with known types
// without a known type the compiler reports an error such as "Empty collection literal requires an explicit type"

basketOfFruit = []
groupOfNumbers = []

basketOfFruit.isEmpty
groupOfNumbers.isEmpty

type(of:basketOfFruit)

// var beautyPageantContestants = []

var groupOfDoubles = Array(repeating: 0.0, count: 5)
print(groupOfDoubles)

// Arrays can be added together

var anotherGroupOfDoubles = Array(repeating: 5.5, count: 3)

var groupsOfDoubles = groupOfDoubles + anotherGroupOfDoubles

print(groupsOfDoubles)

for element in groupOfDoubles {
    anotherGroupOfDoubles.append(element)
}
print(anotherGroupOfDoubles)

var groupOfInts = Array(repeating: 1, count: 2)
var anotherGroupOfInts = Array(repeating: 2, count: 3)

for element in groupOfInts {
    anotherGroupOfInts.append(element)
}
print(anotherGroupOfInts)

// It is important to note that so far we have not used any type annotations but now we do. 

var bicycleParts: [String] = ["handle bars", "chain guard", "tire"]

// try & declare with different values both with or without the type annotation

// accessing an array 

print("Our shop has \(bicycleParts.count) in stock.")

// append method 

bicycleParts.append("spokes")

print("Our shop has \(bicycleParts.count) in stock.")

bicycleParts += ["chains"]

print("Our shop has \(bicycleParts.count) in stock.")

// subscripting syntax

var spokes = bicycleParts[3]
print(spokes)

var chains = bicycleParts[4]
print(chains)

// insert(_:at:) 

bicycleParts.insert("seats", at:5)
print(bicycleParts)

// remove(at:)

bicycleParts.remove(at: 5)
print(bicycleParts)

// removeLast()
bicycleParts.removeLast()
print(bicycleParts)

var mtRushmoreArray = ["Thomas Jefferson", "George Washington", "Abraham Lincoln", "Theodore Roosevelt"]
mtRushmoreArray.append("Kanye")
mtRushmoreArray.remove(at: 1)
mtRushmoreArray[1] = "Dolphin disguised as Virginian"
print(mtRushmoreArray)

for element in mtRushmoreArray {
    print(element)
}

var firstIntArray = [8, 13, 19, 7]
var secondIntArray = [2, 26]

for element in firstIntArray {
    secondIntArray.append(element)
    print(secondIntArray)
}
print(secondIntArray)
 /*:
 
 ## Think-Pair-Share (5 / 7 mins)
 ### Practice Problems
 
 * Create an explicitly-typed array.
 * Use subscripting to interact with an array.
 * Use a few array methods and properties to interact with an array.
 
 
![indexOfArray](indexOfArray.png)

 */

// Looping through an array 

for element in bicycleParts {
    print (element)
}

// Looping through an array with index

for (index, element) in bicycleParts.enumerated() {
    print("Item \(index): \(element)")
}
 /*:
 
![arrayslicestring](arrayslicestring.png)
 
![ShoppingListArray](ShoppingListArray.png)


 */
// write code here:

var colors = ["neutral", "White", "Black", "Orange", "Red", "Yellow"]

// loop through an array slice
for color in colors[1...5] {
    print(color)
}

var lapTimes = [42.6, 58.3, 33.7, 84.5]
let sortedTimes = lapTimes.sorted { (first, second) -> Bool in
    if first > second {
        return true
    }
    return false
}

/*: 
 
 ## Write - Pair - Share ( 5 / 7 mins)
 ### Practice Problems 
 
 Create an array 
 * through whose members you loop, printing on each iterations
 * through whose sliced range of members you loop with the printed results of an operation
 */


// 2 dimensional array of arrays of Ints
var arrOfTwoDimensions = [[Int]]()

// 2 dimensional array of arrays of Ints
var arrOfTwoDimensionsEmptyInitialized: [[Int]] = []

// 2 dimensional array of arrays of Ints

var arrOfTwoDimensionsInitializedWithRepeatingValue = Array(repeating: Array(repeating: 0, count: 2), count: 3)


// change the subarray at index 1
arrOfTwoDimensionsInitializedWithRepeatingValue[1] = [0, 1, 2]
print(arrOfTwoDimensionsInitializedWithRepeatingValue)

var superArray = [[Int]]()
superArray = [[1, 2, 3, 4], [100, 200, 300], [1000, 2000]]

superArray[0]
superArray[0][3]

var twoDimensionalArray = Array(repeating: Array(repeating: 1, count: 2), count: 2)
var anotherArray = [9, 9, 9]

twoDimensionalArray[0] = anotherArray
print(twoDimensionalArray)



var numberOfColumns: Int = 3
var numberOfRows: Int = 3

var array = Array(repeating: Array(repeating: Double(), count: numberOfRows), count:numberOfColumns)
array[0][0] = 1
array[1][0] = 2
array[2][0] = 3
array[0][1] = 4
array[1][1] = 5
array[2][1] = 6
array[0][2] = 7
array[1][2] = 8
array[2][2] = 9

for column in 0...2 {
    for row in 0...2 {
        print("column: \(column) row: \(row) value:\(array[column][row])")
        
    }
}

/*:
 
 ## Independent Practice ( 20 mins )
 ### Practice Problems 
 Create an array 
 
 * of one dimension with three elements 
 * of two dimensions with each dimesion a variant of the one dimensional array
 * of three dimensions with each dimesion a variant of the two dimensional array
 * print out specific elements of each of the multi dimensional arrays with subscripting
 * perform matrix multiplication (optional)
 
 
 ### Bonus Challenges for Arrays
 
 * Here is one way to swap out elements of an array first & last
*/

// swap function

func swapFirstAndLast(array: [String]) -> [String] {
    let firstElement = array.first // this returns an ELEMENT
    //   let firstElement_ = array[0] // same thing
    
    let lastElement = array.last // this returns an ELEMENT
    //   let lastElement_ = array[array.count - 1] // the same effect
    
    // array.count is the number is elements
    // array.count - 1 is the last INDEX on the array
    // array[count -1] is the last ELEMENT of the array
    let middlePart = array[1...(array.count - 2)] // all in the array exept first and last element
    
    
    // How do I append new elements to an Array?
    
    var newArray = [String]()
    
    newArray.append(lastElement!)
    newArray.append(contentsOf: middlePart) // this is the 'collecion version' of the previous funcion. Instead of appendingt one element to an array, it appends another array. (polymorphism = one function many forms )
    newArray.append(firstElement!)
    
    return newArray
}

let myArray = ["a", "b", "c", "d", "e"]

swapFirstAndLast(array: myArray)
swapFirstAndLast(array: ["a", "b", "c", "d", "e"])

/*:

 * How do you swap out elements firt with last, second with first, third with second, etc ...
 
 * [Left Rotation on an Array](https://www.hackerrank.com/challenges/ctci-array-left-rotation)
 
 * [Dynamic Array](https://www.hackerrank.com/challenges/dynamic-array)
 
 * [Sparse Arrays](https://www.hackerrank.com/challenges/sparse-arrays)
 
 * [2D Arrays](https://www.hackerrank.com/challenges/2d-array)
 
 * The `UITabBarController` class contains an instance variable conveniently named `viewControllers` which is an `Array` of `viewControllers` accessible through a property called `selectedIndex`. Create an application with a `UITabBarController` that takes advantage of `selectedIndex`.
 
 
 
 ## Sets
 
 * sets are unordered collections of unique values (i.e., non repeating)
 
 */

// empty initialization of `Set`
var groceryBag = Set<String>()

groceryBag.isEmpty

type(of:groceryBag)


// .insert method for adding new elements; try adding elements of a different type
groceryBag.insert("Apples")
groceryBag.insert("Oranges")
groceryBag.insert("Pineapple")


// loop through a set
for food in groceryBag {
    print(food)
}

// initialization of a `Set` with literals
var groceryBagSet = Set(["Apples", "Oranges", "Pineapple"])

for food in groceryBagSet {
    print(food)
    
}

var alphabetSet = Set(arrayLiteral: "a", "b", "c")
var letterSet = Set(["d", "e", "f"])
var anotherLetterSet = Set(["e", "g", "h"])

alphabetSet.union(letterSet)
letterSet.intersection(anotherLetterSet)
letterSet.symmetricDifference(anotherLetterSet)
letterSet.subtracting(anotherLetterSet)
/*:
 
 ## Write - Pair - Share (5 mins)
 ### Practice Problems
 * initialize an empty set set literal 
 * insert new elements into the set 
 * loop through the set
 
### `Set` operations

 * Use the `union(_:)` method to create a new set with the elements of a set and another set or sequence.
 * Use the `intersection(_:)` method to create a new set with only the elements common to a set and another set or sequence.
 * Use the `symmetricDifference(_:)` method to create a new set with the elements that are in either a set or another set or sequence, but not in both.
 * Use the `subtracting(_:)` method to create a new set with the elements of a set that are not also in another set or sequence.
 
 ![setVennDiagram_2x](setVennDiagram_2x.png)

 
 ## Independent Practice (10 mins)
 ### Practice Problems
 * create sets with values of the same type 
 * compare sets using `subtracting(_:)`, `symmetricDifference(_:)`, `intersection(_:)`, `union(_:)`
 *
 
 */


/*:
 
 
 ## dictionaries stores unordered keys of the same type to value of the same types (i.e., un ordered key value pairs); the key indentifies the value with a name.
 
 * create an empty dictionary
 * create a dictionary with a dictionary literal
 * access & modify a dictionary 
 * iterate over a dictionary
 
 */

// Dictionaries
var dictionary1: [String : Int] // What type of dictionary is this?
var dictionary2 = [String : Int]()

// adding key value pairs to a dictionary

var contacts = [String : String]()

contacts["Ismael"] = "000-000-000"
contacts["Hanan"] = "111-111-111"
contacts["Gracie"] = "222-222-222"
contacts["Othman"] = "333-333-333"

// looping through a dictionary

func printDictionary(_ dictionary: [String : String]) {
    for (name, phoneNumber) in dictionary {
        print("\(name)'s phone number is \(phoneNumber)")
    }
}
printDictionary(contacts)

/*:
 
 ## Write Pair Share 
 ### Practice Problems
    * create an empty dictionary
    * create a dictionary with a dictionary literal
    * access & modify a dictionary
    * iterate over a dictionary
 */

//Phone to its price
var phonePrices: [String : Double] = [
    "iPhone SE" : 99,
    "iPhone 6" : 199,
    "iPhone 6 Plus" : 299,
    "iPhone 7" : 349
]

//This way lets you create the dictionary without explicitly setting the types.
let aShorterWay = [
    "iPhone SE" : 99,
    "iPhone 6" : 199,
    "iPhone 6 Plus" : 299,
    "iPhone 7" : 349
]

//Value can be of any type
let placesVisited = [
    "New York" : true,
    "Boston" : false,
    "Paris" : false,
    "Rome" : true,
    "Milan" : true,
    "London" : false,
    "Los Angeles" : true
]

// accessing values
//This lets you get the information stored in the Dictionary
let iPhone6Price = phonePrices["iPhone 6"]
print(iPhone6Price as Any)

//If the key does not exist, you should see
let iPhone4Price = phonePrices["iPhone 4"]
print(iPhone4Price as Any)


//ADDING VALUES
//This lets you add information to the dictionary after it has been created
let nexus = "Nexus 6"
//The price won't exist
var nexusPrice = phonePrices[nexus]
print("Nexus price before adding: \(nexusPrice)")

phonePrices[nexus] = 349.99
//Now the price exists. When you ask it again, you should get back the value that was added.
nexusPrice = phonePrices[nexus]

print("Nexus price after adding: \(nexusPrice)")

//REMOVING VALUES
phonePrices.removeValue(forKey: nexus)
//Another way
phonePrices[nexus] = nil

print()
//Iteration
for (phone, price) in phonePrices {
    
    print("The price of the \(phone) is \(price)")
}

// Dictionaries
var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]

print("I have rated \(movieRatings.count) movies.")
let darkoRating = movieRatings["Donnie Darko"]
movieRatings["Dark City"] = 5
movieRatings
let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}
movieRatings["The cabinet of Dr. Caligari"] = 5
movieRatings.removeValue(forKey: "Dark City")
movieRatings["Dark City"] = nil
for (key, value) in movieRatings {
    print("The movie \(key) was rated \(value).")
}
for movie in movieRatings.keys {
    print("User has rated \(movie).")
}

//declare a unmutable dictionary
let cookies = ["Chocolate Chip":0.25,"Oatmeal":0.26,"Peanut Butter":0.02,"Sugar":0.03]

//declare a mutable dictionary
var mutableCookies = ["Macadamia Nut":0.06,"Coconut":0.20, "Macaron":0.55]

//A better way to format your
//code for dictionary entries
var gelato = [
    "Coconut":0.25,
    "Pistachio":0.26,
    "Stracciatella":0.02,
    "Chocolate":0.03,
    "Peanut Butter":0.01,
    "Bubble Gum":0.01
]

//Explicit defintion of the key and value
let piePrice:[String:Double] = [
    "Apple":3.99,
    "Raspberry":3.35
]

/* use the one above instead
 let piePrice:Dictionary<string,double> = [
 "Apple":3.99,"Raspberry":0.35
 ]
 */

//Two cases of empty dictionary declarations
var pieToppings = [String:Double]()

var pizzaSizes = Dictionary<Int, String>()

//return a value using a key
piePrice["Apple"]

//Return a value in an expression
//note the returned value is optional
//so we have to unwrap it
let slices = 2.0
let extPrice = piePrice["Apple"]! * slices
print("\(slices) slices of Apple Pie is \(extPrice)")

//What happens when a key does not exist?
//We get nil
piePrice["Coconut Cream"]

//Check for nil
if piePrice["Apple"] != nil {
    let extPrice = piePrice["Apple"]! * slices
    print("\(slices) slices of Apple Pie is \(extPrice)")
}

//Optional Chaining
if let price = piePrice["Apple"]{
    let extPrice = price * slices
    print("\(slices) slices of Apple Pie is \(extPrice)")
}

//the key as a constant
let gelatoType = "Pistachio"
if let price = gelato[gelatoType] {
    let extPrice = price * slices
    print("\(slices) scoops of " + gelatoType + " is \(extPrice)")
}
//Making a list of toppings, and then changing values
var toppings = ["Pepperoni":0.25,
                "Sausage":0.26,
                "Onions":0.02,
                "Green Peppers":0.03,
                "Cheese":0.01
]
//Change Sausage to 0.29
toppings["Sausage"] = 0.29
toppings["Sausage"]

//Change Cheese to 0.2
toppings.updateValue(0.2, forKey: "Cheese")
toppings["Cheese"]

//Warn an updated value does not exist
let oldTopping = toppings.updateValue(0.02,forKey: "Cheese")
if oldTopping == nil{
    print("Key not found")
}
//Actaully that adds a entry to the dictionary.
//you can add a entry with the updateValue method too
let anotherTopping = toppings.updateValue(0.15,forKey: "Gorgonzola")
toppings["BBQ Chicken"] = 0.24

//Deleting an entry in the dictionary
//set its value to nil
gelato["Bubble Gum"] = nil
gelato

//Delete a entry using a function
let deletedTopping = gelato.removeValue(forKey: "Peanut Butter")
deletedTopping //deleted entry
gelato //its gone now

//Loop through values and keys
for (myKey,myValue) in toppings {
    print("\(myKey) \t \(myValue)")
}

//Loop through values
for myValue  in toppings.values{
    print ("Value =  \(myValue)")
}

//make a 10% price increase
//with a loop of keys
for myKey  in toppings.keys{
    toppings[myKey] = toppings[myKey]! * 1.10
}

//getting an array of keys or values
var valuesArray = [Double](toppings.values)
let keyArray = [String](toppings.keys)


// passing dictionaries  through parameters
//very useful if you have to pass a lot of values of they same type as one parameter
func myFunction(dictionary:[String:Double],key:String)-> Double?{
    return dictionary[key]
}
myFunction(dictionary: gelato,key: "Coconut")

// individual practice problem solving 

/*: 
 
 ## Independent Practice
 
 */

// What type of collection is `something`
var something: (([Int], [Int]), ([String], [String], [String]))

something = (([1, 2, 3], [20, 30]), (["hello", "world"], ["farewell", "mylove"], ["goodbye", "cruel", "world"]))

type(of:something)


// a simple Ceasar cipher rotated one notch
var cipher = [
    "a" : "b",
    "b" : "c",
    "c" : "d",
    "d" : "e",
    "e" : "f",
    "f" : "g",
    "g" : "h",
    "h" : "i",
    "i" : "j",
    "j" : "k",
    "k" : "l",
    "l" : "m",
    "m" : "n",
    "n" : "o",
    "o" : "p",
    "p" : "q",
    "q" : "r",
    "r" : "s",
    "s" : "t",
    "t" : "u",
    "u" : "v",
    "v" : "w",
    "w" : "x",
    "x" : "y",
    "y" : "z",
    "z" : "a"
]

var message = "hello world"

// your encrypt our message here & print it

// Use a loop to reverse the order of the elements of this dictionary.


/*:
 
## Conclusion with Independent Practice (20 mins)
 * create a dictionary with grocery bags (i.e., arrays)
 * each grocery bag contains a specific type of groceries
 * these specific types of groceries are keys
 
## Closing
 Would you be able to differentiate a collection of data that:
 * is ordered with repeating values 
 * unordered with unique values 
 * associates a value with a key. 

 
 ### Class Discussion
 
 Earlier we said that by the end of this lesson, we should be able to:
 * collections
 * instance methods / properties
 * structure reference guides on each type
 * implementations
 
 
 ### Takeaways
 
 - Swift collection types are easily distinguishable for use cases
 
 ### Trick Questions /
 * How do you make / declare any of these to be _mutable_ / _immutable_ collections?
 * What is the best practice for making / declaring _mutable_ / _immutable_ collections? Why?
 * What is bridging? What framework do you need to bridge languages?
 * How do you make / declare array, set, or dictionary in Objective-C?
 * What are their Objective-C counterparts? How do they differ?
 
 
 For more information on
 
  - [Apple's API Reference on Collection Protocol](https://developer.apple.com/reference/swift/collection)
 
  - [Apple's API Reference on Array](https://developer.apple.com/reference/swift/array)
 
  - [Apple's API Reference on Sets](https://developer.apple.com/reference/swift/set)

  - [Apple's API Reference on Dictionary](https://developer.apple.com/reference/swift/dictionary)
 
  - [Bridging & Working with Cocoa's Frameworks](https://developer.apple.com/library/prerelease/content/documentation/Swift/Conceptual/BuildingCocoaApps/WorkingWithCocoaDataTypes.html#//apple_ref/doc/uid/TP40014216-CH6-ID61)
 
 - [Objective-C `id` as Swift `Any`](https://developer.apple.com/swift/blog/?id=39)

 - [UITabBarController](https://developer.apple.com/reference/uikit/uitabbarcontroller)
 
 - [ArraySlice & Array vs. NSArraySlice & NSArray](http://blog.stablekernel.com/swift-subarrays-array-and-arrayslice)
 */

/*: 
 
## Bonus : tuples, functions, & arrays 
 
*/

// how is an array of tuples initialized?
var arrayOfTuples = [(one: Int, two: String, three: Bool)]()

// there is an array of tuples with two tuples
arrayOfTuples = [(1, "one", true), (2, "two", false)]

//
func printTuple(_ tuple: (Int, String, Bool)) {
    print("the tuple is \(tuple.0), \(tuple.1), \(tuple.2)")
}

func printTupleX(tuple: (first: Int, second: String, third: Bool)) {
    print("the tuple is \(tuple.first), \(tuple.second), \(tuple.third)")
}
var myTuple = (6, "Hello", true)

printTuple(myTuple)

// Make multiple tuples, appending each tuple to an array of tuples

func makeTupleWithInts(_ first: Int, _ second: Int, _ third: Int) -> (Int, Int, Int) {
    return (first, second, third)
}
var tup = makeTupleWithInts(11, 22, 33)

// here are a couple of tuples; how are these different from arrays?

let coupleOfIntegers = (5, 5)

let coupleOfDifferentIntegers = (4, 7)

let stringAndInteger = ("5", 5)

let boolAndString = (true, "false")

let (bool, stringTuple) = (true, "false")

// let (bool : Bool, stringTuple : String) = (true, "false") Why can't I explicitly declare the type of a tuple with type annotation?

// Why can't I use tuples in NSArry?

/*
 
 NSArray *someArray = @[coupleOfIntegers, stringAndInteger, boolAndString];
 
 */

// Note that the following line of code does not compile :
//var arrayOfValueTypes = coupleOfIntegers + coupleOfDifferentIntegers

// But the following line of code does :

var arrayOfValueTypes = [coupleOfIntegers, coupleOfDifferentIntegers]

