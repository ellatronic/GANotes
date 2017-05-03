//
//  VendorHomeCollectionViewCell.swift
//  CloudyLove
//
//  Created by Ella on 4/11/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class VendorHomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var vendorHomeImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        vendorHomeImageView.image = nil
    }
}
