# How To: Custom Table Views 🏓🍽

## Custom Table View Cells

+ Use the same cell across different table views!!!!
+ Start by creating a new file for your custom cell
	+ Create a new file (command-N)
	+ Choose Cocoa Touch Class template
	+ Subclass of `UITableViewCell`
	+ PRESS the **Also create XIB file** button
	+ Create!
+ This creates two files. The first is your custom class for your UITableViewCell. The second is a view file for that cell. Notice how similar to the storyboard this view file is.
+ Add `UILabels`, `UIButtons`, etc. to your view in the .xib file
+ Connect those UI elements to your custom `UITableViewClass` using the Assistant Editor
+ Make sure to set a `reuseIdentifier`!!!
+ In your `UIViewController` have the `tableView` register this cell
+ The nib name is the file name

> Example: `tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")`
> Note: Generally, this code goes in `viewDidLoad()`

```
class ViewController: UIViewController, UITableViewDataSource {
	override func viewDidLoad() {
		super.viewDidLoad()
		// Registers the custom cell for that table view
		// This is required otherwise tableView.dequeueReusableCell will fail (return nil)
		tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
	}
}
```

+ Tada!🎉 Now you can use that custom cell just like any other table view cell

## Table View Row Actions

+ Implement the func `func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]?` in your `UIViewController`
	+ For each button you want to add create a new `UITableViewRowAction` variable
	+ 
	+ return an array of all the `UITableViewRowAction`s

```
func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
    let more = UITableViewRowAction(style: .normal, title: "More") { action, index in
        print("more button tapped")
    }
    more.backgroundColor = .lightGray

    let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { action, index in
        print("favorite button tapped")
    }
    favorite.backgroundColor = .orange

    let share = UITableViewRowAction(style: .normal, title: "Share") { action, index in
        print("share button tapped")
    }
    share.backgroundColor = .blue

    return [share, favorite, more]
}
```
[Source](http://stackoverflow.com/questions/32004557/swipe-able-table-view-cell-in-ios-9)

+ Implement `func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool`
	+ You can edit which cells the user is able to perform an action on. Or by having this function return `true`, the actions will be placed on every cell

```
func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
}
```

## Card View!!

+ View Hierarchy of a `UITableViewCell`
	+ View -> ContentView -> UIElements
+ A card view changes the view hieracrchy as such:
	+ CellView -> ContentView -> CardView -> UIElements
	+ The card view is slightly smaller than the ContentView and gives off the appearence of a card 

~~~swift
var whiteRoundedView = UIView()

override func setSelected(_ selected: Bool, animated: Bool) {
	super.setSelected(selected, animated: animated)
	addWhiteRoundedView(with: (10.0, 10.0))
}

func addWhiteRoundedView(with offset: (deltaY: CGFloat, deltaX: CGFloat)) {
    let width = (superview?.frame.width ?? 0.0) - (2 * offset.deltaX)
    let height = frame.height - (2 * offset.deltaY)
    whiteRoundedView.frame = CGRect(x: offset.deltaX, y: offset.deltaY, width: width, height: height)
    contentView.addSubview(whiteRoundedView)
    contentView.sendSubview(toBack: whiteRoundedView)
  }
~~~

