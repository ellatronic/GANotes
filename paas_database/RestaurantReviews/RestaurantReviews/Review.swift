//
//  Review.swift
//  RestaurantReviews
//
//  Created by David A. Schrijn on 4/3/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import Foundation

class Review {
    
    let reviewID: String
    var star: Int
    let byUser: String
    let restaurantID: String
    
    init(reviewID: String, star: Int, byUser: String, restaurantID: String) {
        self.reviewID = reviewID
        self.star = star
        self.byUser = byUser
        self.restaurantID = restaurantID 
    }
    
}
