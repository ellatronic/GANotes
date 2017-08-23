//
//  User.swift
//  RestaurantReviews
//
//  Created by David A. Schrijn on 4/3/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import Foundation

class User {
    
    let userID: String
    var name: String
    var reviews: [String] = []
    
    init(name: String, userID: String) {
        self.name = name
        self.userID = userID
        
    }
}
