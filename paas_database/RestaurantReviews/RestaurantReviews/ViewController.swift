//
//  ViewController.swift
//  RestaurantReviews
//
//  Created by David A. Schrijn on 4/3/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    
    var ref: FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
         ref = FIRDatabase.database().reference()
    
        let address = self.ref.child("RestaurantReviews").child("restaurants").child("4545").child("location")
        address.ref.observe(.value, with: { (snapshot) in
            guard let string = snapshot.value as? String else {
                return
            }
            print(string + "Changed")
        })
        self.ref.child("RestaurantReviews").child("restaurants").child("4545").child("location").setValue("San Fran St")
        
        address.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let string = snapshot.value as? String else {
                return
            }
            print(string)
        })
        self.ref.child("RestaurantReviews").child("restaurants").child("4545").child("location").setValue("Minnesota")
        
            self.ref.child("RestaurantReviews").child("restaurants").child("4545").child("location").setValue("New Jersey")
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

