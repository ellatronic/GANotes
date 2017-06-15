//
//  ErrorPracticeTests.swift
//  ErrorPracticeTests
//
//  Created by Ezekiel Abuhoff on 9/8/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import XCTest
@testable import ErrorPractice

class ErrorPracticeTests: XCTestCase {
    
    enum EightiesError: Error {
        case CruisingForTrouble
        case NoSwayze
    }
    
    // MARK:
    // MARK: Tests - Part 1
    
    func testDoTryCatch() {
        /*
         Create an integer constant equal to 4.
         Set the value of a new integer constant to the return value of calling riskyBusiness, passing in your first integer constant.
         Wrap that call in do, try, catch so that there are no compile-time errors.
         In the catch block, print "ERROR!"
         After the catch block, print "OK!"
         Run the test function and observe what is printed.
         */
        
        let integer = 4
        
        do {
            let newInteger = try riskyBusiness(someInteger: integer)
        } catch {
            print("ERROR!")
        }
        
        print("OK!")
    }
    
    class Wine: Error {
        let description = "It's the finest of wines."
    }
    
    struct Cheese: Error {
        let description: String
    }
    
    func cheesyTimesAtRidgemontHigh() throws {
        if (true) {
            throw Cheese(description: "This is an error!")
        } else {
            throw Wine()
        }
        
        let level = LogLevel.Error
        
        if level.rawValue == "Silent" {
            
        }
    }
    
    enum LogLevel: String, Error {
        case Silent = "Silent"
        case Error = "Error"
        case Debug = "Debug"
        case Verbose = "Verbose"
    }
    
    func tryToCatchTheCheese() {
        do {
            try cheesyTimesAtRidgemontHigh()
        } catch let cheesyError as Cheese {
            print(cheesyError.description)
            print("Dangerously cheesy!")
        } catch is Cheese {
            print("Cheese.")
        } catch {
            print("Some other error. Boring.")
        }
    }
    
    func testDoTryCatchAgain() {
        /*
         Copy your code from the first test function to this test function.
         Change the value of the first integer constant to 14.
         Run the test function and observe what is printed.
         */
        
        func someFunction() throws {
            print("water")
            throw EightiesError.CruisingForTrouble
        }
        
        let integer = 14
        
        do {
            try riskyBusiness(someInteger: integer)
        } catch {
            
        }
    }
    
    // MARK:
    // MARK: Tests - Part 2
    
    func testErrorEnumCatch() {
        /*
         Copy your code from the first test function again.
         Change the method called with try to dirtyDancing, passing in the same parameter.
         Expand your catch block to two catch blocks, one that catches .CruisingForTrouble errors (print "You can't handle the truth!") and one that catches .NoSwayze errors (print "Nobody puts baby in a corner!").
         Run the test function and observe what is printed.
         */
        
        
    }
    
    func testErrorEnumCatchAgain() {
        /*
         Copy your code from the test function above.
         Change the value of the first integer constant to 14.
         Run the test function and observe what is printed.
         */
    }
    
    enum Mistake: Error {
        case Mine
        case Yours
        case Somebodys
    }
    
    func checkString(string: String) throws -> String {
        if string.characters.count > 8
        && string.characters.count <= 12 {
            throw Mistake.Mine
        } else if string.characters.count > 12 {
            throw Mistake.Yours
        }
        
        return string
    }
    
    func testWritingAThrowingFunction() {
        /*
         Above this function, define an error enum with three cases.
         Below that enum, define a function that takes a string and returns a string. The function should be capable of throwing errors. In this function, if the string is longer than 8 characters, the function should throw one kind of error. If the string is longer than 12 characters, it should throw another kind of error. Otherwise, the function should return the value of the string it was passed.
         In this test function, call the function you defined, passing in a string of your choosing.
         Wrap this call in do, dry, catch, accounting for all cases of your error type.
         If there is no error, print the string your function returns.
         */
        
        
    }
    
    // MARK:
    // MARK: Utility
    
    
    
    func riskyBusiness(someInteger: Int) throws -> Int {
        if someInteger > 10 {
            throw EightiesError.CruisingForTrouble
        }
        
        return someInteger * 2
    }
    
    func dirtyDancing(someInteger: Int) throws -> Int {
        
        let riskyInt = try riskyBusiness(someInteger: someInteger)
        
        if riskyInt > 10 {
            throw EightiesError.NoSwayze
        }
        
        return someInteger * 3
    }
}
