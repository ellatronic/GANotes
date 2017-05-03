//
//  InitialSignInViewController.swift
//  CloudyLove
//
//  Created by Ella on 4/12/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class InitialSignInViewController: UIViewController {
    @IBOutlet var initialSignInBackgroundImage: UIImageView!
    @IBOutlet var initialSignInGradientImage: UIImageView!
    @IBOutlet weak var initialSignInBuyButton: UIButton!
    @IBOutlet weak var initialSignInSellButton: UIButton!
    @IBOutlet weak var initialSignInCloudLoveLabel: UILabel!
    @IBOutlet weak var initialSignInOrLabel: UILabel!

    // Unwind Segue
    @IBAction func unwindToInitialSignInViewController(segue:UIStoryboardSegue) { }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up UI
        // Buy button
        initialSignInBuyButton.layer.cornerRadius = 20
        initialSignInBuyButton.layer.borderWidth = 1

        // Sell button
        initialSignInSellButton.layer.cornerRadius = 20
        initialSignInSellButton.layer.borderWidth = 1
    }
}
