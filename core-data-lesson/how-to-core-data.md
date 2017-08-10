# How To: Core Data 🙌😁



## Managed Object Model

This describes the way Core Data is modeled on the disk

+ Create a new project, and check the Core Data option! 
+ Check out the data model file that was created automatically for you
	+ `APP_NAME.xcdatamodeld`
+ Now for some vocabulary:
	+ **Entity**: This is a class definition in Core Data
	+ **Attribute**: Some information attached to a particular Entity
	+ **Relationship**: This is a link between multiple entities 
+ **To Add an Entity**:
	+ Click the add Entity button
	+ Add the attributes/relationships necessary for that given entity

## Appendix

### Flow

![](https://cocoacasts.s3.amazonaws.com/exploring-the-core-data-stack/figure-core-data-stack-1.jpg)

[Source](https://cocoacasts.com/exploring-the-core-data-stack/)

### NSManagedObjectModel

The actual data model for your application. This model is represented by the `.xcdatamodeld` file.

### NSManagedObjectContext

You need this class before you save or retrieve data from Core Data. It's a workpad that will work with the Core Data Object and creates, reads, updates, and deletes model objects.

### NSPersistentContainer

Keeps a reference to the NSManagedObjectModel. Initialized automatically when you check the Core Data option when creating a new project. This class will have a property that is the default `NSManagedObjectContext`.

### NSManagedObject

This is the actual object that you store in Core Data. This refers to your Entity object that you created earlier.

### NSFetchRequest

Responsible for fetching data from Core Data. Fetch Requests are very powerful. You can use them to filter entities by attributes or criteria!

## Resources

+ [Getting Started Core Data Tutorial](https://www.raywenderlich.com/145809/getting-started-core-data-tutorial)
+ [Reading and Updating Managed Objects With Core Data](https://cocoacasts.com/reading-and-updating-managed-objects-with-core-data/)
+ [Working With Managed Objects In Core Data](https://cocoacasts.com/working-with-managed-objects-in-core-data/)
+ [Beginner’s Guide to Core Data in Swift 3](https://blog.bobthedeveloper.io/beginners-guide-to-core-data-in-swift-3-85292ef4edd)
+ [Apple's Core Data Programming Guide](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreData/index.html#//apple_ref/doc/uid/TP40001075-CH2-SW1)