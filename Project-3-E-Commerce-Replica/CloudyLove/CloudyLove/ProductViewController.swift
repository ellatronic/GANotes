//
//  ProductViewController.swift
//  CloudyLove
//
//  Created by Ella on 4/6/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    // MARK: TJ - 4/11/17 - References
    var product: [Product]!
    var myNewFavoriteProduct : Product!
    
    //to Product.swift
    var individualProduct: Product!
    
    // to FirebaseManager.swift for the download of products
    var firebaseManager: FirebaseManager!
    
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var productImage: UIImageView!

    // MARK: - Actions
    @IBAction func addToCartButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toAddToShoppingCart", sender: individualProduct)
    }
    
    @IBAction func addToFavorites(_ sender: UIButton) {
        var existingFavoriteProducts = Product.readFavorites()
        existingFavoriteProducts.append(individualProduct)
        Product.saveFavorites(existingFavoriteProducts)
    }
    @IBAction func segueToReviewsButton(_ sender: Any) {
         performSegue(withIdentifier: "toReviewDetails", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = individualProduct.name
        sizeLabel.text = individualProduct.size
        descriptionLabel.text = individualProduct.productDescription
        priceLabel.text = String(individualProduct.cost)
        individualProduct.showImage(completion: { (image) in
            self.productImage.image = image
        })
        
        self.product = Product.readFavorites()   
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toAddToShoppingCart"?:
            guard let shoppingCartViewController = segue.destination as? ShoppingCartSummaryViewController else { return }
            if let theProduct = sender as? Product {
                shoppingCartViewController.shoppingCartItems.append(theProduct)
            }
        case "toReviewDetails"?:
            let product = individualProduct

            let destinationVC = segue.destination as! ReviewDetailViewController
            destinationVC.products = product
            destinationVC.firebaseManager = firebaseManager
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
}
