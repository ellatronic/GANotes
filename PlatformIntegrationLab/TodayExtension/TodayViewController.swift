//
//  TodayViewController.swift
//  TodayExtension
//
//  Created by Ella on 4/7/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(TodayViewController.notifyLabel), name: NotificationKey, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }

    func notifyLabel(notification: Notification) {
        guard let textInfo = notification.userInfo else { return }
        guard let color = userInfo["Color"] as? UIColor else { return }

    }
    
}