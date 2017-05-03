//
//  CustomerReviewTableViewCell.swift
//  CloudyLove
//
//  Created by David A. Schrijn on 4/13/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class CustomerReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var customerRatingLabel: UILabel!
    @IBOutlet weak var customerDescriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
