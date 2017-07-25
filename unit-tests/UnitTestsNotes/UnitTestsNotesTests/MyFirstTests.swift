//
//  MyFirstTests.swift
//  UnitTestsNotes
//
//  Created by Ella on 3/13/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import XCTest
@testable import UnitTestsNotes // Allows access to code we want to test. MUST USE!!

class MyFirstTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Happens before every single test.
    }
    
    override func tearDown() {
        // Happens after each test case is called.
        super.tearDown()
    }

    // Must use "test" before each function.

    func testOne() {
        // given - certain assumptions
        var item: ToDoItem?

        // when - an action happens
        item = ToDoItem(name: "Buy Groceries")

        // then - condition expected to happen
        XCTAssertNotNil(item, "My item is not nil")
    }

    func testTwo() {
        // given
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController

        // when
        _ = viewController.view

        // then
        XCTAssertNotNil(viewController.myButton)
//        XCTAssert(viewController.myButton is UIButton)
    }
}
