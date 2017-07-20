//
//  JSON.swift
//  ParsingJsonLesson
//
//  Created by Wellington Moreno on 9/7/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation

class JSON {

    static let images = loadFile(name: "images")!
    static let person = loadFile(name: "person")!
    static let people = loadFile(name: "people")!
    static let numbers = loadFile(name: "numbers")!
    static let books = loadFile(name: "books")!
    
    
    private static func loadFile(name: String) -> String? {
        
        guard !name.isEmpty else { return nil }
        
        let bundle = Bundle(for: JSON.self)
        
        guard let url = bundle.url(forResource: name, withExtension: "json")
        else {
            print("Failed to load JSON file: \(name)")
            return nil
        }
        
        return try? String.init(contentsOf: url)
    }
}
