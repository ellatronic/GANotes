//
//  ShoppingCartSummaryViewController.swift
//  CloudyLove
//
//  Created by Ella on 4/10/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class ShoppingCartSummaryViewController: UIViewController {
    @IBOutlet weak var shoppingCartTableView: UITableView!
    // This label says "Total Price"
    @IBOutlet weak var totalLabel: UILabel!
    // This label will show the actual price
    // Default is 0.00
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var proceedToCheckoutButton: UIButton!

    var shoppingCartItems: [Product] = []

    var sum = Double();

    @IBAction func proceedToCheckoutPressed(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingCartItems += Product.readCart()
        giveMeTheTotalShoppingCartCost()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //        giveMeTheTotalShoppingCartCost()
        // TJs Work for total Price Label
        // totalPriceLabel
        // chase "shoppingCartItems"... which led to [Product]
        // so bustdown [Product] to take ".cost" out of the box ->
        // then, aggregate the cost
        // print (costOfAnIndividualItem)
        //totalPriceLabel.text = String(costOfAnIndividualItem)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Product.saveCart(shoppingCartItems)
    }

    func giveMeTheTotalShoppingCartCost() -> UILabel {
        for (_, cartItem) in shoppingCartItems.enumerated() {
            sum += cartItem.cost
        }
        print(sum)
        totalPriceLabel.text = String(sum)
        return totalPriceLabel
    }
}

extension ShoppingCartSummaryViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCartItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = shoppingCartTableView.dequeueReusableCell(withIdentifier: "ShoppingCartCell", for: indexPath) as? ShoppingCartTableViewCell else { return UITableViewCell() }

        let row = shoppingCartItems[indexPath.row]

        cell.shoppingCartProductName.text = row.name
        cell.shoppingCartSizeLabel.text = row.size
        cell.shoppingCartPriceLabel.text = String(row.cost)
        row.showImage(completion: { (image) in
            cell.shoppingCartImageView.image = image
        })

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // Swipe to delete
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            sum -= shoppingCartItems[indexPath.row].cost
            shoppingCartItems.remove(at: indexPath.row)
            totalPriceLabel.text = String(sum)
            tableView.reloadData()
        }
    }
}
