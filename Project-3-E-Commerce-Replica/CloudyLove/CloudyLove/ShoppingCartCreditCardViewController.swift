//
//  ShoppingCartCreditCardViewController.swift
//  CloudyLove
//
//  Created by Ella on 4/10/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class ShoppingCartCreditCardViewController: UIViewController {
    @IBOutlet weak var shopCartCreditCardTitleLabel: UILabel!
    @IBOutlet weak var shopCartCreditCardNumberLabel: UILabel!
    @IBOutlet weak var shopCartCreditCardMMYYLabel: UILabel!
    @IBOutlet weak var shopCartCVVLabel: UILabel!
    @IBOutlet weak var shopCartCreditCardNumberTextField: UITextField!
    @IBOutlet weak var shopCartCreditCardMMYYTextField: UITextField!
    @IBOutlet weak var shopCartCVVTextField: UITextField!
    @IBOutlet weak var completeOrderButton: UIButton!

    @IBAction func completeOrderButtonPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
