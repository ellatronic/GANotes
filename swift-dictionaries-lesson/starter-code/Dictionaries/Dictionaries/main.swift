//
//  main.swift
//  Dictionaries
//
//  Created by Wellington Moreno on 8/22/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation

print("Hello")

//MARK: SECTION 1

//CREATING DICTIONARIES

//Phone to its price

var phonePrices: [String : Double] = [
    "iPhone SE" : 99,
    "iPhone 6" : 199,
    "iPhone 6 Plus" : 299,
    "iPhone 7" : 349
]

//This way lets you create the dictionary without explicitly setting the types.
let aShorterWay = [
    "iPhone SE" : 99,
    "iPhone 6" : 199,
    "iPhone 6 Plus" : 299,
    "iPhone 7" : 349
]

//Value can be of any type

let placesVisited = [
    "New York" : true,
    "Boston" : false,
    "Paris" : false,
    "Rome" : true,
    "Milan" : true,
    "London" : false,
    "Los Angeles" : true
]



//=====================================
//MARK: SECTION 2

//ACCESING VALUES
//This lets you get the information stored in the Dictionary

let iPhone6Price = phonePrices["iPhone 6"]
print(iPhone6Price)

//If the key does not exist, you should see
let iPhone4Price = phonePrices["iPhone 4"]
print(iPhone4Price)



//ADDING VALUES
//This lets you add information to the dictionary after it has been created
let nexus = "Nexus 6"
//The price won't exist
var nexusPrice = phonePrices[nexus]
print("Nexus price before adding: \(nexusPrice)")

phonePrices[nexus] = 349.99
//Now the price exists. When you ask it again, you should get back the value that was added.
nexusPrice = phonePrices[nexus]

print("Nexus price after adding: \(nexusPrice)")




//REMOVING VALUES
phonePrices.removeValue(forKey: nexus)
//Another way
phonePrices[nexus] = nil


print()
//Iteration
for (phone, price) in phonePrices {
    
    print("The price of the \(phone) is \(price)")
}
