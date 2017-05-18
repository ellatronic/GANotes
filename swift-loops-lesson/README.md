---
title: "Writing Loops in Swift"
type: Lesson
duration: "1:30"
creator:
    name: Wellington Moreno
    city: Santa Monica
---


# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Writing Loops in Swift

### LEARNING OBJECTIVES

Students will be able to:

* Identify the purpose of a loop.
* Explain the different parts to a `for` and `while` loop.
* Write and use a `for` loop.
* Write and use a `while` loop.


### STUDENT PRE-WORK

*Before this lesson, you should be able to:*

* Run code in Playgrounds.
* Create variables using basic data types.
* Use conditional statements (`if`, `else`, `switch`) in conjunction with boolean operators (`&&`, `||`, `!`).


### INSTRUCTOR PREP

+ Decide whether you are going to use a Prop or an Analogy for the Intro.
+ Feel free to use the presentation in the [assets](./assets) folder.
+ Open the Starter and Solution Codes, and verify that they work as expected.

---

## OPENING (5 mins)

>Ask the students:
"How many of you think you know what a loop is?"
If they know, ask them to explain it.

#### Start with an exercise
> Instructor Note:
If you don't have these props, trade it for an analogy.

#### Analogies

Imagine you have a pile of clothes, and you are looking for a specific pair of socks.
How do you go about finding it?
> Expect them to say, "I search through the pile until I find the ones I want"

> Relate this back to Computational Thinking and how it applies.


What happens in a Nascar Race track? All of the cars go round and round hundreds of times. However, they eventually exit the loop. You could say that the cars go around the track 200 times. You can also say, the cars go around the track *until* the race is over or the car crashes.

#### Exercises Using Props

The purpose of this exercise is to create an analogous experience for students to able to relate the material to.

**Deck of Cards**

Have the students split into groups of 4 and give them a deck of cards.
Here's how the exercise works.
1. Shuffle the Cards.
2. Divide the cards among each member of the group.
3. Instructor calls out a random card (i.e, Jack of Spades).
4. Have the students search through their deck. One student per group searches his/her pile at a time. If the card is not found, continue to the next student, until the card is found.
5. Repeat this exercise about 3-4 times.


**Dictionary**

1. Break the students off into groups.
2. Give each group a dictionary.
3. The Student calls off the word
4. have them search for specific words.
5. Pass it around and take turns.

> Relate these exercises to the process of loops. The idea is that you perform an action

## Introduce For Loop (10 mins)

A loop is a sequence of instructions that is continually repeated until a certain condition is reached.

A `for` loop iterates over a collection of Objects. The code block following the loop declaration is executed for each element.


**Examples**

This loop goes through the number 0-10 *(inclusive)* and prints "each one".
The body of this function executes 11 times.
Each time around, the i is different, and represents the next number in the series.

```
for i in (0...10) {
    //access numbers 0-10
    print(i)
}
```

This loop goes from the number 1 up to, but not including, the number 10 and prints each one.
The body of this function executes 9 times.

```
for i in (1..<10) {
    //access numbers 1-9
    print(i)
}
```

This loop executes 10 times, but it ignores the numbers by using the `_`(underscore) as a variable name.
The body is executed 10 times. In this case, "yo" is printed to the console 10 times.

```js
for _ in (1...10) {
    //Ignore the number, just do something 10 times
    print("yo")
}
```

**The Break**

The `break` keyword is used to force a premature exit in a loop.

For example, if you are looking for a specific book in the library, there is no reason to keep searching after you find it. This loop looks for a specific number, and stops until it finds it.

```js
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

> Add a check for understanding.

## C.F.U (Think Pair Share) (2 mins)
Essential Question: What is the purpose of a loop
Activity Type: Think Pair Share
Who: Pair with neighbor
1 minute to think, 1 minute to share

## Demo (10 mins)

> Instructor Note: Open the starter code and modify it to use a for loop.

## Pair Programming Practice (15 mins)

+ Write a `for` loop that prints the number `1-500`
+ Write a `for` loop that prints the number `20-2999`
+ Write a `for` loop that prints your name `777` times
+ Write a `for` loop that prints the even numbers from `1-1000`
+ Write a `for` loop that prints the odd numbers from `1-10,000`


## Introduce While Loop (10 mins)

A while loop executes until a certain condition is `false`.


The body of this loop is never executed because the condition is false to begin.

```js
var shouldRun = false

while shouldRun {
    //Never gets executed
    print("Go!")
}
```

The body of this loop executes forever. This is called an infinite loop, because the loop never terminates.
Do not write infinite loops. They cause Apps to hang. The only rectification would be termination.

```js
var shouldRun = true

while shouldRun {
    //Runs forever
    print("Go!")
}
```

You can, however, manually exit the loop at anytime using the `break` keyword. In the following function, "Go!" is printed once.
The loop immediately exits after that.

```js

var shouldRun true

while shouldRun {
    print("Go!")
    break
}
```

You can also use `while` loops to count numbers forwards and backwards.

```js
var starting = 10

while starting >= 0 {
    print(starting)
    //IMPORTANT: Don't forget to update the value each time
    //In this case, we are reducing its value by one each time
    starting -= 1
}
```

## Demo/Code Along (10 mins)

> Instructor Note: Open the Starter code and modify it to use a while loop.


## Pair Programming Practice (15 mins)

+ Write a `while` loop that prints the number `1-500`
+ Write a `while` loop that prints the number `1-500` backwards
+ Write a `while` loop that prints your name `777` times
+ Write a `while` loop that prints the odd numbers from `1-10,000`


## Independent Practice (30 mins)

+ Write a `for` loop that prints all the numbers divisible by 3 from `1-10,000`
+ Write a `while` loop that prints all the numbers divisible by 3 from `1-10,000`
+ Write a loop that prints a human readable month of your birth month, including the month and day.
  For example, "January 1st", "January 2nd", "January 3rd", etc...
  
## *Optional*: Snakes & Ladders Game

If time allows introduce the Snakes & Ladders game. Draw the board on the whiteboard. Code the single player variant together with the students.

## Conclusion (5 mins)
