//
//  FavoritesViewController.swift
//  CloudyLove
//
//  Created by Ella on 4/4/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    var favoriteProducts = Product.readFavorites()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        favoriteProducts = Product.readFavorites()
        favoritesCollectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Collection View Extension
extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Change this to the proper number
        return (favoriteProducts.count)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoritesCollectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCollectionViewCell else { return UICollectionViewCell() }

        favoriteProducts[indexPath.row].showImage(completion: { (image) in
            cell.favoriteImage.image = image
        })

        return cell
    }
}
