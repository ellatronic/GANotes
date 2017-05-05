//
//  ImagesViewController.swift
//  SizeClassesLesson
//
//  Created by Wellington Moreno on 9/8/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation
import UIKit

class ImagesViewController: UITableViewController {
    
    private let images = [
        #imageLiteral(resourceName: "Image-1"),
        #imageLiteral(resourceName: "Image-2"),
        #imageLiteral(resourceName: "Image-3"),
        #imageLiteral(resourceName: "Image-4")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("I'm ready")
        
    }
    
    //MARK: Table View Data Source Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: Number of Rows in the Table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    //MARK: Cell Creation method
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        //Pull the image from the array for the current row
        let image = images[row]
        
        //Deque the ImageCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as? ImageCell
        else {
            return UITableViewCell()
        }
        
        //Set the cells image to the appropriate image
        cell.photoView.image = image
        
        return cell
    }
    
}
