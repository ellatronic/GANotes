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


//=============================
//STUDENTS
//=============================

//Your turn, parse this.
let numbers = JSON.numbers

//Write a function that takes a JSON Array and calculates the average.
//Call it using the `numbers` json above.


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
func printEmails(inJson json: String) {
    
}


//BONUS: Write another function that takes this json and tells me how many are women

//BONUS: Write another function that takes this json and tells me the average age of everyone.


//=============================
//INSTRUCTOR
//============================

//Create a struct or class to model an image

struct Photo {
    let photoId: String
    
    //Etc
}

let images = JSON.images


//Write a function that takes this JSON and returns an Array of all of the Photos

func convertToPhoto(json: String) -> [Photo] {
    return []
}


//=============================
//STUDENTS
//=============================

//Create a class to model a Book


//Write a function that parses all of the books in the JSON file into an [Book]

//Write a function that tells me the total number of pages accross all books

//BONUS: Write a function that returns an Array of all of the ISBNs

//BONUS: Write a function that prints the names of all of the books
