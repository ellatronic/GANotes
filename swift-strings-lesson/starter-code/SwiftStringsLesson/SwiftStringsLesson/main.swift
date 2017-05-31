//
//  main.swift
//  SwiftStringsLesson
//
//  Created by Wellington Moreno on 8/23/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation

func printEmptyLines(_ numberOfLines: Int) {
    
    print("=====================================")
    for _ in 1..<numberOfLines {
        print()
    }
}


//PART 1

//=====================
//ADD LINE BREAKS
//=====================

var poem = "Language is meaning " +
"Humans make Language " +
"So Humans make meaning " +
"Meaning is created " +
"Not found."


print(poem)
printEmptyLines(2)


//=====================
//ITERATE USING FOR LOOP
//=====================

for character in poem.characters {
    print("Using Loop: ", character)
}

printEmptyLines(2)


//=====================
//ITERATE USING INDEX
//=====================

for index in poem.characters.indices {
    let character = poem[index]
    print("By Index: \(character)")
}

print(poem)

printEmptyLines(2)


//PART 2

//=====================
//SPLITTING STRINGS
//=====================

let question = "A book costs $1 plus half its price. How much does it cost?"
let wordsInQuestion = question.components(separatedBy: " ")
print(wordsInQuestion)


printEmptyLines(2)


// You split strings using any character
let interests = "Programming,Swift,Tai Chi,Music,Bike Riding,Reading,Business"
let interestsArray = interests.components(separatedBy: ",")
print(interestsArray)

printEmptyLines(2)
