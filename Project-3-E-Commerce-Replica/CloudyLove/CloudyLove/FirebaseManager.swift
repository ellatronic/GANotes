//
//  FirebaseManager.swift
//  CloudyLove
//
//  Created by Theron Jones on 4/6/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI

class FirebaseManager {
    static let shared = FirebaseManager()

    var ref: FIRDatabaseReference!
    var storageRef: FIRStorageReference!

    private init() {
    }

    func downloadProducts (completion: @escaping ([Product]) -> Void) {
        ref.child("Products").child("0").child("allProducts").observeSingleEvent(of: .value, with: { (snapshot) in
            guard let json = snapshot.value as? [[AnyHashable: Any]] else { return }

            let products = json.flatMap(Product.create)
            completion(products)
        })
    }

    func downloadReviews (completion: @escaping ([Reviews]) -> Void) {
        ref.child("Products").child("1").child("allReviews").observeSingleEvent(of: .value, with: { (snapshot) in

            guard let json = snapshot.value as? [[AnyHashable: Any]] else { return }

            let reviews = json.flatMap(Reviews.create)
            completion(reviews)
        })

    }
}
