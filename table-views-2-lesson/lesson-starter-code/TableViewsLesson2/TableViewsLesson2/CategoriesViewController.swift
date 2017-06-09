//
//  ViewController.swift
//  TableViewsLesson2
//
//  Created by Wellington Moreno on 8/27/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import UIKit

class CategoriesViewController: UITableViewController {
  
  private let categories = Category.categories
  
  private let data = [1, 2, 3, 4, 5, 6]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return categories.count
    return data.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    let row = indexPath.row
    cell.textLabel?.text = "\(data[row])"
    return cell
  }
  
}

private class Category {
  
  let name: String
  let image: UIImage
  
  init(name: String, image: UIImage) {
    self.name = name
    self.image = image
  }
  
  static let categories: [Category] = [
    Category(name: "Autumn", image: #imageLiteral(resourceName: "Autumn")),
    Category(name: "Beach", image: #imageLiteral(resourceName: "Beach")),
    Category(name: "Car", image: #imageLiteral(resourceName: "Car")),
    Category(name:"City", image: #imageLiteral(resourceName: "City")),
    Category(name: "Flower", image: #imageLiteral(resourceName: "Flower")),
    Category(name: "Night", image: #imageLiteral(resourceName: "Night")),
    Category(name: "NYC", image: #imageLiteral(resourceName: "NYC")),
    Category(name: "Space", image: #imageLiteral(resourceName: "Space")),
    Category(name: "Waterfall", image: #imageLiteral(resourceName: "Waterfall"))
    
  ]
}
