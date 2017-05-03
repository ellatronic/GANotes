//
//  VendorProfileViewController.swift
//  CloudyLove
//
//  Created by David A. Schrijn on 4/6/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class VendorProfileViewController: UIViewController {

    @IBAction func signOutButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toInitialSignInFromVendorSignOut", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
