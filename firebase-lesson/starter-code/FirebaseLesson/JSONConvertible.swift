//
//  Posts+JSON.swift
//  FirebaseLesson
//
//  Created by Wellington Moreno on 9/21/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation
import UIKit

//MARK: JSON Support


/**
 This protocol defines anything that can be converted
 to and from JSON
 */
protocol JSONConvertible {
    
    /**
     Returns a JSON representation of `self`.
     This could be either an NSDictionary or an NSArray
     */
    func asJSON() -> Any?
    
    /**
     This static function (which is a function attached to a class)
     takes a JSON object (either an NSDictionary or NSArray) and converts
     it into an instance of the object we want.
     */
    static func fromJSON(json: Any) -> JSONConvertible?
}
