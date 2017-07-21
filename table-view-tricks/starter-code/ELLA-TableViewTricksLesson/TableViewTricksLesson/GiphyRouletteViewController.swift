//
//  GiphyRouletteViewController.swift
//  TableViewTricksLesson
//
//  Created by Wellington Moreno on 9/13/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import UIKit

class GiphyRouletteViewController: UITableViewController {
  
  //This represents the total number of images that are loaded from giphy
  private var total = 10
  
  //These are the images that will be displayed in the Table View
  private var images: [GiphyImage] = []
  
  //The Main OperationQueue is where any UI changes or updates happen
  private let main = OperationQueue.main
  
  //The Async OperationQueue is where any background tasks such as
  //Loading from the network, and parsing JSON happen.
  //This makes sure the Main UI stays sharp, responsive, and smooth
  private let async: OperationQueue = {
    //The Queue is being created by this closure
    let operationQueue = OperationQueue()
    //This represents how many tasks can run at the same time, in this case 8 tasks
    //That means that we can load 8 images at a time
    operationQueue.maxConcurrentOperationCount = 8
    return operationQueue
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Registering custom cell with tableView
    tableView.register(UINib(nibName: "GiphyCustomCell", bundle: nil), forCellReuseIdentifier: "GiphyCustomCell")
    // Register custom HelloCell with tableView
    tableView.register(UINib(nibName: "HelloCell", bundle: nil), forCellReuseIdentifier: "HelloCell")
    
    //Reload as soon as the View Controller starts
    reload()
  }
  
  //This function loads new images and updates the view
  func reload() {
    
    //We want to begin this operation in the background
    //Because it can be very time consuming
    async.addOperation {
      
      //Any code running here is happening in the async thread
      
      //Load new images from Giphy
      let newImages = self.loadNewImages()
      //Set this View Controller's Images to the new images
      self.images = newImages
      
      //Now that we have the new images, let's update the table view
      //But in order to update any UI elements, we have to add the operation to
      //the main thread.
      //That is because any code that touches a UIView must be running on the main thread
      self.main.addOperation {
        self.tableView.reloadData()
      }
    }
  }
  
  private func loadNewImages() -> [GiphyImage] {
    
    var newImages: [GiphyImage] = []
    
    for _ in 1...total {
      
      //Try and load a new image, putting it into the array if successful
      if let newImage = loadNewImage() {
        newImages.append(newImage)
      }
    }
    
    return newImages
  }
  
  private func loadNewImage() -> GiphyImage? {
    
    //This takes url string calls the Giphy API.
    //When we call it, it will give us back JSON representing the image
    let urlString = Giphy.appendApiKey(toURL: Giphy.randomGiphyURL)
    //Convery the urlString into a real URL type
    guard let url = URL(string: urlString) else { return nil }
    
    //Do the rest of the opreations in a `do` block because some of the
    //operations may throw and error
    do {
      //Load the url into data
      let data = try Data(contentsOf: url, options: .alwaysMapped)
      
      //Turn that Data into a JSON object
      //Since we know the Giphy API will return an object, we expect an NSDictionary
      guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
        else { return nil }
      
      //The actual image information is in the `data` field, which is another object
      guard let giphyImage = json["data"] as? [String: Any]
        else {
          print("JSON missing 'data' object: \(json)")
          return nil
      }
      
      //Once we have the dictionary representing the Giphy Image,
      //We can create a Giphy Image from it
      return GiphyImage.from(giphyImage)
      
    }
    catch let ex { //This happens if something within the `do` block fails
      print("Failed to load Giphy at \(urlString): \(ex)")
      return nil
    }
  }
  
  private func loadImage(atURL url: URL) -> UIImage? {
    
    if let data = try? Data(contentsOf: url) {
      return UIImage(data: data)
    }
    
    return nil
  }
  
  //MARK: Table View Data Source methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return images.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    //First things first, deque a GiphyCell. This is what we will use to display our Giphy Images
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "GiphyCustomCell", for: indexPath) as? GiphyCustomCell else {
      return UITableViewCell()
    }

    guard let helloCell = tableView.dequeueReusableCell(withIdentifier: "HelloCell", for: indexPath) as? HelloCell else {
        return UITableViewCell()
    }

    // cell.backgroundColor
    // cell.contentView.backgroundColor
    
    //Determine what row we are in
    let row = indexPath.row

    //Get the image corresponding to that Row
    let giphy = images[row]
    
    //Let's set the cell's image to nil, that way it starts fresh,
    //in case there already was an image already set from a previous operation
    cell.giphyImageView.image = nil
    
    //Loading the image should happen on the async thread.
    //This is because loading the actual image takes time, especially
    //when you are loading 8 images at once.
    //So remember that this code runs 'later'. After this block is sent
    //to be executed, the program continues on and returns the cell
    async.addOperation {
      
      //Load the Giphy Image
      if let image = self.loadImage(atURL: giphy.imageURL) {
        
        //When we have the image, switch to the main thread
        //and set the cell's image
        self.main.addOperation {
          
          //Sometimes if the user scrolls too fast, the cell we were loading is no longer visible,
          //so it doesn't make sense to update it.
          //This checks to make sure the current IndexPath is still visible.
          if (tableView.indexPathsForVisibleRows?.contains(indexPath) ?? false) {
            cell.giphyImageView.image = image
          }
        }
      }
    }
    
    //This happens immediately after the operation above is sent to the async queue
    return cell
  }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let more = UITableViewRowAction(style: .normal, title: "more") { (action, indexPath) in
            print("Someone clicked more")
        }

        more.backgroundColor = .green

        let flag = UITableViewRowAction(style: .normal, title: "flag") { (action, indexPath) in
            print("Someone flagged the cell at \(indexPath)")
        }

        return [more, flag]
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row % 2 == 0
    }
  
}
