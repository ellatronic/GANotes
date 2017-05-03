//
//  VendorReviewsTableViewCell.swift
//  CloudyLove
//
//  Created by David A. Schrijn on 4/13/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class VendorReviewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
