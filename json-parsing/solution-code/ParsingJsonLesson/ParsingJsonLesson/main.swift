//
//  main.swift
//  ParsingJsonLesson
//
//  Created by Wellington Moreno on 9/7/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation


//=============================
//INSTRUCTOR
//=============================

//Parse this into an NSArray and calculate the sum
let simpleNumbersJson = "[12, 35, 66, 7, 34, 23, 313, 1 23, 123, 13]"

func calculateSum(from json: String) -> Int
{
    var sum = 0
    
    guard !json.isEmpty else { return sum }
    guard let data = json.data(using: .utf8)
    else {
        print("Could not map json string to data")
        return sum
    }
    
    guard let parsedJson = try? JSONSerialization.jsonObject(with: data, options: [])
    else {
        print("Could read JSON: \(json)")
        return sum
    }
    
    guard let numbers = parsedJson as? NSArray
    else {
        print("Parsed JSON is not an array: \(json)")
        return sum
    }
    
    for case let number as Int in numbers {
        sum += number
    }
    
    return sum
}

//=============================
//STUDENTS
//=============================

//Your turn
let numbers = JSON.numbers

//Write a function that takes this JSON arary of numbers and returns the average.
func average(of json: String) -> Double {
    
    var average = 0.0
    
    guard !json.isEmpty else { return average }
    guard let data = json.data(using: .utf8) else { return average }

    guard let parsedJson = try? JSONSerialization.jsonObject(with: data, options: [])
    else { return average }
    
    guard let numbers = parsedJson as? NSArray else { return average }
    
    var totalNumbers = 0.0
    var sum = 0.0
    
    for case let number as Double in numbers {
        sum += number
        totalNumbers += 1
    }
    
    average = sum / totalNumbers
    
    return average
}

let numbersAverage = average(of: numbers)
print("Numbers Average: \(numbersAverage)")


//=============================
//INSTRUCTOR
//============================

let person = JSON.person
//Parse the person object and print the person's name and Zip Code


//=============================
//STUDENTS
//=============================

let people = JSON.people

//Write a function that takes this json and prints everyones email address
func printEmails(inJson json: String)
{
    
}


//Write another function that takes this json and tells me how many are women

//Write another function that takes this json and tells me the average age of everyone.


//=============================
//INSTRUCTOR
//============================

//Create a struct or class to model an image

struct Photo {
    
    let photoId: String
    let poster: String
    let timePosted: String
    let email: String
    let location: String
    let imageLink: URL
    let ipAddress: String
    
    
    //This function converts an NSDictionary into a Photo Object
    //It returns nil if it can't
    static func fromDictionary(dictionary: NSDictionary) -> Photo? {
        
        //Pull out each individual element from the dictionary
        guard let photoId = dictionary["photo_id"] as? String,
            let poster = dictionary["poster"] as? String,
            let timePosted = dictionary["time_posted"] as? String,
            let email = dictionary["email"] as? String,
            let location = dictionary["location"] as? String,
            let imageLink = dictionary["image_link"] as? String,
            let imageUrl = URL(string: imageLink), //Converts the String into a URL object
            let ipAddress = dictionary["ip_address"] as? String
            else {
                return nil
        }
        
        //Take the data parsed and create a Photo Object from it
        return Photo(photoId: photoId, poster: poster, timePosted: timePosted, email: email, location: location, imageLink: imageUrl, ipAddress: ipAddress)
    }
}

let images = JSON.images


//Write a function that takes this JSON and returns an Array of all of the Photos

func convertToPhoto(json: String) -> [Photo] {
    
    guard !json.isEmpty else { return [] }
    guard let data = json.data(using: .utf8)
        else { return [] }
    
    //Parse the data into Swift
    guard let object = try? JSONSerialization.jsonObject(with: data, options: [])
        else { return [] }
    
    //Expect the top object to be an array
    guard let array = object as? NSArray
        else { return [] }
    
    //This array will store each photo
    var photos: [Photo] = []
    
    //Go through the array one element at a time
    for element in array {
        
        //Expect each element to be a Dictionary
        guard let photoObject = element as? NSDictionary
            else { return [] }
        
        //Call that Photo function to do the rest of the parsing work for me
        //Expect to get back a Photo object
        guard let photo = Photo.fromDictionary(dictionary: photoObject)
            else { return [] }
        
        //Put that photo object in the array
        photos.append(photo)
    }
    
    //Return the photos array
    return photos
}

//=============================
//STUDENTS
//=============================

//Create a class to model a Book


//Write a function that parses all of the books in the JSON file into an [Book]

//Write a function that tells me the total number of pages accross all books

//Write a function that returns an Array of all of the ISBNs

//Write a function that prints the names of all of the books
