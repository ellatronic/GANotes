//
//  Reviews.swift
//  CloudyLove
//
//  Created by David A. Schrijn on 4/13/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//
import UIKit
import Foundation
import Firebase

class Reviews {
    
    var title: String
    var rating: Int
    var review: String
    var reviewID: String
    var productID: String
    
    init (title: String, rating: Int, review: String, reviewID: String, productID: String) {
        self.title = title
        self.rating = rating
        self.review = review
        self.reviewID = reviewID
        self.productID = productID
    }
    
    static func create (fromJSON json: [AnyHashable : Any]) -> Reviews? {
        guard let productID = json["productID"] as? String else {
            return nil
        }
        guard let rating = json["rating"] as? Int else {
            return nil
        }
        guard let review = json["review"] as? String else {
            return nil
        }
        guard let reviewID = json["reviewID"] as? String else {
            return nil
        }
        guard let title = json["title"] as? String else {
            
            return nil
        }
        
        return Reviews(title: title, rating: rating, review: review, reviewID: reviewID, productID: productID)
    }
    
}
