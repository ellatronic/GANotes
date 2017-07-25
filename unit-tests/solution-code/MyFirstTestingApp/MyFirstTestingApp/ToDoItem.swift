//
//  ToDoItem.swift
//  MyFirstTestingApp
//
//  Created by Richard Ash on 3/13/17.
//  Copyright © 2017 Richard. All rights reserved.
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
