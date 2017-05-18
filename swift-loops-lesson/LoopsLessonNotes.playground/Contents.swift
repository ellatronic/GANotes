import Foundation
/*:
 # ![GA icon](GALogo.png) Writing Loops in Swift
 
 ### Learning Objectives
 Students will be able to:
 * Identify the purpose of a loop.
 * Explain the different parts to a `for` and `while` loop.
 * Write and use a `for` loop.
 * Write and use a `while` loop.
 
 ### STUDENT PRE-WORK
 
 *Before this lesson, you should be able to:*
 * Run code in Playgrounds.
 * Create variables using basic data types.
 * Use conditional statements (`if`, `else`, `switch`) in conjunction with boolean logic (`&&`, `||`, `!`).
 
 #### Analogies
 
 Imagine you have a pile of clothes, and you are looking for a specific pair of socks.
 How do you go about finding it?
 
 What happens in a Nascar Race track? All of the cars go round and round hundreds of times. However, they eventually exit the loop. You could say that the cars go around the track 200 times. You can also say, the cars go around the track *until* the race is over or the car crashes.
 
 ## Introduce For Loop
 
 A loop is a sequence of instructions that is continually repeated until a certain condition is reached.
 
 A `for` loop iterates over a collection of Objects. The code block following the loop declaration is executed for each element.
 
 **Elements of a for loop:**
 - name
 - iterator
 - range operator

 **Examples**
 
 This loop goes through the number 0-10 *(inclusive)* and prints "each one".
 The body of this function executes 11 times.
 Each time around, the i is different, and represents the next number in the series.
 
    for i in (0...10) {
        //access numbers 0-10
        print(i)
    }
 */
for i in 0...10 {
  print(i)
}


for i in 0...10 {
  print(i)
  for j in 7...11 {
    if i == 5 {
      break
    }
    print(j)
  }

  
  
}
/*:
 
 This loop goes from the number 1 up to, but not including, the number 10 and prints each one.
 The body of this function executes 9 times.
 
 
    for i in (1..<10) {
        //access numbers 1-9
        print(i)
    }
 */

/*:
 This loop executes 10 times, but it ignores the numbers by using the `_`(underscore) as a variable name.
 The body is executed 10 times. In this case, "yo" is printed to the console 10 times.
 ```
 for _ in (1...10) {
    //Ignore the number, just do something 10 times
    print("yo")
 }
 ```
 */

/*:
 **The Break**
 
The `break` keyword is used to force a premature exit in a loop.

For example, if you are looking for a specific book in the library, there is no reason to keep searching after you find it. This loop looks for a specific number, and stops until it finds it.
 
```
let number = 4
 
for i in 0...10 {
    if i == number {
        print("Found number!")
        break
    }
    //You will see this only prints until 3.
    print(i)
}
 ```
 */

/*:
 ## Pair Programming Practice
 * Write a `for` loop that prints the number `1-500`
 * Write a `for` loop that prints the number `20-2999`
 * Write a `for` loop that prints your name `777` times
 * Write a `for` loop that prints the even numbers from `1-1000`
 * Write a `for` loop that prints the odd numbers from `1-10,000`
 */

/*:
 ## Introduce While Loop
 
 A while loop executes until a certain condition is `false`.
 
 The body of this loop is never executed because the condition is false to begin.
 
 **Elements of a while loop:**
 - name
 - condition
 
 ```
 var shouldRun = false
 
 while shouldRun {
    //Never gets executed
    print("Go!")
 }
 ```
 */

/*:
 The body of this loop executes forever. This is called an infinite loop, because the loop never terminates.
 Do not write infinite loops. They cause Apps to hang. The only rectification would be termination.
 
 ```
 var shouldRun = true
 
 while shouldRun {
    //Runs forever
    print("Go!")
 }
 ```
 You can, however, manually exit the loop at anytime using the `break` keyword. In the following function, "Go!" is printed once.
 The loop immediately exits after that.
 
 ```
 var shouldRun = true
 
 while shouldRun {
    print("Go!")
    break
 }
 ```
 */

/*:
 You can also use `while` loops to count numbers forwards and backwards.
 
 ```
 var starting = 10
 
 while starting >= 0 {
    print(starting)
    //IMPORTANT: Don't forget to update the value each time
    //In this case, we are reducing its value by one each time
    starting -= 1
 }
 ```
*/

/*:
 **`repeat-while`**
 
 The `repeat-while` loop is a variant of the `while` loop. The only difference is that the condition is run at the **end** of the loop instead of the beginning.
 
 ```
 var starting = 10
 
 repeat {
    print(starting)
    starting -= 1
 } while starting >= 11
 */

/*:
 ## Pair Programming Practice
 
 * Write a `while` loop that prints the number `1-500`
 * Write a `while` loop that prints the number `1-500` backwards
 * Write a `repeat-while` loop that prints your name `777` times
 * Write a `while` loop that prints the odd numbers from `1-10,000`
 */

/*:
 ## Independent Practice
 
 * Write a `for` loop that prints all the numbers divisible by 3 from `1-10,000`
 * Write a `while` loop that prints all the numbers divisible by 3 from `1-10,000`
 * Write a loop that prints a human readable month of your birth month, including the month and day.
 For example, "January 1st", "January 2nd", "January 3rd", etc...
 */
for i in 1...100 {
  if i % 2 == 0 {
    continue
  }
  print(i)
}







