import UIKit

// 1. Collection types are arrays, sets, and dictionaries. So String is not a collection type.

// 2. Dictionary

// 3. Dictionary

// 4. Dictionary

// 5. Set

// 6. Array

// 7. Array

// 8. Array

// 9. Array 

// 10. Array 

// 11. array - mutable, set - immutable, dictionary - mutable

// 12. Array to Set
let array1 = [1, 2, 3, 4]
let set1 = Set(array1)
type(of: array1)
type(of: set1)

// 13. Set to Array
let someSet: Set = [1, 2, 3]
let array = Array(someSet)
type(of: someSet)
type(of: array)

// 14. Array to Dictionary

// 15. Dictionary to Array

var dict = ["hello": 1, "goobye": 2, "woot": 3]
var array2 = [String]()

for (key, value) in dict {
    array2.append("\(key) \(value)")
}
array2

// 16. Dictionary to Set
// Same as above but add:
let set16 = Set(array2)
type(of: set16)

// 17. Set to Dictionary

// 18. A subscript is a shortcut for accessing the members of a collection, list, or sequence. Ex: array [0]

// 19. Retrieve key/value
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["spider"]

// 20. Set key/value
numberOfLegs["dog"] = 4
numberOfLegs

// 21. Remove key/value
numberOfLegs.removeValue(forKey: "dog")
numberOfLegs

// 22. Retrieve element from array
var array22 = [1, 2, 3, 4, 5]
array22[0]

// 23. Set element in array
array22[0] = 6
array22

// 24. Remove element from array
array22.remove(at: 0)
array22

// 25. Loop through array, set, dictionary
let array25 = [1, 2, 3, 4, 5]
let set25: Set = [6, 7, 8, 9]

for i in 0..<array25.count {
    print(array25[i])
}

for item in set25 {
    print(set25)
}

for (key, value) in numberOfLegs {
    print("\(key), \(value)")
}

// 26. Return the square of each element in the array
for i in 0..<array25.count {
    print(array25[i] * array25[i])
}

// 27. Return the square of each element in the set
for item in set25 {
    print(item * item)
}

// 28. Reset the value of each key in a dictionary with its square
for (key, value) in numberOfLegs {
    print(numberOfLegs[key]! * 2)
}

// 29. Create an Array of Arrays with each of the subarrays containing 1, 2, 3
var array29 = [[1, 2, 3], [1, 2, 3]]

// 30. Append the square of each element of the subarrays as subarrays to the array
var array30 = [[Int]]()
var tempArray = [Int]()
var square = 0

for array in array29 {
    for number in array {
        square = number * number
        tempArray.append(square)
    }
    array30.append(tempArray)
    tempArray = []
}
print(array30)

// 31. Create a dictionary with keys with the values 1, 2, 3
var dict31 = [
    "a": 1,
    "b": 2,
    "c": 3
]

// 32. Set value of keys to their square
for (key, value) in dict31 {
//    key = value * value
    dict31[key] = value * value
}
print(dict31)

/* 33.
 Line 1 is iterating through a dictionary within an array.
 Line 2 is iterating through the key, value pairs of the dictionary.
 Line 3 is iterating though a dictionary within a second array.
 Line 4 is comparing the value of dictTwo[key] to the value of dictOne.
 Line 5 is prints "What is so great about these key value pairs? \(key):\(value)" if the if clause of Line 4 is true.
 The outermost curly brace corresponds with the topmost statement.
*/

/* 34.
 Iterate through a dictionary in array one.
 Iterate through a dictionary in array two.
 Check if dictOne is equal to dictTwo.
 Print "What did I find?" if condition in line 4 is met.
*/

/* 34.2
 Prints the largest number from interestingNumbers
*/
/* 35a. 3 times
   35b. 8 times
   35c. 
   35d. 
   35e. 25
   35f. kind is the key for interestingNumbers
   35g. numbers is the value for interestingNumbers
 */

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    print("hello")
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

// 36a. a is a while loop, b is a do-while loop. Do-while is executed atleast once.
var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

// 36b. They both print 128

// Optionals

// 1. An optional is a value that can either have some value or can be nil

// 2. 38a.b. true

// 1.
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
func greet() {
    guard let name = optionalName  else { return }
    greeting = "Hello, \(name)"
}

// 1. An object is an instance of a class/struct. A class is a reference type and a struct is a value type.

// 2. override

// 3. memberwise initializers are for structs if a custom initializer is not defined.

// 4. self refers to the class NamedShape

// 5. Because you are overriding the NamedShape initializer

// 6.

//class NamedShape {
//    var numberOfSides: Int = 0
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    func simpleDescription() -> String {
//        return "A shape with \(numberOfSides) sides."
//    }
//}
//
//class Circle: NamedShape {
//    var radius: Int
//    var name: String
//
//    override init(radius: Int, name: String) {
//        self.radius = radius
//        super.init(name: name)
//    }
//
//    func area() -> Double {
//        return 3.14 * radius * radius
//    }
//
//    func simpleDescription() -> String {
//        return "A circle"
//    }
//}

// 3. class passes by reference, struct by value.

class ListVC: UIViewController {

    viewDidLoad() {
        super.viewDidLoad()

    }

}

extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell") as? ListVCCell else { return UITableViewCell() }

        return cell
    }

}














