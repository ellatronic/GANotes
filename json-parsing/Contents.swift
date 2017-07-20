//: Playground - noun: a place where people can play

import UIKit

/*:
 
 # JSON Serialization
 =======================
 
 Week V Day I
 
 By Eric Giannini
 
 ## Learning Objectives
 
 * **Articulate** how to use the Foundation framework’s JSONSerialization class
 
 * **Convert** convert JSON into Swift data types like Dictionary, Array, String, Number, and Bool
 
 * **Create** Model Objects from Values Extracted from JSON
 
 ## Connection to long term goal:
 
 Learn to use a built-in Foundation class to parse JSON, one of the most common data-exchange formats on the web.
 
 ## Student Prework
* JSON
* Swift types Dictionary, Array, String, Number, and Bool
* Optional Binding
* Downcasting

 ## Opening (2 1/2 - 5 Mins)
 
 What is Foundation framework's JSONSerialization class? What does it mean to serialize JSON? What does it mean to deserialize a JSON into a model object?
 
 ## Practice Problem

 Type in the code used to serialize JSON from the lab.
 
 */




 
 /*:
 
 What do we do with the data?
 
 ## DEFINITION
 
 The `JSONSerialization` class is used to to convert JSON to Foundation objects, vis-a-vis, convert Foundation objects to JSON.
 
 **Syntax**:
 
 `import Foundation`
 ```
 let data: Data // is data received network request
 let json = try? JSONSerialization.jsonObject(with: data, options: [])

 ```
 
 The JSONSerialization class exploits a method called `jsonObject(with:options:)` to return a value of type `Any` and throws an error if the data couldn’t be parsed, and `data(withJSONObject: options:)` to create a jsonObject.

 
 ## Introduction: JSONSerialization (10 mins)
 
- Swift’s built-in language features make it easy to safely extract and work with JSON data decoded with Foundation APIs — without the need for an external library or framework.
 
- Since we cannot be sure of the structure or values of JSON your app receives, deserialize model objects correctly is a challenge.
 
 ### Valid JSON objects
 
 You can use the following class functiont to determine whether a JSON object is valid.
 
  **Syntax**:
 
 ```
 isValidJSONObject(Any)
 ```

It returns a Boolean value that indicates whether a given object can be converted to JSON data.
 
 
 */

let jsonString = "{\"first_name\":\"Hal\",\"last_name\":\"9000\"}"
JSONSerialization.isValidJSONObject(jsonString)
print(type(of:jsonString))


 /*: 

 
 ### Creating JSON object ~ "READING"
 
 This class method returns a Foundation object from given JSON data.

 **Syntax**:
 
 `import Foundation`
 ```
  jsonObject(with: Data, options: JSONSerialization.ReadingOptions = [])
  ```
 
 ### Here is a breakdown of parameters:
 
 -  `data` : A data object containing JSON data.
 -  `opt` : Options for reading the JSON data and creating the Foundation objects. (i.e., `.mutableContainers`, `.mutableLeaves`, `.allowfragments`)
 -  `error` : If an internal error occurs, upon return contains an `NSError` object that describes the problem.
 

 
 ### Creating JSON Data ~ "WRITING"
 
 This class method returns JSON data from a Foundation object.
 
 **Syntax**:
 
 `import Foundation`
 ```
data(withJSONObject obj: Any, options opt: JSONSerialization.WritingOptions = []) throws -> Data
 
 ```
 ### Here is a breakdown of parameters:
 
 -  `obj` : The object from which to generate JSON data. Must not be nil.
 -  `opt` : (i.e., `.prettyPrinted`, which specifies that the JSON data should be generated with whitespace designed to make the output more readable. If this option is not set, the most compact possible JSON representation is generated.)
 -  `error` : If an internal error occurs, upon return contains an `NSError` object that describes the problem.
 
 
 */

// write code here

/*:
 
 # DEMO (15 mins)
 
 * Create a String in the form of JSON.
 
 * Serialize the string into a JSON
 
 * Extract the data from the JSON
 
 * Print the data
 
 ---
 
 ### Errors & (`.localizedDescription`)

 The JSONSerialization class method jsonObject(with:options:) returns a value of type Any and throws an error if the data couldn’t be parsed.
 
 You can use optional binding and the as? type cast operator in an if or guard statement to extract a value of known type as a constant.

 
 */


let string = "{\"names\": [\"Bob\", \"Tim\", \"Tina\"]}"

let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)!

do {
    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
    
    JSONSerialization.isValidJSONObject(json)
    print(type(of:json))
    
    
    if let names = json["names"] as? [String]
    {
        print(names)
    }
} catch let error as NSError {
    print("Failed to load: \(error.localizedDescription)")
}

/*:

## AnyObject

 - Parsing JSON: You have to cast an ojbect of Type `Any` (i.e., Swift) as an object of `Type` AnyObject (i.e., Foundation) before using subscript.
 

*/

let jsonStr = "{\"first_name\":\"Hal\",\"last_name\":\"9000\"}"

if let jsonData = jsonStr.data(using: String.Encoding.utf8) {
    do {
        let json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
        
        print(JSONSerialization.isValidJSONObject(json))
        print(type(of:json))
        
        if let first = (json as AnyObject)["first_name"] as? String {
            print(first)
        } else {
            print("Not found")
        }
    } catch {
        print("Something went wrong with the JSON parsing.")
    }
}


/*:

### What is the structure for extracting other Swift types?

 -  To get a Dictionary value from a JSON object type, conditionally cast it as [String: Any].

 - To get an Array value from a JSON array type, conditionally cast it as [Any] (or an array with a more specific element type, like [String]).

 -  You can extract a dictionary value by key or an array value by index using type cast optional binding with subscript accessors or pattern matching with enumeration.
 
*/


// Write code here


/*:
 
 # INDEPENDENT PRACTICE (10 mins)
 
 ## PRACTICE PROBLEMS
 
 Convert a JSON object into a string; serialize the string into a JSON object; extract data from the JSON object
 
```
{
 "aKey": 580681,
 "anotherKey": {
 "someNestedKey": true
    }
 }
 ```
 * Access individual value in dictionary (i.e., dictionary["someKey"] as? Int)
 
 * Access all key / value pairs in dictionary (i.e., `for` loop)
 
 * Access all nested dictionary values by key
 
 */

// Write code here

/*:
 
## Creating Model Objects from Values Extracted from JSON
 
 - Since most Swift apps follow the Model-View-Controller design pattern, it is often useful to convert JSON data to objects that are specific to your app’s domain in a model definition.
 
 - In this exmaple the model `struct` has been provided. Extract data from the .json file to populate an instance of the model. Print the model in the console.
 
*/

struct WeatherData {
    
    var date = Date()
    
    var tempMax = NSNumber(value: 0 as Int)
    var tempMin = NSNumber(value: 0 as Int)
    
    var weatherType = "N/A"
    
    var iconValue = ""
    
    var humidity = NSNumber(value: 0 as Int)
    var pressure = NSNumber(value: 0 as Int)
    
    var wind = NSNumber(value: 0 as Int)
}

// URL constants
let kServer: String = "http://api.openweathermap.org/"
let kAPIKey: String = "df46728b959f4137304a264c203bb963"

// lazy properties
var todaysInfo = WeatherData()
var forecastDataArray = [WeatherData]()


func fetchTodaysData() {
    
    // Set up the URL request
    let weatherEndpoint: String = kServer + "data/2.5/weather?q=Atlanta,ga&units=imperial&appid=" + kAPIKey
    
    guard let url = URL(string: weatherEndpoint) else {
        print("Error: cannot create URL")
        return
    }
    let urlRequest = URLRequest(url: url)
    
    // set up the session
    let config = URLSessionConfiguration.default
    
    let session = URLSession(configuration: config)
    
    // make the request
    let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
        // check for any errors
        guard error == nil else {
            print("error calling GET on /weathers/1")
            print(error as Any)
            return
        }
        // make sure we got data
        guard let responseData = data else {
            print("Error: did not receive data")
            return
        }
        
        // parse the result as JSON, since that's what the API provides
        do {
            guard let JSON = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] else {
                print("error trying to convert data to JSON")
                return
            }
            
            // now we have the weather, let's just print it to prove we can access it
            print("The weather is: \n" + JSON.description)
            
            print(todaysInfo)
            // let's extract the data into our instance of the model
            
        } catch  {
            print("error trying to convert data to JSON")
            return
        }
    })
    
    task.resume()
}

fetchTodaysData()


/*:
 
 
 # PAIR-PROGRAMMING PRACTICE (15 mins)
 
 ## PRACTICE PROBLEMS
 
 * Fetch the data
 
 * Serialize the JSON
 
 * Extract data into the model
 
 * Print the model
 
 */

// write code here

/*:

 # CONCLUSION (5 mins)
 
 ## CHECK-FOR-UNDERSTANDING: WRITE-SHARE
 
 *Write down what you think is the purpose of a JSONSerialization class is.*
 
 ## TAKEAWAYS
 
 *  Apple's `JSONSerialization` class is used to to convert JSON to Foundation objects, vis-a-vis, convert Foundation objects to JSON.
 *  Since we cannot be sure of the structure or values of JSON your app receives, deserialize model objects correctly is a challenge.
 *  Use `JSONSerialization.isValidJSONObject(Any)` to make sure an object
 
 *  Use optional binding and the as? type cast operator in an if or guard statement to extract a value of known type as a constant.

 
 ## Further Reading
 
 - [Apple'Documentation on AnyObject](https://developer.apple.com/reference/swift/anyobject)
 - [Apple's documentation on JSONObject](https://developer.apple.com/reference/foundation/jsonserialization/1415493-jsonobject)
 - [Apple's Swift Blog on JSONSerialization](https://developer.apple.com/swift/blog/?id=37)
 

 
 */


