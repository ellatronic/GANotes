//
//  ViewController.swift
//  DataPersitence
//
//  Created by Richard Ash on 3/17/17.
//  Copyright © 2017 Richard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var array: [Int]!
  var secondArray: [ToDoItem]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let savedArray = Array(1...10)
    array = savedArray
    
    secondArray = [ToDoItem(name: "Richard", timeStamp: "bhfjsfhjsd")]
    save()
    
    if let loadedData = load() {
      print(loadedData)
      print("I loaded data")
    }
    
    //    if load() {
    //      array = savedArray.reversed()
    //    } else {
    //      array = savedArray
    //    }
    //
    //    save()
  }
  
  func save() {
    let successfulSave = NSKeyedArchiver.archiveRootObject(secondArray, toFile: ViewController.ArchiveURL.path)
    
    if successfulSave {
      print("Success!!!")
    } else {
      print("Screw it I'm going to lunch")
    }
  }
  
  func load() -> [ToDoItem]? {
    return NSKeyedUnarchiver.unarchiveObject(withFile: ViewController.ArchiveURL.path) as? [ToDoItem]
  }
  
  
  
  
  
//  
//  // Save the data
//  func save() {
//    UserDefaults.standard.set(true, forKey: "array")
//  }
//  
//  // Read the data
//  func load() -> Bool {
//    if let bool = UserDefaults.standard.value(forKey: "array") as? Bool {
//      return bool
//    } else {
//      return false
//    }
//  }
  

}

// MARK: - Table View Data Source

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.textLabel?.text = "\(array[indexPath.row])"
    
    return cell
  }
  
}

// MARK: - Archiving Path 

extension ViewController {
  // Creating a place (path) to store our data to
  static let DocumentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
  static let ArchiveURL = DocumentDirectory.appendingPathComponent("toDoItems")
}
