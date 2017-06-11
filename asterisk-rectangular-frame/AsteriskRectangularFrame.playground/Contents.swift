import UIKit

/*
 Problem:
 Write a function that takes a list of strings an prints them, one per line, in a rectangular frame. For example the list ["Hello", "World", "in", "a", "frame"] gets printed as:
 
 *********
 * Hello *
 * World *
 * in    *
 * a     *
 * frame *
 *********
 */

let testArrayOne = ["Hello", "world", "in", "a", "frame"]
let testArrayTwo = ["My", "favorite", "class", "is", "iOSI"]


func printListInRectangularFrame(_ list: [String]) {
  // Find the length of the longest word
  var maxCharacterLength = 0
  for word in list {
//    if word.characters.count >= maxCharacterLength {
//      maxCharacterLength = word.characters.count
//    }
    maxCharacterLength = max(maxCharacterLength, word.characters.count)
  }
  
  // Print the asterisks & words
  let asterisksRowLength = maxCharacterLength + 4
  // Creates a asterisk string of length asterisk row length
  let asteriskRowString = (1...asterisksRowLength).map { (element) -> String in
    return "*"
  }.joined()
  
  print(asteriskRowString)
  for word in list {
    print("* ", terminator: "")
    print(word, terminator: "")
    
    let difference = maxCharacterLength - word.characters.count
    // Creates a string of spaces of length diff between max Characters and word length
    let spaces = (0..<difference).map{ _ in " " }.joined()
    print(spaces, terminator: "")
    print(" *")
  }
  print(asteriskRowString)
  
  
  
}


printListInRectangularFrame(testArrayOne)
printListInRectangularFrame(testArrayTwo)



