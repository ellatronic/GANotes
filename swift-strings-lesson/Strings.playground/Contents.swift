import UIKit
/*:

 # Swift Strings
 =======================
 
 ## Learning Objectives
 
 * **Articulate** how Strings are stored
 
 * **Manipulate** characters in Strings
 
 * **Parse** words inside of a String
 
 * **Iterate** through characters in a String
 
 ## Connection to long term goal:
 
 Strings is a fundamental type in Swift, a struct but not a class that is used throughout Swift itself as well as iOS application development.
 
 ## Opening (5 - 10 Mins)
 
 What is a String type?
 
 ## Practice Problem
 
 Write a function that takes a number represented as a String and converts it to an Int.

 ## DEFINITION
 
 "A String is a series of characters."
 
 **Syntax**:
 
 `var stringName: Type? = ...`
 ```
 var name: String = "Eric"
 
 ```
 
 ## Introduction: Strings (10 mins)
 
 Strings are important. As constants String types play a key role in iOS development.  A value for `kURL`, for instance, may be an example of how a String type is used to facilitate HTTP requests; A storyboard ID is a String type that you can use to create a new ViewController based on that storyboard's ViewController or for the sake of assigning a class to a scene in Interface Builder we use a String type. Here is an example of a real world application of the String type to iOS application development.
 
 ![StoryboardID](./StoryboardID.png)
 
 ```
 @IBAction func buttonPressed(sender: AnyObject) {
 let vc = storyboard?.instantiateViewControllerWithIdentifier("MyViewController") as MyCustomViewController
 presentViewController(vc, animated: true, completion: nil)
 }
 ```

 */
var string: String

// write code here 


/*:

 # DEMO (15 mins)
 
 * Iterate through the String using a for loop.
 
 * Iterate through the String using index
 
 * Solve the opening problem
 
 * Splitting Strings
 
 ---
 
 */
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

var poem = "Language is meaning \n" +
    "Humans make Language \n" +
    "So Humans make meaning \n" +
    "Meaning is created \n" +
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



/*:
 
 # INDEPENDENT PRACTICE (10 mins)
 
 ## PRACTICE PROBLEMS
 
 Write a function that
 
 * Take a String and returns the String with an emoji character appended to the original
 
 * Take a String and returns a String with an emoji character prepended to the original
 
 * Takes a String and returns a count of how many spaces are in the String
*/

// write code here...
func addEmoji(string: String) -> String {
    let newString = string + "😇"
    return newString
}

addEmoji(string: "hi")

func prependEmoji(string: String) -> String {
    var newString = "😇"
    newString += string
    return newString
}

prependEmoji(string: "hello")

func countSpaces(string: String) -> Int {
    var numberOfSpaces = 0
    for character in string.characters {
        if character == " " {
            numberOfSpaces += 1
        }
    }

    return numberOfSpaces
}

countSpaces(string: "h i ")
// .insert(thingToInsert, at: indexToInsertAt)
// .startIndex, .endIndex for starting and ending indexes
/*:
 
 # PAIR-PROGRAMMING PRACTICE (15 mins)
 
 ## PRACTICE PROBLEMS
 
 * Takes a String representing a sentence and returns a String with the words (not the characters) reversed
 
 * Takes a String and prints it in all upper case
 
 * Write  a function that takes a String and returns a new String with all instances of the Character ‘a’ with the character ‘o’.
 
 * Write a function that prints all of the Unicode characters (advanced)
 
 */
var string45: String

func reverseWords() {

}

// Takes a String and prints it in all upper case

func makeUppercase(string:String) -> String {
    let newString = string.uppercased()
    return newString
}
makeUppercase(string: "yelling")

//Write  a function that takes a String and returns a new String with all instances of the Character ‘a’ with the character ‘o’.


func stringAstring(string: String) -> String {
    var aNewString = ""

    for element in string.characters {
        // swapping a with o
        if element == "a" {
            aNewString += "o"
        } else {
            aNewString += String(element)
        }
    }
    return aNewString
}

stringAstring(string: "hahhahahahhaha")

/*:

*/


/*:
 # CONCLUSION (5 mins)
 
 ## CHECK-FOR-UNDERSTANDING: WRITE-SHARE
 
 *Write down what you think is the purpose of a String type.*
 
 ## TAKEAWAYS
 
 * The structure reference for a String type reveals a `struct` with definite methods & properties for its manipulation as a data types; the String type is an Array of characters.
 
 * Most of what your users communicate to you will be through Strings: passwords, emails, numbers, names, etc.
 
 ## Further Reading
 [Strings & Characters](https://developer.apple.com/library/mac/documentation/Swift/Conceptual/Swift_Programming_Language/StringsAndCharacters.html#//apple_ref/doc/uid/TP40014097-CH7-ID285)
 [Swift evolution design overview](https://github.com/apple/swift/blob/master/docs/StringDesign.rst)
 
 */


