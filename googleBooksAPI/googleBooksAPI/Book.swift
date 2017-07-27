//
//  Book.swift
//  googleBooksAPI
//
//  Created by Richard Ash on 3/14/17.
//  Copyright © 2017 Richard. All rights reserved.
//

import UIKit

class Book {
  let name: String
  let description: String?
  let author: String
  let id: String
  var image: UIImage?
  
  init(name: String, description: String?, author: String, id: String, imageUrl: String) {
    self.name = name
    self.description = description
    self.author = author
    self.id = id
    
    
    // UIImage
    guard let url = URL(string: imageUrl) else { return }
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil, let data = data else { return }
      
      if let image = UIImage(data: data) {
        self.image = image
      }
    }
    task.resume()
  }
  
  static func create(from dictionary: [String: Any]) -> Book? {
    // Name
    guard let volumeInfo = dictionary["volumeInfo"] as? [String: Any] else { return nil }
    guard let name = volumeInfo["title"] as? String else { return nil }
    
    // Author
    guard let authors = volumeInfo["authors"] as? [String] else { return nil }
    guard let author = authors.first else { return nil }
    
    // id
    guard let id = dictionary["id"] as? String else { return nil }
    
    // Description
    let description = volumeInfo["description"] as? String
    
    // UIImageURL
    guard let imageLinks = volumeInfo["imageLinks"] as? [String: Any] else { return nil }
    guard let thumbnail = imageLinks["thumbnail"] as? String else { return nil }
    
    return Book(name: name, description: description, author: author, id: id, imageUrl: thumbnail)
  }
  
  
}
