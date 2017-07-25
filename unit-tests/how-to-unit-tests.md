# How To: Unit Testing 😲🎉💯

## Why should we Test?

+ Lets us known our code better
+ More confident in our code
+ Catch mistakes before they reach the user
+ If your code is hard to test, it's probably poorly designed

### Automated Test (Unit Testing)
+ Faster!
+ More precise

## What should we test?

+ Core functionality
	+ Model classes and methods
	+ Model interactions with Controllers 
+ Boundary conditions
+ Bug fixes
+ Common UI workflows

## Best Practices

+ Fast
+ Indpendent/Isolated
+ Repeatable
+ Self-validating
+ Timely

or **FIRST**! [Source](https://www.raywenderlich.com/150073/testing-xcode-ios-tutorial)

## XCTest

+ First, add a new testing framework to your project
	+ This is done automatically for you if you check the unit testing option when creating a new project	+ Otherwise press command-5 to open up the Test Navigator 
	+ Press the plus button in the lower left hand corner
	+ Click the New Unit Test Target option
+ You can now add testing files to your Unit Test Target! 
	+ Press add file
	+ Click new unit test case file
	+ Give your file a name
	+ Create!
+ In your test file add `@testable import MyApp` to the header. This imports all the code from your App to the Testing Bundle

	>  Note: `@testable import MyApp` needs to be added to the top of *each* test file you create
	
+ Create new testing methods
	+ Each method name should start with test. 

	> Example: `func testLabelsAreConnect()`
	
+ Testing should follow the given-when-then idea
	+ Given something...
	+ When something else happens...
	+ Then some condition should be `true`/`false`/`nil`/etc.
	
	> Note: Use comments to help separate the different parts of the test

```
func testSomethingAwesome() {
	// Given
	...
	// When
	...
	// Then
	XCTAssert(someCondition)
}	
```
	
+ In each testing method use `XCTAssert()` to determine whether your test passes
	+ Other XCT methods are:
		+ `XCTAssertEqual()`
		+ `XCTAssertFalse()`
		+ `XCTAssertNil()`
+ Run your unit tests using command-U

## Code Coverage

+ Open up your scheme using command-shift-<
+ Go to the testing action
+ Click gather coverage data checkbox
+ Run all your tests (command-U)
+ Open the Reports Navigator (command-8)
+ Select the coverage tab
+ Click the disclosure triangle to see the list of methods in each swift file
+ The blue bar shows how much of each function/file is tested!

		  