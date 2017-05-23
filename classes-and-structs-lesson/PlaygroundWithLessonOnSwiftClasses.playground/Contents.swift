/*:
 
 
 
 
 # ![GA icon](GAIcon.png) Classes
 
 Week II DAY IV
 
 ## The topics we will cover are:
 
 - classes
 - instantiation
 - instance methods
 - properties
 
 ## By the end of this lesson, we should be able to (i.e., Learning Objectives):
 * Define what a class is and highlight its practical uses
 * Instantiate a new class in Swift
 * Demonstrate the use of an instance variable for a class
 * Describe some of the properties of classes
 
 ## Connection to long term goal: 
 Classes and objects are the foundation of object-oriented programming, fundamental to working with iOS and all modern languages
 
 ## Student prework before we open!
 * variables / constants
 * functions
 
 ## Opening 
 
 Start with an activity that brings to light any ideas and assumptions students might have about what a class is. What do you think a class is? Let's break up into two person groups for Think-Pair-Share.
 
 ## Introduction
 
 ### Define what a class is
 
 * classes are abstractions of worldly objects programmed into code
 
 ### Anatomy
 
 To start a new class let's pick an object like the idea of a person. To create the class let's use the ``class`` keyword followed by the class name before a pair of curly braces ``{ }`` (i.e., the class' implementation). Accordingly, we create classes with Swift in the following way:
 
 * callout(Class):
    class ClassName {
 
    }

 We make sure to change ``NameOfClass`` to whatever name we would like to call our class but note that the convention for naming a ``class`` in Swift is capitals.

 * callout(Class):
    class Person {

    }

 
 ## Formative Assessment & Guidance
 
 By a show of hands let us know who feels they can explain how to make a class. If volunteers clearly demonstrate the knowledge, introduce a Think-Pair-Share trying to create classes that represent people, architectural elements (e.g. windows with height, width, type, etc.), animals, etc.
 
 */

// Let's program our own worldly object into code.

class House {
    let address: String
    let numberOfRooms: Int

    init(address specifiedAddress: String, numberOfRooms specifiedNumberOfRooms: Int) {
        address = specifiedAddress
        numberOfRooms = specifiedNumberOfRooms
    }
}

let myHouse = House(address: "Stockton", numberOfRooms: 1)
myHouse.address
myHouse.numberOfRooms


class Dojo {
    var address: String
    var students: Int

//    init(address specifiedAddress: String, students numberOfStudents: Int) {
//        address = specifiedAddress
//        students = numberOfStudents
//    }

    init(address: String, students: Int) {
        self.address = address
        self.students = students
    }
}

struct Kata {
    var listOfMovies: [String]

    func printMovies() {
        for i in listOfMovies {
            print(i + "!")
        }
    }
}

let newDojo = Dojo(address: "Pine St", students: 22)
let anotherDojo = newDojo
anotherDojo.address = "Bush St"
print(newDojo.address)

let newKata = Kata(listOfMovies: ["Forest Gump", "Tangled"])
var anotherKata = newKata
anotherKata.listOfMovies = ["Fight Club"]
print(newKata.listOfMovies)
/*:

 ### What is an instance? Define what an instance is
 
 * instances are manifestations of our worldly objects programmed into code
 
Let's talk about instaniating; instantiating is making an instance of an object, a concrete manifestation; if classes were a cookie cutter or blueprint, then the instances would be cookies or buildings.
 
To create an instance of a class, you declare a variable to hold a reference to the class, type an equal sign (the assignment operator) and then the name of the class followed by parentheses.

*/

/*:
 ## Formative Assessment & Guidance
 
 By a show of hands let us know who feels they can explain what a class is, create one, or instantiate an instance of a class. If volunteers clearly demonstrate the knowledge, build upon the last Think-Pair-Share with independent practices by creating instances of the classes that represent people, architectural elements (e.g. windows with height, width, type, etc.), animals, etc. If animal, then lion! Tiger! Hear me roar! ;)
 
 */


class Person {
    
    var name: String?
    
}

var eric = Person()

eric.name = "Eric"

print(eric.name as Any)


class Bug {
    
    var numberOfLegs: Int?
    
}

let spider = Bug()

spider.numberOfLegs = 100

print(spider.numberOfLegs as Any)

class Vehicle {
    
    var size: String = ""
    
}

let jeep = Vehicle()

jeep.size = "Mid Size"

print(jeep.size)



class Candy {
    
}

let chocolate = Candy()

//class MyListOfChocolates: UITableViewController {
//    
//}

/*:
 * ``eric`` is an instance of the ``Person`` class. 
 
    
 If a class is the abstract idea of a ``Person``, then the instance ``eric`` is a concrete manifestation of this programmatic abstraction.
 
 In our instance we make sure to name ``eric`` to whatever name we would like to call our instance of the class ``Person`` but note that the convention for naming an instance of a ``class`` in Swift is camelcase. Camelcase capitalizes every letter in a declaration except the first.
 
 * callout(Camelcase):
 var aStranger = Person()
 
 Our class looks pretty bare though. In the next two sections, we'll start to define the characteristics & behavior of a the class in its implementation. Inside the implementation (i.e., curly braces) we program properties & methods.


 
### properties
 
 Properties are declarations inside the implementation (i.e., curly braces) that describe the characteristics but not behavior of a class. There are several kinds but we will only discuss these two:

* stored properties
* compted properties (getter / setter)


```
class Dragon {
    var lengthOfWing: Int = 0
    var spanOfWings: Int = 0
}
```
*/
class Dragon {
    var lengthOfWing: Int
    var spanOfWings: Int {
        get {
            return lengthOfWing * 2
        }
        set(setValue) {
            lengthOfWing = setValue / 2
        }
    }

    init() {
        lengthOfWing = 4
    }
}

let myDragon = Dragon()
myDragon.lengthOfWing
myDragon.spanOfWings = 16
myDragon.lengthOfWing

/*:

```
class Dragon {
    var lengthOfWing: Int
    var spanOfWings: Int {
        get {
            // This computed property is based on wingLength.
            return lengthOfWing * 2
        }
        set(setValue) {
            // Store the results of a computed property.
            lengthOfWing = setValue / 2
        }
    }
    init() {
        lengthOfWing = 0
    }
}

```


If a computed property’s setter does not provide a name for the new value, a default name of ``newValue`` is provided.


```
class Dragon {
    var lengthOfWing: Int
    var spanOfWings: Int {
        get {
            // This computed property is based on wingLength.
            return lengthOfWing * 2
        }
        set {
            // Store the results of a computed property.
            lengthOfWing = newValue / 2
            }
    }
    init() {
        lengthOfWing = 0
        }
    }
```
 
 
 ### instance methods
 
 * With properties out of the way let's discuss instance methods. There are two things here. An instance we have already discussed. An instance method, however, is something different. In previous lessons you may have worked on global functions, which are not defined on any specific type, and for this reason they are also called free functions. An instance method is a function that is associated with a particular type.
 

 * callout(free function):
    func shoutOut(shoutOut: String) -> String {
    }
 
 
*/

import UIKit

func shoutOut(shoutOut: String) -> String {
    
    let catchTheShoutOut = shoutOut
    if catchTheShoutOut == "Yes" {
        return "The world is awesome!"
        
    } else {
        return "Hey, no! Unless you say 'Yes' I ... "
    }
    
//    func printDescription(description: String) -> String {
//    
//        print( )
    
//    }
    
    
}



shoutOut(shoutOut: "Yes")



shoutOut(shoutOut: "I do not think so")


class Yelling {
 
    func shoutOut(shoutOut: String) -> String {
        
        let catchTheShoutOut = shoutOut
        if catchTheShoutOut == "Yes" {
            return "The world is awesome!"
            
        } else {
            return "Hey, no! Unless you say 'Yes' I ... "
        }
    }
    
    func aggressiveBellowing(bellow: String) -> Bool {
     
        let catchTheAggressiveBellowBe = bellow
        if catchTheAggressiveBellowBe == "Unkind words" {
            return true
        } else {
            return false
        }
        
    }
}


let screaming = Yelling()

screaming.shoutOut(shoutOut: "Yes")

shoutOut(shoutOut: "I am calling a function")

let growl = Yelling()

print(growl.aggressiveBellowing(bellow: "Unkind words"))



/*:
 
 * The function ``shoutOut(shoutOut: String)`` is not associated, however, with any type so it is not a method, let alone an instance method.
 
 
 * Methods declared in a class's body are though. Let's move ``shoutOut(shoutOut: String)`` into the body of a new class called ``Friend``.
 
*/

class Friend {

    
    func shoutOut(shoutOut: String) -> String {
        
        let catchTheShoutOut = shoutOut
        if catchTheShoutOut == "Yes" {
            return "The world is awesome!"
            
        } else {
            return "Hey, no! Unless you say 'Yes' I ... "
        }
    }
    
        init() {  }
}


// Create an instance of the class

let myFriend = Friend()

/*: 
 
 In order to call the function in the ``Friend`` class, we will create an instance. Through dox syntax an instance method is accessible. Accessing an instance's instance method through dox syntax is a call. We call methods __on__ an instance
 */

// Access an instance method of the class

myFriend.shoutOut(shoutOut: "What are you doing?")

let buddy = Friend()

// What is a function that you can transform into an instance method

/*:
 
 As we discussed earlier with the ``Dragon`` class, you may declare variables (i.e., ``var``) or constants (``let``) in a class's implementations. These properties may be used inside of the methods declared in your class. Let's add a few more properties to our ``Friend`` class but let's call that class ``Buddy`` to prevent any naming conflicts.
 
 */

class Buddy {
    
    init() { }
    
    var trustWorthy: Bool = true
    var lovable: Bool = true
    var gender: String = ""
    var nameOfBuddy: String = ""
    var homeTown: String = ""
    var lieblingsfach: String = "I ♡ Swift!"
    
    func shoutOut(shoutOut: String) -> String {
        
        let catchTheShoutOut = shoutOut
        if catchTheShoutOut == "Yes" {
            return "The world is awesome!"
            
        } else {
            return "Hey, no! Unless you say 'Yes' I ... "
        }
    }
    
    func descriptionOfMyBuddy() {
        print("My buddy's name is \(nameOfBuddy) and \(gender) is from \(homeTown) and \(lieblingsfach)")
    }
}

let eliot = Buddy()
eliot.gender = "he"
eliot.nameOfBuddy = "Eliot"
eliot.homeTown = "NYC"

eliot.descriptionOfMyBuddy()



class Cameleon {

    let scales: Int = 100
    var colorOfScales: UIColor = UIColor.clear
    
    func changingColors(colorBeforeChange: UIColor) -> UIColor {
        if colorOfScales != self.colorOfScales {
            colorOfScales = UIColor.red
            return colorOfScales
        } else {
         
            return colorOfScales
            
        }
    
    }
    
    init() {
        
    }
    
}

var bugaboo = Cameleon()
bugaboo.changingColors(colorBeforeChange: UIColor.blue)



/*:

 In conclusion we should make a note about types. What type is ``eliot``? In Swift there is a handy ``dynamicType`` or ``self`` to help us figure out what type a Swift declarations is.
*/

type(of: eliot)
eliot.self

/*:
 Our ``eliot`` is a ``Buddy`` type. Hence class instances are of a class type. Functions do not let you define a new type but classes do so they are much more flexible in their abilities than functions.
*/
// Which class would you like to create? A Coffee class whose instances like capuccino, mocha, or drip are of a Coffee type? Go ahead! I ♡ Swift!
/*:

 ## Closing 
 
 We covered classes & instances. How did we do?
 
 ### Class Discussion & Summative Assessment
 
 Earlier we said that by the end of this lesson, we should be able to:
 * Define what a class is and highlight its practical uses
 * Instantiate a new class in Swift
 * Demonstrate the use of an instance variable for a class
 * Describe some of the properties of classes
 Are we able?
 ### Takeaways 
 
 - What are classes? What are instances? 
 - What are instance methods?
 
 For more information on
 
 - [The Swift Programming Language.](http://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/)
 
 - [Declarations](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Declarations.html)
 
 - [Functions](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html)

 - [Classes](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html)
 
*/
