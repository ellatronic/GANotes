//: Playground - noun: a place where people can play

import UIKit


func printNumbers() {
    
    for i in (1...10) {
        print(i)
    }
    
    print()
}

func printNumbersBackwards() {
    
    var i = 10
    
    while i >= 1 {

        print(i)
        i -= 1
    }
}

printNumbers()

printNumbersBackwards()
