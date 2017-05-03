//
//  TestingDownloadViewController.swift
//  CloudyLove
//
//  Created by Theron Jones on 4/7/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI

class TestingDownloadViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showImage()
    }
    
    func showImage () {
        FirebaseManager.shared.ref.child("products").child("Calvin Klein Jeans").child("imageURL").observeSingleEvent(of: FIRDataEventType.value, with: { (imageURLData) in
            if let imageURL = imageURLData.value as? String {
                
                FirebaseManager.shared.storageRef.storage.reference(forURL: "gs://cloudylove-d2961.appspot.com/" + imageURL).data(withMaxSize: INT64_MAX) { (imageData, error)
                    in
                    guard error == nil else {
                        print ("error downloading: \(error!)")
                        return
                    }
                    guard let imageData = imageData else { return }
                    if let image = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    }
                }
            }
        })
    }
}






