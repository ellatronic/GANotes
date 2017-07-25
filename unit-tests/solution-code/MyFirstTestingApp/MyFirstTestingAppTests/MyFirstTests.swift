//
//  MyFirstTests.swift
//  MyFirstTestingApp
//
//  Created by Richard Ash on 3/13/17.
//  Copyright © 2017 Richard. All rights reserved.
//

import XCTest
@testable import MyFirstTestingApp

class MyFirstTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
  func testOne() {
    // given
    var item: ToDoItem?
    // when
    item = ToDoItem(name: "Buy groceries")
    
    // then
    XCTAssertNotNil(item, "My item should not be nil!")
  }
  
  func testTwo() {
    // given
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    
    // when 
    _ = viewController.view
    
    // then
    XCTAssertNotNil(viewController.myButton)
//    XCTAssert(viewController.myButton is UIButton)
  }
  
  func testThree() {
    
  }
  
}
