//
//  PurchaseSummaryViewController.swift
//  CloudyLove
//
//  Created by Ella on 4/6/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class PurchaseSummaryViewController: UIViewController {
    @IBOutlet weak var purchaseTitleLabel: UILabel!
    @IBOutlet weak var purchaseTableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PurchaseSummaryViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // Change this to the appropriate array number
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = purchaseTableView.dequeueReusableCell(withIdentifier: "PurchaseSummaryCell", for: indexPath)

        return cell
    }
}
