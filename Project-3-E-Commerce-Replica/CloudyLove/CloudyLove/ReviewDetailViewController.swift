//
//  ReviewDetailViewController.swift
//  CloudyLove
//
//  Created by Ella on 4/10/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class ReviewDetailViewController: UIViewController {

    var reviews: [Reviews] = []
    var product: [Product] = []
    var products: Product!
    var review: Reviews!
    var firebaseManager: FirebaseManager!

    @IBOutlet weak var reviewsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        reviewsTableView.dataSource = self
        reviewsTableView.delegate = self
        FirebaseManager.shared.downloadReviews { (reviews) in

            self.reviews = reviews.filter({ (review) -> Bool in
                if review.productID == self.products.productID {
                    return true
                } else {
                    return false
                }
            })

            DispatchQueue.main.async {
                self.reviewsTableView.reloadData()
            }
        }

    }
}

extension ReviewDetailViewController: UITableViewDelegate, UITableViewDataSource {

    //Mark: Table View for reviews

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return reviews.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as? CustomerReviewTableViewCell else { return UITableViewCell() }

        let review = reviews[indexPath.row]
        cell.customerRatingLabel.text = String(review.rating)
        cell.customerDescriptionLabel.text = review.review

        return cell
    }
}
