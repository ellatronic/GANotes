//
//  ShoppingCartShippingAddressViewController.swift
//  CloudyLove
//
//  Created by Ella on 4/10/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class ShoppingCartShippingAddressViewController: UIViewController {
    @IBOutlet weak var shopCartTitleLabel: UILabel!
    @IBOutlet weak var shopCartAddress1Label: UILabel!
    @IBOutlet weak var shopCartAddress2Label: UILabel!
    @IBOutlet weak var shopCartCityLabel: UILabel!
    @IBOutlet weak var shopCartStateLabel: UILabel!
    @IBOutlet weak var shopZipCodeLabel: UILabel!
    @IBOutlet weak var shopCartAddress1TextField: UITextField!
    @IBOutlet weak var shopCartAddress2TextField: UITextField!
    @IBOutlet weak var shopCartCityTextField: UITextField!
    @IBOutlet weak var shopCartStateTextField: UITextField!
    @IBOutlet weak var shopCartZipCodeTextField: UITextField!
    @IBOutlet weak var shippingAddressContinueButton: UIButton!

    @IBAction func shippingAddressContinueButtonPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
