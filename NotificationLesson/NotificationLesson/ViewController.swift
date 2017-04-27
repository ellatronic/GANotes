//
//  ViewController.swift
//  NotificationLesson
//
//  Created by Ella on 4/7/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labels: [UILabel]!

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.notifyLabel), name: NotificationKey, object: nil)
    }

    func notifyLabel(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let color = userInfo["Color"] as? UIColor else { return }
        labels.forEach { (label) in
            label.text = "Richard"
            label.textColor = color
        }
    }
}

