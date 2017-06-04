import UIKit
/*:
 # Swift Functions - Part 1
 
 ## CONNECTION TO LONG-TERM OBJECTIVE
 
 Functions are a fundamental programming concept that allow for greater organization of thought and code.
 
 ## LEARNING OBJECTIVES
 
 + **Identify** the purpose of a function
 + **Identify** the different parts of a function
 + **Write** functions that accept parameters and return values
 + **Call** a function
 
 ## OPENING: WHY FUNCTIONS (10 mins)
 
 Duplicated code! Makes your life much easier if you need to do the same thing mutliple times.
 
 **Example: Find the Harmonic Series of two different numbers and multiply the results**
 
 ```
 let numOne = 56
 let harmonicOne = 0.0
 for i in 1...numOne {
  harmonicOne += 1.0 / Double(i)
 }
 
 let numTwo = 357
 let harmonicTwo = 0.0
 for i in 1...numTwo {
  harmonicTwo += 1.0 / Double(i)
 }
 
 print(harmonicOne * harmonicTwo)
 
 ```
 
 ### THINK-PAIR-SHARE
 
 *"What kind of problems do you foresee if we keep writing code this way?"*
 */
func calculateDistance(at speed: Int, for time: Int) {
  print( speed * time)
//  return distance
}


let speed = 60
let time = 2
let distance = calculateDistance(at: speed, for: time)

print(calculateDistance(at: speed, for: time))


 /*:
 ## INTRODUCTION: FUNCTIONS
 
 ### DEFINITION
 
 "Functions are self-contained *chunks *of code that perform a specific task."
 
 * Swift Reference
 
 ### STOP AND JOT
 
 Think of an analogy for a function.
 
 ### ANALOGIES
 
 * **Beer Brewing:** You put ingredients in, some process happens, and it results in beer. An important idea with functions is that *if you put in the same ingredients, you should get the same beer.*
 * **Making Coffee:** Insert coffee and hot water, something happens, you get coffee.
 
 ### DEMONSTRATE
 
 Write a function. Identify each component of the function definition:
 
 Show the class 3-4 examples of functions.
 
 Include different types of functions (no parameters, no return types, etc)
 
 Show students how they would call the function.
 
 */

/*:
 ## DEMO: WRITING FUNCTIONS
 
 Solve the opening problem and write a function for it.
 
 ### CHECK FOR UNDERSTANDING - PAIR-SHARE
 
 How is this better than what we had before?
 
 ## GUIDED PRACTICE: TELL ME WHAT TO DO
 
 Write a function that takes an Emoji and returns the word for that emoji.
 */
//😂👍😡🤔

func describe(emoji: String) -> String {
  switch emoji {
  case "😂":
    return "laughing-tears!"
  case "👍":
    return "thumbs-up!"
  case "😡":
    return "angry-face"
  case "🤔":
    return "thinking-face"
  default:
    return "can't find emoji! 😩😑\u{1F602}"
  }
}

print(describe(emoji: "\u{1F602}"))

/*:
 ### CHECK FOR UNDERSTANDING
 
 *Write a function that takes 3 integers and returns their average.*
 
 ## INDEPENDENT PRACTICE: WRITING FUNCTIONS
 
 ### PRACTICE PROBLEMS
 
 Write a function that
 
 * Prints "hello {name}"
 * Takes 4 numbers and returns their product
 * Takes an integer and determines whether it is a [perfect square](https://www.easycalculation.com/square-roots-perfect-numbers.html).
 * Takes an integer and determines if it is a [perfect number.](http://exercism.io/exercises/swift/perfect-numbers/readme)
 */

 /*:
 ## CONCLUSION
 
 ### CHECK-FOR-UNDERSTANDING: WRITE-SHARE
 
 *Write down what you think is the purpose of a function.*
 
 ### TAKEAWAYS
 
 * Functions help write cleaner and more organized code
 * Functions help reduce code duplication by allowing you to reuse functionality
 
 ### BEST PRACTICES
 
 * Write descriptive function names using verby words
 * Name your parameters well and clearly
 * Functions should conceptually do one thing
 * Keep it tight; functions should not be more than 100 lines long
 * Keep functions at their level

*/

func reverse(string: String) -> String {
  var characters = string.characters.map{ $0 }
  let stringLength = characters.count
  
  var tempString = ""
  for i in 1...characters.count {
    let reversedCharacter = characters[stringLength-i]
  
    tempString = tempString + String(reversedCharacter)
    
  }
  
  
  return tempString
  
}






