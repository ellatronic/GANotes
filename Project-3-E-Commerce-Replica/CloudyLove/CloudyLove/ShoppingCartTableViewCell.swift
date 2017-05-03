//
//  ShoppingCartTableViewCell.swift
//  CloudyLove
//
//  Created by Ella on 4/11/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class ShoppingCartTableViewCell: UITableViewCell {
    @IBOutlet weak var shoppingCartImageView: UIImageView!
    @IBOutlet weak var shoppingCartProductName: UILabel!
    @IBOutlet weak var shoppingCartSizeLabel: UILabel!
    @IBOutlet weak var shoppingCartPriceLabel: UILabel!
    @IBOutlet weak var shoppingCartProductLabel: UILabel!
    @IBOutlet weak var shoppingCartUpdateButton: UIButton!

    @IBAction func updateShoppingCartButton(_ sender: UIButton) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
