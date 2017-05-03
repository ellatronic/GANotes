//
//  CustomerHomeViewController.swift
//  CloudyLove
//
//  Created by Ella on 4/4/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class CustomerHomeViewController: UIViewController {

    var products: [Product] = []
    var firebaseManager: FirebaseManager!

    // MARK: - Outlets
    @IBOutlet weak var customerHomeCollectionView: UICollectionView!

    // MARK: - Actions
    @IBAction func cartButtonPressed(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "toShoppingCart", sender: self)
    }
    @IBAction func unwindToCustomerHome(segue:UIStoryboardSegue) { }

    override func viewDidLoad() {
        super.viewDidLoad()
        customerHomeCollectionView.dataSource = self
        customerHomeCollectionView.delegate = self
        FirebaseManager.shared.downloadProducts { (products) in

            self.products = products

            DispatchQueue.main.async {
                self.customerHomeCollectionView.reloadData()
            }
        }
    }
}



// MARK: - Collection View Extension
extension CustomerHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Change this to the proper number
        // TJ: 4-10-17 - Added proper count via Product class (see productClass var above for trace)
        return products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = customerHomeCollectionView.dequeueReusableCell(withReuseIdentifier: "CustomerHomeCell", for: indexPath) as? CustomerHomeCollectionViewCell else { return UICollectionViewCell() }

        // Add cell implementation
        // TJ: 4-10-17 - Added photo from
        let product = products[indexPath.row]
        product.showImage { (image) in
            cell.collectionCellImage.image = image
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toProductView", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toProductView"?:
            if let selectedIndexPath = customerHomeCollectionView.indexPathsForSelectedItems?.first {

                let product = products[selectedIndexPath.row]

                let destinationVC = segue.destination as! ProductViewController
                destinationVC.individualProduct = product
                destinationVC.firebaseManager = firebaseManager
            }
        case "toShoppingCart"?:
            break
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
}

