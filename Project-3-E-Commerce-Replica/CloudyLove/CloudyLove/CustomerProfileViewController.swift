//
//  CustomerProfileViewController.swift
//  CloudyLove
//
//  Created by Ella on 4/4/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class CustomerProfileViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileEmailLabel: UILabel!
    @IBOutlet weak var profilePhoneNumberLabel: UILabel!
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var signOutButton: UIButton!

    var profileArray = ["ACCOUNT INFO", "SHIPPING PREFERENCES", "CREDIT CARD INFO", "PURCHASES"]

    // MARK: - Actions
    @IBAction func signOutButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toInitialSignInFromCustomerSignOut", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CustomerProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "AccountPreferencesCell", for: indexPath) as? CustomerAccountPreferencesTableViewCell
        cell?.accountPreferencesLabel.text = profileArray[indexPath.row]

        return cell!
    }
}
