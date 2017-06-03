import UIKit
/*:
 # SWIFT FUNCTIONS 2
 
 ## CONNECTION TO LONG-TERM OBJECTIVE
 
 This completes the understanding of Swift function semantics.
 
 ## LEARNING OBJECTIVES
 
 * Recursion: **Write** functions that call themselves
 * Functions are first-class values: **Write** and **call** functions that both accept and return other functions as values
 * **Write** functions closures that capture values from the surrounding scope
 * **Understand** the function signature
 
 ## STUDENT PRE-WORK
 
 Students should be able to:
 
 * Functions Part 1
 * Declare and use variables
 
 ## OPENING: ADVANCED FUCTIONS
 
 Talk to students about why advanced functions are needed. For example
 
 + How do apps communicate asyncronously?
 + Recursion helps speed up certain algorithms
 
 For example, write some code to download images.
 
 ### THINK-PAIR-SHARE
 
 *"What kind of problems do you foresee if we keep writing code this way?"*
 
 ## Introduction: Closures
 
 "Closures are self-contained blocks of functionality that can be passed around and used in your code.”
 
 Excerpt From: Apple Inc. [“The Swift Programming Language (Swift 3.1 Edition).”](https://itun.es/us/k5SW7.l)
 
 ### Why?
 
 One of the three main ways to send data around in your app.
 
 Functions **ARE** a speciallized case of closures!
 
 **Three forms:**
 
 + Global functions
	+ Doesn't capture values
 + Nested functions
	+ Can capture values
 + Unnamed closures
	+ Can capture values
 
 ### Demo
 
 ```
 “func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
 print("Result: \(mathFunction(a, b))")
 }
 printMathResult(addTwoInts, 3, 5)”
 
 ```
 */
let addTwoInts: (Int, Int) -> Int = { (a, b) -> Int in
  return a + b
}

let addTwoIntsTwo = { (a: Int, b: Int) -> Int in
  return a + b
}

let multiplyTwoInts = { (a: Int, b: Int) -> Int in
  return a * b
}

func subtractTwoInts(a: Int, b: Int) -> Int {
  return a - b
}


let time = 5

func printMathResult(_ mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
  print("Result: \(mathFunction(a, b))")
  
  print(time)
}

printMathResult(addTwoInts, a: 7, b: 8)
printMathResult(multiplyTwoInts, a: 7, b: 8)
printMathResult(subtractTwoInts, a: 7, b: 8)
var closure: () -> Void = {
  print("5")
}



closure()
closure()
closure()
 /*:
 ## Pair practice: (7 mins)
 
 + Declare a closure variable that takes an Int and returns a String.
 + Define a closure constant that takes a string and prints it with an exclamation point on the end.
 */
let myButton = UIButton()
myButton.backgroundColor = .green

UIView.animate(withDuration: 0.3) {
  myButton.backgroundColor = .red
}

UIView.animate(withDuration: 0.3, animations: {
  myButton.backgroundColor = .blue
})
 /*:
 ### Trailing Closures
 
 This is the type of syntax you'll see most often. It's used with completion handlers and is one of the three main ways you pass data around within your app.
 
 ```
 func getDataFromServer(request: URLRequest, completion: (Data) -> Void) {
	URLSessions.shared.dataTaskWithRequest(request) { data, response, error in
    if let data = data {
        completion(data)
    }
  }
 }
 ```
 **No Trailing Closure:**
 
 ```
 let result = getDataFromServer(request: request, completion: { data in
	let people = People(data: data)
	tableView.reloadData()
 })
 ```
 **Trailing Closure:**
 
 ```
 let result = getDataFromServer(request: request) { data in
	let people = People(data: data)
	tableView.reloadData()
 }
 ```
 
 ## Independent Practice: Writing Closures (20 mins)
 
 ### PRACTICE PROBLEMS
 
 Write a closure that
 
 + Write a function that takes a closure as a parameter. The closure parameter should have no parameters or return type. The function should run the closure once, then print “Done!”
 + Write a function that takes a string and a closure as parameters. The closure parameter should take a string and return a string. The function should run the closure, passing it its own string parameter with an exclamation point added.
 */

 /*:
 ## Introduction: Recursion (15 minutes)
 ### Why Recursion?
 
 Makes functions easier to implement & understand. Also helps make your code less buggy.
 
 ### Pair Programming: Factorial Function (10 minutes)
 
 Have students try to implement a factorial function. Review:
 
 `factorial(n) = n * (n-1) * (n-2) * (n-3) * ... * 1`
 
 **No Recursion:**
 
 ```
 func factorial(_ number: Int) -> Int {
	var count = number
	var result = 1
	
	while count > 0 {
      result *= count
      count -= 1
	}
	
	return result
 }
 
 ```
 **Recurcsion:**
 
 ```
 func factorial(_ number: Int) -> Int {
	if number == 0 { 
      return 1
  }
	return number * factorial(number-1)
 }
 ```
 */


/*:
 ## Practice: Recursion (10 mins)
 
 Write out the functionality of the following functions
 
 ```
 func functionOne(x: Int, y: Int) -> Int {
	if x == 0 {
      return y
	} else {
      return functionOne(x: x-y, y: y+x)
	}
 }
 ```
 
 ```
 func functionTwo(a: Int, b: Int) -> Int {
	if b == 0 {
      return 1
	} else if b % 2 == 0 {
      return functionTwo(a: a*a, b: b/2)
	} else {
      return functionTwo(a: a*a, b: b/2) * a
	}
 }
 
 ```
 
 **Bonus:**
 
 ```
 func functionThree(_ number: Int) -> Int {
	if number % 2 == 0 {
      return number+1
	} else {
      return functionThree(functionThree(number-1))
	}
 }
 ```
 */


 /*:
 ## CONCLUSION
 
 ### CHECK-FOR-UNDERSTANDING: WRITE-SHARE
 
 *Write down in groups your summary of both closures & recursion. Then we'll share together as a class.*
 
 */
