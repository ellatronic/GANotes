//
//  ViewController.swift
//  iOSNetworking
//
//  Created by Ella on 3/9/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Instantiate an instance of UIImage
//        var imageView = UIImage()

        // Create a constant kURL for the URL
        let kURL = "https://pbs.twimg.com/media/Cnaf6jOWYAEvkWm.jpg"

        // Rename the URL with URL(string:)
        let imageURL = URL(string: kURL)!

        // Create a task (instance)
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if error != nil {
                print("There's an error")
            } else {
                let downloadImage = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.imageView.image = downloadImage!
                }
            }
        }

        task.resume()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

