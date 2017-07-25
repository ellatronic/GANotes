//
//  ToDoItem.swift
//  UnitTestsNotes
//
//  Created by Ella on 3/13/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import Foundation

class ToDoItem {
    let name: String
    var description: String?
    var location: [Double]?
    var isChecked = false

    init?(name: String) {
        self.name = name
    }
}
