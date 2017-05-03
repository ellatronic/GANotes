//
//  ShippingPreferencesViewController.swift
//  CloudyLove
//
//  Created by Ella on 4/6/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class ShippingPreferencesViewController: UIViewController {
    @IBOutlet weak var shippingPreferencesTitleLabel: UILabel!
    @IBOutlet weak var address1Label: UILabel!
    @IBOutlet weak var address2Label: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var address1TextField: UITextField!
    @IBOutlet weak var address2TextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
