//
//  ViewControllerTwo.swift
//  NotificationLesson
//
//  Created by Ella on 4/7/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit

let NotificationKey = Notification.Name("Notify")

class ViewControllerTwo: UIViewController {

    @IBAction func notify(_ sender: UIButton) {
        var userInfo: [String: Any] = [:]
        userInfo["Color"] = UIColor.cyan

        NotificationCenter.default.post(name: NotificationKey, object: nil, userInfo: userInfo)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
