//
//  Restaurant.swift
//  RestaurantReviews
//
//  Created by David A. Schrijn on 4/3/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import Foundation

class Restaurant {
    
    let restaurantID: String
    var name: String
    var price: String
    var location: String
    var reviews: [String] = []
    
    init(restaurantID: String, name: String, price: String, location: String) {
        self.restaurantID = restaurantID
        self.name = name
        self.price = price
        self.location = location
    }
    
}
