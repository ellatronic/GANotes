import Foundation


// 1. use recursion to write a function that takes a integer and prints all of the numbers 1 through that number. Example: passing in 5 will print 1, 2, 3, 4, 5

func printFirstNumbers(n: Int) {
    if n > 1 {
        printFirstNumbers(n: n-1)
    }
    print(n)
}
//printFirstNumbers(n: 5)

// 2. use recursion to write a function that takes a integer and prints all of the numbers 1 through that number. Example: passing in 5 will print 5, 4, 3, 2, 1.

func printFrom(n: Int) {
    print(n)
    if n > 1 {
        printFrom(n: n-1)
    }
}
//printFrom(n: 5)

// 3. Implement a recursive function named fibonacci that takes a number N and returns the N-th fibonacci number. The first two fibonacci numbers are 1 and the rest are the sum of the previous two.

func fibonacci(of i: Int) -> Int {
    if i <= 2 {
        return 1
    } else {
        return fibonacci(of: i-1) + fibonacci(of: i-2)
    }
}

//fibonacci(of: 3)
//fibonacci(of: 4)
//fibonacci(of: 5)
//fibonacci(of: 6)
//fibonacci(of: 7)

// 4. Write a recursive function named factorial that takes an integer N and returns it’s factorial.

//The factorial of a non-negative integer N, denoted N!, is the product of all the positive integer less than or equal toN. The value of 0! is defined as 1.

func factorial(of n: Int) -> Int {
    if n != 0 {
        return n*(factorial(of: n-1))
    } else {
        return 1
    }
}

//factorial(of: 5)
//factorial(of: 4)
//factorial(of: 3)
//factorial(of: 2)
//factorial(of: 1)
//factorial(of: 0)

// 5. Use recursion to find the greatest common divisor of two numbers
// the greatest common divisor (gcd) of two or more integers, when at least one of them is not zero, is the largest positive integer that divides the numbers without a remainder. For example, the GCD of 8 and 12 is 4.

func GCD(first: Int, second: Int) -> Int {
    let temp = first % second

    if temp != 0 {
        return GCD(first: second, second: temp)
    } else {
        return second
    }
}

GCD(first: 12, second: 9)
GCD(first: 18, second: 6)

