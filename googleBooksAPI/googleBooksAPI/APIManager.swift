//
//  APIManager.swift
//  googleBooksAPI
//
//  Created by Richard Ash on 3/14/17.
//  Copyright © 2017 Richard. All rights reserved.
//

import Foundation

class APIManager {
  
  private let baseUrlString =  "https://www.googleapis.com/books/v1/volumes?q=isbn:"
  
  
  func searchForISBN(_ isbn: Int, completion: @escaping ([Book]) -> Void) {
    guard let url = URL(string: baseUrlString + "\(isbn)") else { return }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil, let data = data else { return }
      
      do {
        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
        
        guard let items = json["items"] as? [[String: Any]] else { return }
        
        var books = [Book]()
        for item in items {
          if let book = Book.create(from: item) {
            books.append(book)
          }
        }
        
//        let booksTwo = items.flatMap(Book.create)
        
        completion(books)
        
      } catch {
        print(error)
      }
      
      
      
    }
    
    
    task.resume()
    
  }
  
}
