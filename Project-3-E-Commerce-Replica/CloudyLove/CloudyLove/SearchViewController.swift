//
//  SearchViewController.swift
//  CloudyLove
//
//  Created by Ella on 4/4/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // Set to data
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "SearchCategoryCell", for: indexPath)


        return cell
    }
}
