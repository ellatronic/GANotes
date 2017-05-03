//
//  VendorHomeViewController.swift
//  CloudyLove
//
//  Created by David A. Schrijn on 4/6/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class VendorHomeViewController: UIViewController {

    var products: [Product] = []
    var firebaseManager: FirebaseManager!
    
    
    @IBOutlet weak var vendorHomeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendorHomeCollectionView.dataSource = self
        vendorHomeCollectionView.delegate = self
//        FirebaseManager.shared.downloadProducts { (products) in
//            
//            self.products = products
//            
//            DispatchQueue.main.async {
//                self.vendorHomeCollectionView.reloadData()
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        FirebaseManager.shared.downloadProducts { (products) in
            
            self.products = products
            
            DispatchQueue.main.async {
                self.vendorHomeCollectionView.reloadData()
            }
        }
    }
}

// MARK: - Collection View Extension
extension VendorHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VendorHomeCell", for: indexPath) as? VendorHomeCollectionViewCell else { return UICollectionViewCell() }
        
        
        let product = products[indexPath.row]
        product.showImage { (image) in
            cell.vendorHomeImageView.image = image
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toVendorProductView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toVendorProductView"?:
            if let selectedIndexPath = vendorHomeCollectionView.indexPathsForSelectedItems?.first {
                
                let product = products[selectedIndexPath.row]
                
                let destinationVC = segue.destination as! VendorDescriptionViewController
                destinationVC.individualProduct = product
                destinationVC.firebaseManager = firebaseManager
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
}
