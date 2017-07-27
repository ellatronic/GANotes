//
//  ViewController.swift
//  googleBooksAPI
//
//  Created by Richard Ash on 3/14/17.
//  Copyright © 2017 Richard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var books = [Book]()
//  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let apiManager = APIManager()
    
    apiManager.searchForISBN(9780198754626) { books in
      self.books = books
      dump(books)
//      DispatchQueue.main.async {
//        self.tableView.reloadData()
//      }
    }
    
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

