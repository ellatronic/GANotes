//
//  VendorDescriptionViewController.swift
//  CloudyLove
//
//  Created by David A. Schrijn on 4/12/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class VendorDescriptionViewController: UIViewController {
    
    var product: [Product]! //Local Storage
    var individualProduct: Product! 
    var firebaseManager: FirebaseManager!
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productSizeLabel: UILabel!
    @IBOutlet weak var productCostLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    @IBAction func reviewsBtn(_ sender: Any) {
        performSegue(withIdentifier: "toVendorReviews", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toVendorReviews"?:
            
            let product = individualProduct
            
            let destinationVC = segue.destination as! VendorReviewsViewController
            destinationVC.products = product
            destinationVC.firebaseManager = firebaseManager
            
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productNameLabel.text = individualProduct.name
        productSizeLabel.text = individualProduct.size
        productDescriptionLabel.text = individualProduct.productDescription
        productCostLabel.text = String(individualProduct.cost)
        individualProduct.showImage { (image) in
            self.productImage.image = image
        }
        
        product = Product.readFavorites()
        
    }

}
