//
//  CongratulationsViewController.swift
//  CloudyLove
//
//  Created by Ella on 4/10/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class CongratulationsViewController: UIViewController {
    @IBOutlet weak var congratulationsTitleLabel: UILabel!
    @IBOutlet weak var congratulationsMessageLabel: UILabel!
    @IBOutlet var backToHomeButton: UIButton!

    @IBAction func backToHomePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "unwindToCustomerHome", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
