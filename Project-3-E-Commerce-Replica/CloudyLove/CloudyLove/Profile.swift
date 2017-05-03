//
//  Profile.swift
//  CloudyLove
//
//  Created by David A. Schrijn on 4/6/17.
//  Copyright © 2017 Theron Jones. All rights reserved.

import Foundation

class Profile {
    
    var name: String
    var username: String
    var password: String
    var email: String
    var address: String
    var favorites: String
    var reviews: String
    var age : Int
    var male: Bool
    var female: Bool
    
    init(name: String, username: String, password: String, email: String, address: String, favorites: String, reviews: String, age: Int, male: Bool, female: Bool) {

        self.name = name
        self.username = username
        self.password = password
        self.email = email
        self.address = address
        self.favorites = favorites
        self.reviews = reviews
        self.age = age
        self.male = male
        self.female = female
    }
}
