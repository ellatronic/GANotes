
# Initial Control on Swift 3.0


Week VII Day I

We are at the halfway point in the iOS bootcamp. If we are struggling with any of these fundamental aspects of Swift 3.0, then we need to address these issues immediately. 

Please format your responses to each question in a filed entitled `Control.playground` with formatting for section, section title, description, & question numbers. Answers for each question should be formatted in the following way: `### Number. \#`. `Control.playground` should build & run without errors.   

1. Swift’s String type houses an `Index` as an associated type, properties for a `startIndex` and `endIndex`, a `subscript` that takes the index to fetch a specific character and an `index(after:)` method that traverses an index by one.These are the criteria for implementing the protocol for `CollectionType`. Does String conform to the `CollectionType` protocol? 

2. The method `updateValue(<value: Array<Int>, forKey: String)` is for which type of CollectionType? 

3. The method `removeValue(forKey: String)` is for which type of CollectionType? 

4. The method `index(forKey: String)` is for which CollectionType? 

5. The method `insert(newMember: Int)` is for which type of CollectionType? 

6. The method `remove(member: Int)` is for which type of CollectionType? 

7. The method `contains(member: Int)` is for which type of CollectionType?

8. The methods `dropFirst()` & `dropLast()`, `popFirst()`, `popLast()` are for which type of CollectionType?

9. The method `append(newElement: Element)` is for which type of CollectionType? 

10. The method `remove(at: <#T##Int#>)` is for which type of CollectionType? 

11. What is an instance of Array, Set, or Dictionary? Mutable / Immutable?
12. Convert an Array into a Set
13. Convert a Set into an Array
14. Convert an Array into a Dictionary
15. Convert a Dictionary into an Array
16. Convert a Dictionary into a Set
17. Convert a Set into a Dictionary

18. What is a `subscript`? 
19. Retrieve the value for a key in a dictionary through subscript. 
20. Set the value for a key in a dictionary through subscript. 
21. Subscript the removal of a key value pair in a dictionary
22. Retrieve an element through subscript in an array
23. Set an element through subscript in an array
24. Subscript the removal of an element in any array

25. Loop through an Array, a Set, & a Dictionary
26. Return the square of each element in an Array
27. Return the square of each element in a Set
28. Reset the value of each key in a dictionary with its square 
29. Create an Array of Arrays with each of the subarrays containing 1, 2, 3
30. Append the square of each element of the subarrays as subarrays to the array. 
31. Create a dictionary with three keys such that the value for each key is a series of 1, 2, 3
32. Reset the values for each of those keys to the square of each element in the series.
33. Explain the following code: 

```
// What is line one doing?
for dictOne in arrayOne {

	// What is line two doing?
    for (key, value) in dictOne {
    
    	// What is line three doing?
        for dictTwo in arrayTwo {
        
        	// What is line four doing?
            if dictTwo[key] == value {
            
            	// What is line five doing? 
                print(" What is so great about these key value pairs? \(key):\(value)")
            } // to which curly brace? 
        } // to which curly brace? 
    } // to which curly brace? 
} // to which curly brace? 
```

34. Explain the following code: 

```
// What is line one doing?
for dictOne in arrayOne {
	
	// What is line two doing?
    for dictTwo in arrayTwo {
    
    	// What is line three doing?
        if dictOne == dictTwo {
        	
        	// What is line four doing?
            print("What did I find?")
        }
    }
}
```

35. Examine the following code: 

```
“let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)
```

Answer the following questions: 

35.(a) How many times does the initial `for`-`in` loop run? 

35.(b) How many times does the final `for`-`in` loop run? 

35.(c) Write out the type of the Dictionary `interestingNumbers` in non literal format.  

35.(d) Write out the type of the Dictionary `interestingNumbers` in literal format. 

35.(e) What is the result of `print(largest)`?

35.(f) What is the term corresponding to `kind` in a Swift `Dictionary` type? 

35.(g) What is the term corresponding to `numbers` in Swift `Dictionary` type? 

36.(a) What is the syntactical difference in *a* & *b*?  
36.(b) Do these loops return the identical values? 

Here is `while` loop *a*:

```
var n = 2
while n < 100 {
    n = n * 2
}
print(n)
```
Here is `while` loop *b*:

``` 
var m = 2
do {
    m = m * 2
} while m < 100
print(m)
```

## Optionals 
37. What is an optional? 

38. Examine the following block of code: 

```
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

```

38.(a) Is it true that: “If the optional value is nil, the conditional is false and the code in braces is skipped." 
2.(b) Is it true that: "Otherwise, the optional value is unwrapped and assigned to the constant after let, which makes the unwrapped value available inside the block of code."

39. Refactor the code from 38 with two different types of `guard` statements. 

## Class & Struct

40. What is an instance of a `class` or a `struct`? How is the instance different from the class or struct? 

41. With which keyword does a subclass override a superclass’s methods?

42. Does either a `struct` or a `class` have a memberwise initializer? 

43. To what does `self` in the `class` `NamedShape`'s initializer refer?  

``` 

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
```

44. Compare the subclass `Square` to the superclass `NamedShape`. 

``` 
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() ->  Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()”

``` 
45. Why do you include `super.init(name: name)` in `init(sideLength: Double, name: String)`? 

46. Make another subclass of `NamedShape` called `Circle` that takes a `radius` and a `name` as arguments to its `initializer`. Implement an `area()` and a `simpleDescription()` method on the `Circle` class.

47. What is the primary difference between a `class` and a `struct`? If you were to complete the following sentence, which words would you use: While a `class` is pass by _____, a `struct` is pass by _____.


## iOS 

48. Imagine a subclass of `UIViewController` called `ListVC` is the controller for an instance of `UITableView` called `tableView`. Program the adoption of the protocols necessary for conforming `ListVC` to the requirements of its instance of `tableView` in two separate `extension`s. 

> Note: The resuse identifier is `reusableCell`. 


```
class ListVC: UIViewController {

	viewDidLoad() {
	
	
	}

}

extension ListVC: {


}
```

49. Imagine a subclass of `UITableViewCell` called `ListVCCell`. Program the function `cellForRowAt` to return an instance of `ListVCCell`. 

```
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell")
        
        return cell!
    } 
```  