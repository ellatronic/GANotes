/*:
 # ![GA icon](GAIcon.png) Swift Conditionals
 
 Week I DAY V
 
 ## The topics we will cover are:
 
 - if / else
 - switch
 - nests
 
 ## By the end of this lesson, we should be able to (i.e., Learning Objectives):
 * Define what a Swift decision structure is & what its keywords (i.e., `if`, `else`, `switch`) & syntax are.
 * Identify which type of decision structure solves our problem, its relational, & logical operators (`&&`, `||`, `!`), paranthesis
 * Apply best practices & comment our decision structures
 * Perform basic logical operations
 
 ## Connection to long term goal:
 Deepen our understanding of Swift & its structures; alternate decision structures are key to programming & algorithms
 
 ## Student prework before we open!
 * variables / constants
 * types
 */

/*:
 
 ## decision structures 
 
 * any program is reducible to one or more of three structures: consequential, decision, repetition. 

 * a decision structure causes a program to perform actions only under certain conditions. It frequently utilizes Boolean expressions, relational operators, & logical operations (and, or, not)
 
* each of these structures is based on a conditional, which is a Boolean statement
 
 * decision structures are reducible to one or more of the three types: single alternate decision structure; dual alternate decision structure; multiple alternate decision structure 
 
 * any one of these structures may be combined into the other to create _nested_ decision structures
 
Can we imagine scenarios where a decision depends upon the outcome of a specific event? What is the structure of our scenario?
 
*/

// Write code here.


// Come up with your own decision structure 

var coldIsTrue = false
if coldIsTrue {
    print("Stay in bed and watch Saturday morning TV")
} else {
    print ("Git up and say hi Eric")
}

var rain = true
var lazy = false

if rain {
    print ("grab your raincoat or umbrella")
} else if lazy {
    
    print( "stay home")
    
} else {
    print ("go to school with regular")
}

var life = 50
if life < 20 {
    print ("Go get life points")
} else {
    print ("Save the world")
}

/*:
 
 # single alternate decision structure (a.k.a. `if`)
 
 * In the if statement, the statements within the body of the if statement will only be executed if the statements condition evaluates to true.
 
 ```
 
 if <condition> {
 // statements...
 }
 
 ```
 
 */

// Write code here 

let a = 7
let b = 6
if a >= b {
    print(a)
}

if a <= b {
    print(a)
    // What happens here?
}

if a != b {
    print(b)
}

if a > b && b < a {
    print(a)
}

if a > b || b < a {
    print(a)
}

/*: 
 
 # dual alternate decision structure (a.k.a. `if` / `else`)
 
 ```
 if <condition> {
 // Executed if the condition evaluates to true
 <oneOrMoreStatements>
 } else {
 // Executed otherwise
 <oneOrMoreStatements>
 }
```
*/

// write code here 


// write

if a >= b {
    print(a)
} else {}

if a <= b {
    print(a)
    // What happens here?
} else {}

if a != b {
    print(b)
} else {}

if a > b && b < a {
    print(a)
} else {}

if a > b || b < a {
    print(a)
} else {}

/*:
 
 ### multiple dual alternate decision structure (a.k.a. `if` / `else if` / `else`)
*/

// write code here 

/*: 

 ## multiple alternate decision structure (a.k.a. switch)
 
 ``` 
 switch(expression) {
    case constant-expression  :
        statement(s);
        break; /* optional */
    case constant-expression  :
    statement(s);
        break; /* optional */
        /* you can have any number of case statements */
        default : /* Optional */
    statement(s);
 }
 
 ```
 
 
*/

// write code here 

var index = 10

switch index {
case 100  :
    print( "Value of index is 100")
case 10,15  :
    print( "Value of index is either 10 or 15")
case 5  :
    print( "Value of index is 5")
default :
    print( "default case")
}

/*: 
 
 ## You know the others. What is nesting?
 
 */

// Write code here

/*:
 
 ## Closing
 
 We covered data Swift's conditionals & decision structure.
 
 ### Class Discussion
 
 Earlier we said that by the end of this lesson, we should be able to:
 * Define what a Swift decision structure is & what its keywords (i.e., `if`, `else`, `switch`) & syntax are.
 * Identify which type of decision structure solves our problem, its relational, & logical operators (`&&`, `||`, `!`), paranthesis
 * Apply best practices & comment our decision structures
 * Perform basic logical operations
 
 
 ### Takeaways
 
 - What is a decision structure? When do we use them?
 
 ### Afterthoughts
 - Is there a fourth decision structure?
 
 For more information on
 
 - [The Swift Programming Language](http://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/)
 
 */
