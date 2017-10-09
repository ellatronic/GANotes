//
//  ViewController.swift
//  CameraLesson
//
//  Created by Ella on 3/28/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo) { (authorized) in
            print("My camera is authorized: \(authorized)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true

        let alertController = UIAlertController(title: "Open Camera or Photos", message: "Would you like to open your camera or your photo library?", preferredStyle: UIAlertControllerStyle.alert)

        // Declare the alert buttons
        let photoLibraryAction = UIAlertAction(title: "Photos", style: .default) { (_) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }
        }

        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (_) in
            imagePicker.sourceType = .camera
            imagePicker.cameraCaptureMode = .photo

            self.present(imagePicker, animated:  true, completion: nil)
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            self.dismiss(animated: true, completion: nil)
        }

        alertController.addAction(photoLibraryAction)
        alertController.addAction(cameraAction)
        alertController.addAction(cancel)

        self.present(alertController, animated: true, completion: nil)
    }

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            print(image)
        }
    }
}
