//
//  JSONPracticeTests.swift
//  JSONPracticeTests
//
//  Created by Ezekiel Abuhoff on 9/6/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import XCTest
@testable import JSONPractice

class JSONPracticeTests: XCTestCase {
    func testBasicArray() {
        /*
         In the answer area, set the value of myJSONString to JSON of an array with
         two elements: a string that says 'Thing One' and a string that says 'Thing Two'.
         */
        
        var myJSONString = ""
        
        /* -- ANSWER AREA BEGINS -- */
        
        
        
        /* -- ANSWER AREA ENDS -- */
        
        do {
            let answer = try parse(jsonString: myJSONString) as! [String]
            XCTAssert(basicArray == answer)
        } catch {
            XCTFail()
        }
    }
    
    func testBasicDictionary() {
        /*
         In the answer area, set the value of myJSONString to JSON of an object with
         two key-value pairs: the key 'businessman' returning a false value and the key
         'business, man' returning a true value.
         */
        
        var myJSONString = ""
        
        /* -- ANSWER AREA BEGINS -- */
        
        
        
        /* -- ANSWER AREA ENDS -- */
        
        do {
            let answer = try parse(jsonString: myJSONString) as! [String : Bool]
            XCTAssert(basicDictionary == answer)
        } catch {
            XCTFail()
        }
    }
    
    func testNestedObject() {
        /*
         In the answer area, set the value of myJSONString to JSON of an array with
         three elements: an object with the key-value pair of 'Din' and 33,
         an object with the key-value pair of 'Farore' and 33, and an object with
         the key-value pair of 'Nayru' and 33.
         */
        
        var myJSONString = ""
        
        /* -- ANSWER AREA BEGINS -- */
        
        
        
        /* -- ANSWER AREA ENDS -- */
        
        do {
            let answer = try parse(jsonString: myJSONString) as! [[String : Int]]
            XCTAssert(nested == answer)
        } catch {
            XCTFail()
        }
    }
}
