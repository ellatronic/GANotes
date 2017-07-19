//
//  ViewController.swift
//  IntermediateUILesson
//
//  Created by Ella on 3/16/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    @IBAction func triggerAlert(_ sender: UIButton) {

        // Set up the alert
        let alertController = UIAlertController(title: "Title", message: "Message goes here", preferredStyle: .alert)

        // Set up the buttons for the alert
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in

            self.performSegue(withIdentifier: "nextViewController", sender: self)

        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        // Present the alertController
        self.present(alertController, animated: true, completion: nil)

    }

    @IBAction func triggerActionSheet(_ sender: UIButton) {
        // Set up the action sheet
        let actionController = UIAlertController(title: "Title", message: "Message goes here", preferredStyle: .actionSheet)

        // Set up the buttons for the action sheet
        // .cancel separates the cancel button from the rest of the action sheet with a little space
        actionController.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        actionController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        // Present the actionController
        self.present(actionController, animated: true, completion: nil)
    }

    @IBAction func triggerAlert2(_ sender: UIButton) {
        let alertController2 = UIAlertController(title: "Title 2", message: "Change the label text to \"hi!\"", preferredStyle: .alert)

        // .destructive make a red cancel button on the right hand side
        // .destructive is displayed when the user is about to delete data
        alertController2.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in

            self.label.text = "hi!"
        }))
        alertController2.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))

        self.present(alertController2, animated: true, completion: nil)
    }

    @IBAction func triggerActionSheet2(_ sender: UIButton) {
        let actionController2 = UIAlertController(title: "Title 2", message: "The message goes here!", preferredStyle: .actionSheet)

        // Destructive makes the text of that action red
        actionController2.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        actionController2.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))

        self.present(actionController2, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

