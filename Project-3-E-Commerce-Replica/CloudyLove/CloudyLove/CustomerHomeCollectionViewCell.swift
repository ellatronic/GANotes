//
//  CustomerHomeCollectionViewCell.swift
//  CloudyLove
//
//  Created by Ella on 4/4/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class CustomerHomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var collectionCellImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        collectionCellImage.image = nil
    }
}
