//
//  ViewController.swift
//  AnimationsLab
//
//  Created by Ella on 4/18/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit
import Spring

class ViewController: UIViewController {
    // Top Set
    @IBOutlet weak var square1: UIView!
    @IBOutlet weak var square2: UIView!
    @IBOutlet weak var square3: UIView!
    @IBOutlet weak var square4: UIView!
    @IBOutlet weak var button1: UIButton!

    // Bottom Set
    @IBOutlet weak var square5: SpringView!
    @IBOutlet weak var square6: SpringView!
    @IBOutlet weak var square7: SpringView!
    @IBOutlet weak var square8: SpringView!
    @IBOutlet weak var button2: UIButton!

    @IBAction func button1Pressed(_ sender: UIButton) {
        UIView.animateKeyframes(withDuration: 5.0, delay: 0.0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.75, animations: {
                self.square1.alpha = 1.0
            })

            UIView.addKeyframe(withRelativeStartTime: 0.10, relativeDuration: 0.75, animations: {
                self.square2.alpha = 1.0
            })

            UIView.addKeyframe(withRelativeStartTime: 0.20, relativeDuration: 0.75, animations: {
                self.square3.alpha = 1.0
            })

            UIView.addKeyframe(withRelativeStartTime: 0.30, relativeDuration: 0.75, animations: {
                self.square4.alpha = 1.0
            })

        }, completion: nil)

//        UIView.animate(withDuration: 5.0) {
//            self.square1.alpha = 1.0
//            self.square2.alpha = 1.0
//            self.square3.alpha = 1.0
//            self.square4.alpha = 1.0
//        }
    }

    @IBAction func button2Pressed(_ sender: UIButton) {
        square5.animate()
        square6.animate()
        square7.animate()
        square8.animate()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        square1.alpha = 0.0
        square2.alpha = 0.0
        square3.alpha = 0.0
        square4.alpha = 0.0
    }
    
    
}

