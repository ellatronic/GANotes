//
//  ToDoItem.swift
//  DataPersitence
//
//  Created by Richard Ash on 3/17/17.
//  Copyright © 2017 Richard. All rights reserved.
//

import Foundation

class ToDoItem: NSObject, NSCoding {
  let name: String
  let timeStamp: String
  
  init(name: String, timeStamp: String) {
    self.name = name
    self.timeStamp = timeStamp
    super.init()
  }
  
  // Format data into a ToDoItem
  required convenience init?(coder aDecoder: NSCoder) {
    guard let name = aDecoder.decodeObject(forKey: "name") as? String else { return nil }
    guard let timeStamp = aDecoder.decodeObject(forKey: "timeStamp") as? String else { return nil }
    
    self.init(name: name, timeStamp: timeStamp)
  }
  
  // Format the data to be saved into a file
  func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: "name")
    aCoder.encode(timeStamp, forKey: "timeStamp")
  }
}
