//
//  NumbersTableViewController.swift
//  TableViewTricksLesson
//
//  Created by Wellington Moreno on 9/14/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation
import UIKit

class NumbersTableViewController: UITableViewController {
  
  private var numbers = Array(1...10)
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func onAdd(_ sender: AnyObject) {
    
    let lastNumberIndex = numbers.index(before: numbers.endIndex)
    
    let lastNumber = numbers[lastNumberIndex]
    
    let nextNumber = lastNumber + 1
    
    numbers.append(nextNumber)
    
    //Create the indexPath of the new number
    let newIndexPath = IndexPath(row: numbers.count - 1, section: 0)
    tableView.insertRows(at: [newIndexPath], with: .left)
    
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numbers.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    let number = numbers[indexPath.row]
    cell.textLabel?.text = "\(number)"
    return cell
  }
}
