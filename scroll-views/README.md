![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

ScrollView 
===============
---

Week 5 - Day 3 

By: Eric Giannini 

---


# CONNECTION TO LONG-TERM OBJECTIVE

ScrollView is one of the common solutions to problematic layouts. 

# LEARNING OBJECTIVES

* **Discuss** `ScrollView`

* **Implement** `ScrollView` programmatically

* **Implement** `ScrollView`in Interface Builder

## STUDENT PRE-WORK

Students should know:

* Xcode
* View Hierarchy
* Auto Layout 

# LESSON GUIDE

<table>
  <tr>
    <td>TIMING</td>
    <td>TYPE</td>
    <td>TOPIC</td>
  </tr>
  <tr>
    <td>10</td>
    <td>Opening</td>
    <td>What is ScrollView</td>
  </tr>
  <tr>
    <td>15</td>
    <td>Introduction </td>
    <td>ScrollView</td>
  </tr>
  <tr>
   	<td>15</td>
   	<td>Write - Pair - Share</td>
   	<td>Subclasses of UIScrollView</td>
  </tr>
  <tr>
    <td>10</td>
    <td>Independent Practice</td>
    <td>Programmatic</td>
  </tr>
    <tr>
    <td>15</td>
    <td>Pair Programming</td>
    <td>Interface Builder</td>
  </tr>
  <tr>
    <td>5</td>
    <td>Conclusion</td>
    <td>Key takeaways</td>
  </tr>
</table>


# OPENING (10 mins)
What is `ScrollView`? What is the problem? 

## PRACTICE PROBLEM

Imagine a problematic layout where `ScrollView` may solve the problem? 

---

## Definition 

- The `UIScrollView` class provides support for displaying content that is larger than the size of the application’s window. It enables users to scroll within that content by making swiping gestures, and to zoom in and back from portions of the content by making pinching gestures.

- `UIScrollView` is the superclass of several UIKit classes. 

- The central notion of a UIScrollView object (or, simply, a scroll view) is that it is a view whose origin is adjustable over the content view. It clips the content to its frame, which generally (but not necessarily) coincides with that of the application’s main window. A scroll view tracks the movements of fingers and adjusts the origin accordingly. The view that is showing its content “through” the scroll view draws that portion of itself based on the new origin, which is pinned to an offset in the content view. The scroll view itself does no drawing except for displaying vertical and horizontal scroll indicators. The scroll view must know the size of the content view so it knows when to stop scrolling; by default, it “bounces” back when scrolling exceeds the bounds of the content.
- The `UIScrollView` class can have a delegate that must adopt the `UIScrollViewDelegate` protocol. For zooming and panning to work, the delegate must implement both `viewForZooming(in:)` and `scrollViewDidEndZooming(_:with:atScale:)`; in addition, the maximum `(maximumZoomScale)` and minimum `( minimumZoomScale)` zoom scale must be different.
- `UIScrollView`'s property `contentSize` manages the size of the content view; content view is the view which is embedded into a `UIScrollView`. 


> Note: `UIScrollView` requires a user to thumb his or her way through a `View`; if the UX requires little to no effort, then a `ScrollView` may not be the best solution. 

# Write Pair Share - 2 mins
Which classes are subclasses of `UIScrollView`?
 

# INTRODUCTION: Scroll View

Scroll view can be added to a project in many ways, programmatically or through Interface Builder. 

Basically, you need to define both 1) the size and position of the scroll view’s frame within its superview, and 2) the size of the scroll view’s content area. 

All of these features can be set programmatically or using Auto Layout.

## Programmatically

1. Create a new single view Xcode project. 
2. Within the scope of `ViewController` create an instance of `UIImageView` called `imageView` with forced unwrapping. 
3. Create an instance of `UIScrollView` called `scrollView` with forced unwrapping. 
4. Drag & drop a large image into the `Assets.xcassets` folder.  
5. Inside of `ViewController`'s `viewDidLoad()` assign `imageView` to `UIImageView(image: UIImage(named:"nameOfImageInAssets.xcassets"))`.
6. Assign `scrollView` to the following value: `UIScrollView(frame: view.bounds)`
7. Assign `scrollView.backgroundColor` to `.black`
8. Assign `scrollView.contentSize` to `imageView.bounds.size`
9. Add the `imageView` as a `subView` of `scrollView` in the following way: `scrollView.addSubview(imageView)`
10. Add the `scrollView` as a `subView` of `view` in a similar manner: `view.addSubview(scrollView)`.

<b>Run the project!</b>

> Note: The value `view.bounds` sets `scrollView`'s frame's bounds to that of the `view` (i.e., the whole screen). The `contentSize` property on `UIScrollView` must be the size of the content that the `scrollView` displays. The view hierarchy is: `view`, `scrollView`, `imageView`. 



# INDEPENDENT PRACTICE (10 mins)

Create a `scrollView` programmatically in a new single view Xcode project. 

## PRACTICE PROBLEMS

* Create a scroll view programmatically with an instance of `UIImageView`.

* Build and run the program's layout.

* Open the app in different screen sizes (device or orientation).


## Interface Builder 


1. Add a scroll view to `ViewController`'s scene `Main.storyboard`.
2. Draw constraints to define the scroll view’s size and position, as usual, within the superview.
3. Add a `View` to the scroll view, setting the view.
4. Pin the content view’s top, bottom, leading, and trailing edges to the scroll view’s corresponding edges. The content view now defines the scroll view’s content area.
5. Lay out the scroll view’s content inside the content view. Use constraints to position the content inside the content view as normal.
6. Manipulate the layout in `freeform` by selecting that option on the `ViewController`'s scene, adjusting the freeform according to the constraints created by the content view. 


# PAIR-PROGRAMMING PRACTICE (15 mins)

Create a `scrollView` in Interface Builder in a new single view Xcode project. 

## PRACTICE PROBLEMS

* Create a scroll view through Interface Builder with an instance of `UIImageView`.

* Build and run the program's layout.

* Open the app in different screen sizes (device or orientation).

---

# CONCLUSION (5 mins)

## CHECK-FOR-UNDERSTANDING: WRITE-SHARE

*Write down what you think is the purpose of a scroll view is.*

## TAKEAWAYS

* Scroll views can be set programmatically or through interface builder. Either way:

* To **disable horizontal scrolling**, for instance, set the content view’s width equal to the scroll view’s width. The content view now fills the scroll view horizontally. 
* To **disable vertical scrolling**, set the content view’s height equal to the scroll view’s height. The content view now fills the scroll view horizontally.

* Scroll view is not a solution to all problematic layouts. 

## Further Reading 

- [Working With Scroll View](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithScrollViews.html)




