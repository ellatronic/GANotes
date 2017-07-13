//
//  JSONParser.swift
//  JSONPractice
//
//  Created by Ezekiel Abuhoff on 9/6/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation

enum JSONParseError: ErrorProtocol {
    case StringInvalidAsData
    case StringInvalidAsJSONObject
}

func parse(jsonString: String) throws -> AnyObject {
    let data = jsonString.data(using: String.Encoding.utf8)
    guard let validData = data else {
        throw JSONParseError.StringInvalidAsData
    }
    
    do {
        return try JSONSerialization.jsonObject(with: validData, options: JSONSerialization.ReadingOptions.allowFragments)
    } catch {
        throw JSONParseError.StringInvalidAsJSONObject
    }
}

let basicArray = ["Thing One", "Thing Two"]

let basicDictionary = ["businessman" : false, "business, man" : true]

let nested = [["Din" : 33], ["Farore" : 33], ["Nayru": 33]]
