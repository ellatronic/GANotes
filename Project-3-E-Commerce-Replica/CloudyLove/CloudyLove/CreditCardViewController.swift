//
//  CreditCardViewController.swift
//  CloudyLove
//
//  Created by Ella on 4/6/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class CreditCardViewController: UIViewController {
    
    @IBOutlet weak var creditCardTitleLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var monthYearLabel: UILabel!
    @IBOutlet weak var cvvLabel: UILabel!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var monthYearTextField: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
