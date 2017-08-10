![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

Functional Programming : `map(_:)`
===============
---

Week 8 - Day 2

By: Eric Giannini 

---


# CONNECTION TO LONG-TERM OBJECTIVE

Functional programming represents a paradigmatic shift from Objective-C with the added benefits of immutability, value semantics & thread safety. 

# LEARNING OBJECTIVES

* **Discuss** Functional Programming

* **Analyze** higher order functions 

* **Implement** `map(_:)`

## STUDENT PRE-WORK

Students should know:

* closures 

# LESSON GUIDE

<table>
  <tr>
    <td>TIMING</td>
    <td>TYPE</td>
    <td>TOPIC</td>
  </tr>
  <tr>
    <td>5</td>
    <td>Opening</td>
    <td>What is ScrollView</td>
  </tr>
  <tr>
    <td>15</td>
    <td>Introduction </td>
    <td>higher order functions</td>
  </tr>
  <tr>
   	<td>15</td>
   	<td>`map(_:)`'s problem</td>
   	<td>`for`-`in`</td>
  </tr>
  <tr>
    <td>10</td>
    <td>Independent Practice</td>
    <td>Solve problems with `map(_:)`</td>
  </tr>
    <tr>
    <td>15</td>
    <td>`map(_:)`'s syntax</td>
    <td>Expand to full syntax</td>
  </tr>
  <tr>
    <td>5</td>
    <td>Conclusion</td>
    <td>Key takeaways</td>
  </tr>
</table>


# OPENING (5 mins)

What is functional programming? 

## DEFINITION 

- functional programming allows functions to take a function as an argument, return a function, or both.

# INTRODUCTION: higher order functions 

- Among these functional programming functions are higher order functions; higher order functions solves a specific problem for us.

One of these functions is called `map(_:)`. Swift's `map(_:)` takes a single closure (i.e., takes a function as an argument) as its argument.

``` 
func squared(i: Int) -> Int { return i * i }
[1, 2, 3].map(squared) 
```
Great! What specific problem does `map(_:)` solve for us?  

# `map(_:)`'s problem

What is the problem that `map(_:)` solves? 

Imagine you would like to return the squares for each element in the array. 

`let arrayOfNumbers = [1, 2, 3, 4, 5, 6]`

One way is a `for`-`in` loop. 

```
var arrayOfSquares = Array<Int>()
for i in arrayOfNumbers {
    arrayOfSquares.append(i * i)
}
```

Since the array is declared as a constant, a new array called `arrayOfSquares` must be created to store the values. The result is two arrays & a `for`-`in` loop.  

What if there were a way to store the values of the new array in the original constant without two arrays or a `for`-`in` loop? Swift's `map(_:)` is the way. 

# `map(_:)`'s solution

Here it is: `let arrayOfSquaredNumbers = [1, 2, 3, 4, 5, 6].map {$0 * $0}`

In a single line of code we reduced several lines of code & we managed to save arrayOfSquaredNumbers into a constant. 

 
# INDEPENDENT PRACTICE (10 mins)

Let's solve a few problems with `map(_:)`: 

## PRACTICE PROBLEMS


1. On `let arrayOfNumbers = [1, 2, 3, 4, 5, 6]` return an array of squares, the 
2. On `let cast = ["Vivien", "Marlon", "Kim", "Karl"]` a) return lowercased with the `.lowercaseString` method, b) return the count with the `.count` method, c) return uppercased with `.uppercaseString`
3. On `let fibonacciSequence: Array<NSNumber> = [1,1,2,3,5]` return the localizedString of each number with `NumberFormatter.localizedString(from:, number: .spellOut)` 
4. On `let setOfNumbers: Set = [1, 2, 3, 4, 5, 6]` return an array of two times each element
5. On `let booleanValues: Array<Bool> = [true, false, true]` return the opposite of each value with `!`


# `map(_:)`'s syntax 

The syntax above is shorthand syntax. Let's try to expand it. 


+ `[1, 2, 3, 4, 5, 6].map({  (i: Int) -> Int in return i*i ) })`
+ `[1, 2, 3, 4, 5, 6].map({ i in return i*i ) })`
+ `[1, 2, 3, 4, 5, 6].map({ i in i * i })`
+ `[1, 2, 3, 4, 5, 6].map({ $0 * $0 })`
+ `[1, 2, 3, 4, 5, 6].map() { $0 * $0 }`
+ `[1, 2, 3, 4, 5, 6].map { $0 * $0 }`

1. passing a function into the closure 
2. type inference 
3. return unnecessary with a single expression
4. Swift's syntactic sugar with shorthand names
5. trailing closure syntax (if last argument closure, movable to outside of function's call)
6. no parentheses after single closure



# PAIR-PROGRAMMING PRACTICE (15 mins)

Expand the shorthand to the full syntax. Work together in pairs; one partner leads the charge on the first question, the other on the second question. 

## PRACTICE PROBLEMS

1. Expand the syntax in the problem for `let cast = ["Vivien", "Marlon", "Kim", "Karl"]` returning lowercased with the `.lowercaseString`
2. Expand the syntax in the problem for `let setOfNumbers: Set = [1, 2, 3, 4, 5, 6]` returning an array of two times each element

---

# CONCLUSION (5 mins)

## CHECK-FOR-UNDERSTANDING: WRITE-SHARE

*Write down what you think is the purpose of a `map(_:)` is.*

## TAKEAWAYS

* functional programming empowers functions to take a function as an argument, return a function, or both. 
* `map(_:)` is a higher order function among functions in Swift. 
*  `map(_:)` solves the problem of `for`-`in` loops. 


## Further Reading 

- [Apple's documentation on `map(_:)`](https://developer.apple.com/reference/swift/collection/1641369-map)

