//
//  ViewController.swift
//  DataPersistenceLesson
//
//  Created by Ella on 3/17/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var array: [Int]!
    

    override func viewDidLoad() {
        super.viewDidLoad()

//        let savedArray = Array(1...10)
//
//        if load() {
//            array = savedArray.reversed()
//        } else {
//            array = savedArray
//        }
//
//        save()

    }

//    // Save using UserDefaults
//    func save() {
//        UserDefaults.standard.set(true, forKey: "array")
//    }
//
//    // Load the data using UserDefaults
//    func load() -> Bool {
//        if let bool = UserDefaults.standard.value(forKey: "array") as? Bool {
//            return bool
//        } else {
//            return false
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = "\(array[indexPath.row])"
        return cell
    }
}
