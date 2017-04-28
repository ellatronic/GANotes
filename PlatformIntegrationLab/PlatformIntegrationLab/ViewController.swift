//
//  ViewController.swift
//  PlatformIntegrationLab
//
//  Created by Ella on 4/7/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit

let NotificationKey = Notification.Name("Notify")

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    var dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.timeStyle = .medium

        let timeString = "The time is: \(dateFormatter.string(from: NSDate() as Date))"
        timeLabel.text = timeString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func notify(_ sender: UIButton) {
        var userInfo: [String: Any] = [:]
        userInfo["text"] = textField.text
//        userInfo["Color"] = UIColor.cyan

        NotificationCenter.default.post(name: NotificationKey, object: nil, userInfo: userInfo)
        dismiss(animated: true, completion: nil)
    }


}

