// SwiftDictionaries Notes
// Modified: Feb 22, 2017
// By: Ella Chiang

import UIKit

//MARK: SECTION 1

//CREATING DICTIONARIES

var dict = [String : String]()
var dict2 = Dictionary<String, String>()

var programmingLanguages = [
    "Swift" : 1,
    "Objective-C" : 2,
    "Python" : 3
]

type(of: programmingLanguages)
programmingLanguages.count
programmingLanguages.isEmpty

programmingLanguages.updateValue(4, forKey: "Python") // Replace a value
print(programmingLanguages)

programmingLanguages["Java"] = 5 // Add a value
print(programmingLanguages)

programmingLanguages.removeValue(forKey: "Python")
print(programmingLanguages)

for (key, value) in programmingLanguages {
    print(key, value)
}

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
