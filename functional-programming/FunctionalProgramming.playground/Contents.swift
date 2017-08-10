//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


import UIKit
import Foundation

func squared(i: Int) -> Int { return i * i }

[1, 2, 3].map(squared)

func quadruple(i: Int) -> Int { return i * i * i * i }
[1, 2, 3].map(quadruple)

let arrayOfIntegers = [3, 6, 9]
var storageArray = [Int]()

for i in arrayOfIntegers {
    storageArray.append(i*2)
}
print(storageArray)

let arrayOfIntegersWithMap = [3, 6, 9].map{ $0 * 2 }

let setOfNumbers: Set = [1, 2, 3, 4, 5, 6]
print(type(of:setOfNumbers))

let arrayOfNumbers = [1, 2, 3, 4, 5, 6]

var arrayOfSquares = Array<Int>()
for i in arrayOfNumbers {
    arrayOfSquares.append(i * i)
}

let arrayOfSquaredNumbers = [1, 2, 3, 4, 5, 6].map {$0 * $0}

setOfNumbers.map {$0 * $0}

Array(repeating: 1, count: 3)

let primes = [2, 3, 5, 7, 11, 13]
let negatedPrimes = primes.map(-)

let negatedBooleanValues: Array<Bool> = [true, false, true, false, true, true].map(!)

let booleanValues = [true, false, true]
let invertedBooleanValues = booleanValues.map(!)

let arrayOfMappedObjects = [negatedPrimes, arrayOfSquaredNumbers]

/////////////////////////////////////

let arrayOfNumbers1 = [1, 2, 3, 4, 5, 6]
var newArrayOfNumbers = arrayOfNumbers1.map{ $0 * $0 }
print(newArrayOfNumbers)





