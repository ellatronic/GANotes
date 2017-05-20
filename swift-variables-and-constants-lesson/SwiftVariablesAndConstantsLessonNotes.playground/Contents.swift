import Foundation
/*:
# SWIFT VARIABLES AND CONSTANTS

### Connection to Long-term Goal

This is the first lesson on the subject of code.

### LEARNING OBJECTIVES

* **Articulate** the difference between a constant and a variable
* **Declare** variables and constants
* **Identify** different types of Swift expressions
* **Create** expressions like multiplication and addition
* **Print** variables like Strings and Numbers
 
 ### So What Do you think a Variable is?
 
 ### WRITE-PAIR-SHARE
 
 * What kinds of things in life change often?
 * What kinds of things in life are constant?
 * How do you think this applies to programming?
 * Share and compare notes with a partner
 * Discuss with the class
 */

/*:
 ### ANATOMY
 
 * Show the anatomy of a variable declaration
 * Show the difference between a variable and constant
 * Naming convention in Swift - name variables, parameters, and associated types according to their roles
 * Case convention - lowerCaseCamel for all variables & constants
 
 [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/#naming)
 
 ```swift
 let maximumNumberOfLoginAttempts = 10
 var currentLoginAttempt = 0
 var x = 0.0, y = 0.0, z = 0.0
 let π = 3.14159
 let 你好 = "你好世界"
 let 📅 = "calendar”
 print(📅)
 let time = "9:27am"; print(time)
 ```
 */
//let hello = "HI"
///* A multiple line comment,
// used for explaining multiple things! */


/*:
 ## INDEPENDENT PRACTICE
 
 ### ACTIVITY
 
 Create a new Playgrounds in Xcode. Declare the following variables
 
 * Write a variable called age with the value 99
 * Write a constant called name with your name
 * Update the age variable’s value to be your age
 * Print your age
 * Create a variable with the current time and print it to the screen on the same line
 * Create a variable encoded with an emoji name
 */

/*:
## INTRODUCTION: SWIFT EXPRESSIONS

### DIAGNOSTIC

"Who remembers PEMDAS from middle school?"

Parenthesis, Exponents, Multiplication, Division, Addition, Subtraction

The same rule applies in programming.

```
let name = "Richard"
var age = 26
age = 2016 - 1989
let expression = 5 * 8 % 3 / (2 + 12) - 9
```

Different expression types:

* Assignment
* Arithmetic
* Remainder
* Compound Assignment
* Comparison
* Parenthesis
* Function Call
*/
let west = 2, ella = 100, tj = 50, joy = 239, parthiba = 9, vahibas = 28, kev = 42, dav = 21, scott = 4
let sum = west + ella + tj + joy + parthiba + vahibas + kev + dav + scott
print(sum)

let average = Double(sum) / 9.0
print(average)


/*:
 ## INDEPENDENT PRACTICE
 
 ### PRACTICE PROBLEMS
 
 "Do as many as you can."
 
 * Create constants for each one of your family members
 * Print their names
 * Find the current weather in SF, NYC, and London, and calculate their average.
 * Print it
 * Store the following in a variable: "Have you ever programmed before?"
 
 *Bonus*:
 * Come up with the most complicated expression you can think about & challenge your neighbor to solve it
 */

print("This is the average age of my class: \(average)")

let number = 456

print(number / 5)
print(number % 5)

print(number % 10)
print(number % 25)
print(number % 100)





