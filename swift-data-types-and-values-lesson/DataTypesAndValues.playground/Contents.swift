/*:
 
 
 
 
 # ![GA icon](GAIcon.png) Data Types & Values
 
 Week I DAY V
 
 ## The topics we will cover are:
 
 - Strings
 - Bools
 - Integers
 - Float / Doubles
 
 If we have time, we will discuss "function types" and "tuples" whose behavior differs from named types;
 
 ## By the end of this lesson, we should be able to (i.e., Learning Objectives):
 * Define what a type is and highlight its uses
 * Identify different types of Swift expressions (i.e., `type(of:)`)
 * Declare new variables or constants for data types
 * Perform basic math operations
 * Print values for types
 
 ## Connection to long term goal:
 Deepen our understanding of Swift as a strongly typed language so that we can build a foundation for understanding and storing data in Swift
 
 ## Student prework before we open!
 * variables / constants
 * types
 
 
 */

// write code here:



/*:
 
 ## Opening
 
 What is a type? What are common types of values?
 
 ## Introduction
 
 ### Define what a type is
 
 * A data type, in programming, is a classification that specifies which kind of value a variable / constant may store and what type of mathematical, relational or logical operations can be applied to it without error.
 
 example with `var`
 
* callout(namedType of data):
 var namedType = "Hello, World!"
 
 example with `let`
 
* callout(anotherNamedType of data):
 let anotherNamedType = "Hello, World!"
 
What type of data is stored in these named types?
 
*/

// write code here:

var namedType = "Hello, World!"
let anotherNamedType = "Hello, World!"

type(of:namedType)
type(of:anotherNamedType)


/*:
 
 ### Anatomy : Type Annotation
 
 We already know what type annotation is. We just havne't used its exact name yet. Type annotation is a way of explicitly specifying the type of a variable, constant or expression. Type annotations begin with a colon (:) and end with a type, as the following examples show:
 
 * callout(named type with a type annotation):
 let yetAnotherNamedType: String = "Hello, World!"
 
 ### Question:
 
 What is the difference between the two examples `namedType` & ` anotherNamedType` & this example: `yetAnotherNamedType`? In other words, what is a named type without a type annotation? What is a named type with a type annotation?  Think of what is / is not stated!
 */
// write code here:



/*:
 
### Strings
 
 * a series of characters
 
*/

// write code here 

let seriesOfCharacters = "A series of characters"
for character in seriesOfCharacters.characters {
    print(character)
}


/*:
 
#### String Literals
 
 A string literal is a fixed sequence of textual characters surrounded by a pair of double quotes ("").
 
The examples from earlier are all String literals: `namedType`, `anotherNamedType`, `yetAnotherNamedType`.
 
 */
// write code here:

// insert a loop that loops through the 'series of characters' that will be discussed later in the week.

/*:
 
 A string literal may be mutated, if mutable, in the following way:
 
*/

// write code here
 var variableString = "Horse"
 variableString += " and carriage"

/*: 
 
 ### Unicode & Special Characters
 
 is an international standard for encoding, representing, and processing text in different writing systems. These can be represented by special characters.

 ![specialcharacters](SpecialCharacters.png)
 
 
 
*/
 


// write code here

var star: String = "☼"
print(star)

// Why are semicolons useful?

var 🐱 = 5; print(🐱); print(🐱); print(🐱); print(🐱);



/*: 
 
 ### String Interpolation
 
 How do we add strings together in a way different from above with mutable strings? 
 
 */

// write code here

print( "Here is \(star) passing through the sky")


/*:
 
 ### Bools
 
 * What is a Boolean? A Boolean is a logical value, since a Boolean can only ever be either true or false. 
 
 
 If we would like to turn a light switch or even a UISwitch, we reset the value of Bool accordingly.
 
 * callout(boolean):
 var lightSwitch : Bool = false;
 
 
 */

var lightSwitch: Bool

lightSwitch = true
lightSwitch = false

/*:
 
 
 
 ### Integers / UInt
 
 * How do we represent whole numbers? Integer & UInt is used for whole numbers. More specifically, you can use Int32, Int64 to define 32 or 64 bit signed integers, whereas UInt32 or UInt64 to define 32 or 64 bit unsigned integer variables. For example, 42 and -23. Basically the difference is 'between which range' would we like to represent the numbers? Let's try to figure out the ranges on these values.
 
 
 
 */
// Write Coding

let max = Int.max
print(max)

let min = Int.min
print(min)

let maxUnsignedInt8 = UInt8.max
print(maxUnsignedInt8)

let minUnsignedInt8 = UInt8.min
print(minUnsignedInt8)


/*:
 
 ### Float / Doubles
 
 * This is used to represent a 32-bit floating-point number and numbers with smaller decimal points. For example, 3.14159, 0.1, and -273.158.
 
 * This is used to represent a 64-bit floating-point number and used when floating-point values must be very large. For example, 3.14159, 0.1, and -273.158.
 
 
 * callout(Pie):
 let pi = 3.14159
 // pi is inferred to be of type Double
 
 
 */

var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333
longitude = -1234586.783333

/*: 
 
 ### Basic Mathematical Operators 
 
 While there are a few groups of different types (i.e., arithmetic operators, comparison operators, boolean operators, range operators, tenenary operators), we'll focus on a few simple arithmetic operators such as:
 
 - Addition (+)
 - Subtraction (-)
 - Multiplication (*)
 - Division (\)

 
 "Who remembers PEMDAS from middle school?"
 
 Parenthesis, Exponents, Multiplication, Division, Addition, Subtraction
 
 The same rule applies in programming.

 */

// write code here

var one: Int = 1
var two: Int = 2

print (one + two)

print(two - one)

print(two * one)

print(one / two) // What's happening here?

print(Float(one) / Float(two))

print(Double(one) / Double(two))

//print(Float(one) / Double(two)) // What's happening here?

//print(Double(one) / Float(two)) // What's happening here?

// What happens with these expressions?
// let first = 5 * 10 + 6
// let second = 10 + 5 * 6
// let areEqual = first == second
// let isCorrect = first == 56

// Which of these will compile?
//print(min + max)
//print(min + min)
//print(max + max)


/*:
 
 ### Tuples
 
 While there are a few groups of different types (i.e., arithmetic operators, comparison operators, boolean operators, range operators, tenenary operators), we'll focus on a few simple arithmetic operators such as:
 
 */


// tuples

let coupleOfIntegers = (5, 5)
let coupleOfDifferentIntegers = (4, 7)

let stringAndInteger = ("5", 5)

let boolAndString = (true, "false")

// ...

let (bool, stringTuple) = (true, "false")

// let (bool : Bool, stringTuple : String) = (true, "false") Why can't I explicitly declare the type of a tuple?

// Why can't I use tuples in NSArry?

/*
 
 NSArray *someArray = @[coupleOfIntegers, stringAndInteger, boolAndString];
 
 NSArray accepts not value types (i.e., enums, structs, tuples) but
 
 */

var arrayOfValueTypes : Array = [coupleOfIntegers, coupleOfDifferentIntegers]

/*
 
 An array of tuples does not accept tuples whose values are of a different type
 
 //var arrayOfTuples: Array =  [coupleOfIntegers, stringAndInteger, boolAndString];
 
 Is tuple a value or a collection of values?
 
 */

 /*:
 
 ## Closing
 
 We covered data types & values. How did we do? Can you tell me which types we covered?
 
 ### Class Discussion
 
 Earlier we said that by the end of this lesson, we should be able to:
 * Define what a type is and highlight its uses
 * Declare new variables or constants for data types
 * Perform basic math operations
 * Demonstrate the use how these types interact

 
 ### Takeaways
 
 - What is type? What are value types?
 
 ### Afterthoughts
 - What are a few other types not yet discussed like function, tuple, or UIColor, UIImageView? Could I, we, you explore these tonight or this weekend?
 
 For more information on
 
 - [The Swift Programming Language](http://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/)
 
 - [Types]( https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Types.html)
 
 - [Declarations](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Declarations.html)
 
 - [Functions](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html)
 
 - [Swift Master Documentation](https://github.com/apple/swift/tree/master/docs)

 - [String Manifesto](https://github.com/apple/swift/blob/master/docs/StringManifesto.md)
 
 - [String Design](https://github.com/apple/swift/blob/master/docs/StringDesign.rst)
 
 */
