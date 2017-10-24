# How To: Data Persistence 

There are soooooo many ways to persist data on iOS Apps

+ Files
+ UserDefaults
+ CoreData
+ SQLite
+ NSCoding

## plist File (FileManager)

+ In the `struct` or `class` you want to save create two new methods
	+ `var plistDictionary: [AnyHashable: Any]`
		+ This is how we will save our data
	+ `init?(dictionary: [AnyHashable: Any])`
		+ This is how we will decode our data

Now, how do we implement these functions?

```
var plistDictionary: [AnyHashable: Any] {
	// Initialize an empty dictionary
	var dictionary: [String: Any] = [:]
	// Add the stuct/classes properties to the dictionary
	dictonary["title"] = title
	dictionary["description"] = description
	// Return the dictionary
	return dictionary
}
```
> This is essentially just making our class/struct into a json dictionary object

```
init?(dictionary: [AnyHashable: Any]) {
	guard let title = dictionary["title"] as? String else { return nil }
	guard let description = dictionary["description"] as? String else { return nil }
	self.init(title: title, description: description)
}
```
> Notice how similar these functions are to our JSON parsing functions!!

+ In your `UIViewController` or Manager class:
	+ Create a path to save the data at
	+ Create a function to write the data to that path
	+ Create a function to read the data at that path

That's a lot of functions!

Let's start with the first.

+ Create a path to save the data at:

```
lazy var pathToSaveData: URL = self.createURL(appending: "myPath.plist")

func createURL(appending pathComponent: String) -> URL {
	let fileURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
	guard let documentURL = fileURLs.first else { fatalError() }
	return documentURL.appendingPathComponent(pathComponent)
}
```

+ Create a function to write the data to that path

```
func saveItems(_ items: [Any], to url: URL) {
	if !items.isEmpty {
		(items as NSArray).write(to: url, attomically: true)
	}
}
```

+ Create a function to read the data at that path

```
func getSavedItems(for path: URL) -> [MyItem] {
    if let savedItems = NSArray(contentsOf: path) as? [[AnyHashable: Any]] {
      return savedItems.flatMap{ MyItem(dictionary: $0) } 
    } else {
      return []
    }
  }
```

## User Defaults

Generally, you'll only want to use User Defaults for settings or user preferences.

Thankfully, setting it up is supper simple.

+ To Write

`UserDefaults.standard.set(items, forKey: "items)"`

+ To Read

`let items = UserDefaults.standard.value(forKey: "items") as? [MyItem]`

> There are convenience methods for UserDefaults. Take Two minutes to find some and I'll add them here!

## NSCoding

Have your class conform to the `NSCoding` protocol!

> Your class also has to conform to `NSObject`

+ Implement the encoding and decoding functions
	+ func encode(with aCoder: NSCoder)
	+ init?(coder aDecoder: NSCoder)

	
+ Encode

```
func encode(with aCoder: NSCoder) {
	aCoder.encode(name, forKey: "name")
	aCoder.encode(description, forKey: "description")
}
```

+ Decode

```
init?(coder aDecoder: NSCoder) {
	guard let name = aDecoder.decodeObject(forKey: "name") as? String else { return nil }
	guard let description = aDecoder.decodeObject(forKey: "description") as? String else { return nil }
	
	self.init(name: name, description: description)
}
```

> As with UserDefaults, there are a bunch of convenience methods! Take a look and I'll write them down

+ Create a path to the saved data

```
// MARK: - Archiving Path
static let DocumentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
static let ArchiveURL = documentDirectory.appendingPathComponent("items")

```

Now we need functions to save and read our data!

+ Save

```
func save() {
	let isSuccessfulSave = NSKeyedArchiver.archivedRootObject(items, toFile: ViewController.ArchivePath.URL.path)
	if isSuccessfulSave {
		print("Successful save"
	} else {
		print("Failed")
	}
}
```
+ Read

```
func read() -> [MyItem]? {
	return NSKeyedUnarchiver.unarchiveObject(withFile: ViewController.ArchiveURL.URL.path) as? [MyItem]
}
```


## Core Data

To be continued...

## SQLite

[SQLite Tutorial Swift](https://www.raywenderlich.com/123579/sqlite-tutorial-swift)