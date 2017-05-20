# SWIFT VARIABLES AND CONSTANTS

Week 1 -  Day 4 - Lesson 2

BY: WELLINGTON MORENO

---

### CONNECTION TO LONG-TERM GOAL

This is the first lesson on the subject of code.

### LEARNING OBJECTIVES

* **Articulate** the difference between a constant and a variable
* **Declare** variables and constants
* **Identify** different types of Swift expressions
* **Create** expressions like multiplication and addition
* **Print** variables like Strings and Numbers

<!--
## INSTRUCTOR PREP

* Take a look at the [lab](https://github.com/ga-iosi-la/iOSI-course-materials-LA/tree/master/curriculum/04-schedule-and-supplies/week-01/baseline-materials/playgrounds-lab)

* Take a look through the [solution code](https://github.com/ga-iosi-la/iOSI-course-materials-LA/blob/master/curriculum/04-schedule-and-supplies/week-01/baseline-materials/playgrounds-lab/solution-code/PlaygroundsLab.playground/Contents.swift)
-->

### STUDENT PRE-WORK

* Create a new Playgrounds file

### GROUND RULES

* Students should have their laptops closed unless it is *Independent Practice* time.

## LESSON GUIDE

<table>
  <tr>
    <td>TIMING</td>
    <td>TYPE</td>
    <td>TOPIC</td>
  </tr>
  <tr>
    <td>5</td>
    <td>Opening</td>
    <td>What is a variable? What is a constant?</td>
  </tr>
  <tr>
    <td>5</td>
    <td>Introduction</td>
    <td>This is a variable and a constant</td>
  </tr>
  <tr>
    <td>5</td>
    <td>Independent Practice</td>
    <td>Write some variables and constants</td>
  </tr>
  <tr>
    <td>5</td>
    <td>Introduction</td>
    <td>This is a Swift expression</td>
  </tr>
  <tr>
    <td>10</td>
    <td>Guided Practice</td>
    <td>Creating variables and expressions</td>
  </tr>
  <tr>
    <td>10</td>
    <td>Independent Practice</td>
    <td>Create some expressions</td>
  </tr>
  <tr>
    <td>10</td>
    <td>Introduction</td>
    <td>Data Types</td>
  </tr>
  <tr>
    <td>10</td>
    <td>Guided Practice</td>
    <td>Declaring Data Types</td>
  </tr>
  <tr>
    <td>10</td>
    <td>Summative Practice</td>
    <td>Declare and use variables in expressions</td>
  </tr>
  <tr>
    <td>5</td>
    <td>Conclusion</td>
    <td>Key takeaways</td>
  </tr>
  <tr>
    <td>75 mins</td>
    <td></td>
    <td></td>
  </tr>
</table>


## OPENING (5 mins)

Start with an activity that brings to light any ideas and assumptions students might have about what a variable or constant is.

### WRITE-PAIR-SHARE

* What kinds of things in life change often?
* What kinds of things in life are constant?
* How do you think this applies to programming?
* Share and compare notes with a partner
* Discuss with the class

---

## INTRODUCTION: VARIABLES AND CONSTANTS (5 mins)

### DEFINITION

"Constants and variables associate a name with a value of a particular type."

* Swift Reference

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
// let hello = "HI!"
/* A multiple line comment,
used for explaining multiple things! */
let time = "9:27am"; print(time)
```

### CHECK FOR UNDERSTANDING

Show a few pieces of incorrect code, asking the students what is wrong with it?

* Trying to assign to a constant after.
* Initialize multiple variables on a single line without commas
* Forget to end the multi line comment
* Trying to retrieve a declared but uninitialized constant.

## INDEPENDENT PRACTICE (5 mins)

### ACTIVITY

Create a new Playgrounds in Xcode. Declare the following variables

* Write a variable called age with the value 99
* Write a constant called name with your name
* Update the age variable’s value to be your age
* Print your age
* Create a variable with the current time and print it to the screen on the same line
* Create a variable encoded with an emoji name

---

## INTRODUCTION: SWIFT EXPRESSIONS (5 mins)

### DIAGNOSTIC

"Who remembers PEMDAS from middle school?"

Parenthesis, Exponents, Multiplication, Division, Addition, Subtraction:

* Primary Expression Operators: ()[]
* Unary Operators: * & / % + - >> << == !=
* Binary Operators: & ^ | && ||
* Ternary Operator: ?:
* Comma


The same rule applies in programming.

```
let name = "Richard"var age = 26age = 2016 - 1989
let expression = 5 * 8 % 3 / (2 + 12) - 9 
```

Cover the different expression types:

* Assignment
* Arithmetic
* Remainder
* Compound Assignment
* Comparison
* Parenthesis
* Function Call

### CHECK FOR UNDERSTANDING - WRITE-PAIR-SHARE

Check the class with the by asking them to guess what the result of the following expressions are:

```swift
let first = 5 * 10 + 6
let second = 10 + 5 * 6
let areEqual = first == second
let isCorrect = first == 56
let fourth = 5 % 1 * 6 + (2 - 18) % 3 == 15 - 7
```

## GUIDED PRACTICE: CREATING VARIABLES EXPRESSIONS (10 mins)

This section is like a demo, but **have the students guide you.**

They should not be using their laptops for this section.

### PRACTICE PROBLEMS

Do as many of these calculation as you can during class time.

* Take all of the student’s ages and calculate the sum
* Take all of the student’s ages and calculate the average
* Store all of the student’s names in variables
* Print their names to the console

## INDEPENDENT PRACTICE ( 10 mins)

### PRACTICE PROBLEMS

"Do as many as you can."

* Create constants for each one of your family members
* Print their names
* Find the current weather in SF, NYC, and London, and calculate their average.
    * Print it
* Store the following in a variable: "Have you ever programmed before?"

---

## INTRODUCTION: DATA TYPES (10 mins)

Discuss the primitive data types

* Integers
* Doubles
* Strings
* Booleans
* UIImageView * (Bonus)

## GUIDED PRACTICE (10 mins)

* Demonstrate how to explicitly declare data types in Swift.

* Attempt to store an incorrect type in a variable to demonstrate Swift’s strongly-typed semantics.

## INDEPENDENT PRACTICE (10 mins)

This is a summative assessment of the lesson materials for the students to do independently. For this section, students should open up a new Playgrounds.

### PRACTICE PROBLEMS

"Do as many as you can."

* At the market, 6 batteries cost $10.38. How much do 8 batteries cost?
* Brenda can deliver 644 newspapers in 7 hours. How many newspapers can Brenda deliver in 9 hours?
* Robin can clean 72 rooms in 6 days. How many rooms can Robin clean in 2 weeks?

## CONCLUSION (5 mins)

## CLASS DISCUSSION

Class prompt: "If you could make a variable to store anything you want in life, what would you store?"

### TAKEAWAYS

* Variables are used to store information.
* Constant values cannot be changed once it is set.
* Variable values can be changed.
* There are 4 main data types used to store basic pieces of information.
* Expressions are operations that perform actions on variables

### TAKE-HOME QUESTIONS

* "Where do you think variables are stored?"
* "What happens to your variables when your program restarts?"
    * "Why?"

## Resources

+ [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/#naming)