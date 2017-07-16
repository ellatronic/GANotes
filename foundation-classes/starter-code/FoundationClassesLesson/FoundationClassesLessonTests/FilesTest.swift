//
//  FilesTest.swift
//  FoundationClassesLesson
//
//  Created by Wellington Moreno on 9/14/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation
@testable import FoundationClassesLesson
import XCTest

class FilesTest: XCTestCase {
    
    
    func testCanLoadDates() {
        let fileName = "Dates"
        let file = Files.loadFile(filename: fileName)
        
        XCTAssertNotNil(file)
        XCTAssertFalse(file!.isEmpty)
    }
    
    func testCanLoadNumbers() {
        let filename = "Numbers"
        let file = Files.loadFile(filename: filename)
        
        XCTAssertNotNil(file)
        XCTAssertFalse(file!.isEmpty)
    }
}
