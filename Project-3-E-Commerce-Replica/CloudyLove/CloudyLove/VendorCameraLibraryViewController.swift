//
//  VendorCameraLibraryViewController.swift
//  CloudyLove
//
//  Created by David A. Schrijn on 4/13/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase
import FirebaseAuthUI
//import FirebaseStorageUI

class VendorCameraLibraryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Outlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var sizeTextField: UITextField!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var productTextField: UITextField!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var photoLibraryBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hides the Camera elements
        productImage.isHidden = true
        nameLabel.isHidden = true
        nameTextField.isHidden = true
        descriptionLabel.isHidden = true
        descriptionTextField.isHidden = true
        sizeLabel.isHidden = true
        sizeTextField.isHidden = true
        costLabel.isHidden = true
        costTextField.isHidden = true
        productLabel.isHidden = true
        productTextField.isHidden = true
        categoryLabel.isHidden = true
        categoryTextField.isHidden = true
        submitButton.isHidden = true
        
        // Manages keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(updateContraintsForKeyboardChange), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    //View will appear to refresh camera feature
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        if self.isBeingPresented || self.isMovingToParentViewController {
    //            useCamera()
    //        }
    //
    //    }
    
    func updateContraintsForKeyboardChange(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        
        guard let keyboardMinY = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.minY else { return }
        
        
        UIView.animate(withDuration: 0.33) {
            
            self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardMinY - 200, right: 0)
            
        }
        
    }
    
    //Mark: Camera & Photo Library
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage? {
            
            //Store images to vendor Firebase
            productImage.image = image
            
            productImage.isHidden = false
            nameLabel.isHidden = false
            nameTextField.isHidden = false
            descriptionLabel.isHidden = false
            descriptionTextField.isHidden = false
            sizeLabel.isHidden = false
            sizeTextField.isHidden = false
            costLabel.isHidden = false
            costTextField.isHidden = false
            productLabel.isHidden = false
            productTextField.isHidden = false
            categoryLabel.isHidden = false
            categoryTextField.isHidden = false
            submitButton.isHidden = false
            cameraBtn.isHidden = true
            photoLibraryBtn.isHidden = true
        }
    }
    
    @IBAction func cameraButton(_ sender: Any) {
        AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo) { (authorized) in
            
            if authorized {
                
                let imagePicker = UIImagePickerController() //Creating ImagePicker.
                imagePicker.delegate = self //Setting up the delegate.
                imagePicker.sourceType = .camera //Setting the source type.
                imagePicker.allowsEditing = true //Allowing to make edits.
                
                DispatchQueue.main.sync {
                    self.present(imagePicker, animated: true)
                }
            }
        }
    }
    
    @IBAction func photoLibraryButton(_ sender: Any) {
        AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo) { (authorized) in
            
            if authorized {
                let imagePicker = UIImagePickerController() //Creating ImagePicker.
                imagePicker.delegate = self //Setting up the delegate.
                imagePicker.sourceType = .photoLibrary //Setting the source type.
                imagePicker.allowsEditing = true //Allowing to make edits.
                
                DispatchQueue.main.sync {
                    self.present(imagePicker, animated: true)
                }
            }
        }
    }
    
    @IBAction func submitInfo(_ sender: Any) {
        
        let imagePath = "seller_item_photos/" + FIRAuth.auth()!.currentUser!.uid + "/\(Double(Date.timeIntervalSinceReferenceDate * 1000)).jpg"
        // set content type to "image/jpeg" in firebase storage meta data
        let metadata = FIRStorageMetadata()
        metadata.contentType = "image/jpeg"
        // create a child node at imagePath with photoData and metadata
        
        FirebaseManager.shared.ref.child("Products").child("0").child("allProducts").observeSingleEvent(of: .value, with: { (snapshot) in
            guard let count = (snapshot.value as? [Any])?.count else { return }
            
            let product = ["\(count)": ["category": self.categoryTextField.text!,
                                        "cost": Double(self.costTextField.text!)!,
                                        "description": self.descriptionTextField.text!,
                                        "imageURL": "\(imagePath)",
                "name": self.nameTextField.text!,
                "productID": self.productTextField.text!,
                "size": self.sizeTextField.text!]]
            
            FirebaseManager.shared.ref.child("Products").child("0").child("allProducts").updateChildValues(product)
            self.uploadImageToFirebase(imageURL: imagePath, metadata: metadata)
        })
    }
    
    
    func uploadImageToFirebase(imageURL: String, metadata: FIRStorageMetadata) {
        guard let image = productImage.image else { return }
        guard let photoData = UIImageJPEGRepresentation(image, 0.8) else { return }
        print(imageURL)
        FirebaseManager.shared.storageRef!.child(imageURL).put(photoData, metadata: metadata) { (metadata, error) in
            if let error = error {
                // Notification to let user know the upload failed
                let errorAlert = UIAlertController(title: "Error", message: "Image did not upload successful!", preferredStyle: UIAlertControllerStyle.alert)
                self.present(errorAlert, animated: true, completion: nil)
                print("error uploading: \(error)")
            } else {
                // Notification to let user know this was a success
                let successAlert = UIAlertController(title: "Success", message: "The image has been successful uploaded!", preferredStyle: UIAlertControllerStyle.alert)
                print("Success")
                self.present(successAlert, animated: true, completion: { _ in
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                        successAlert.dismiss(animated: true, completion: nil)
                    })
                })
                
                // Configure UI for success(clear textfields & segue to Home tab)
                self.tabBarController?.selectedIndex = 0
                //Clear textfields
                self.productImage.image = nil
                self.nameTextField.text = nil
                self.descriptionTextField.text = nil
                self.costTextField.text = nil
                self.sizeTextField.text = nil
                self.productTextField.text = nil
                self.categoryTextField.text = nil
                
                //Hides elements again
                self.productImage.isHidden = true
                self.nameLabel.isHidden = true
                self.nameTextField.isHidden = true
                self.descriptionLabel.isHidden = true
                self.descriptionTextField.isHidden = true
                self.sizeLabel.isHidden = true
                self.sizeTextField.isHidden = true
                self.costLabel.isHidden = true
                self.costTextField.isHidden = true
                self.productLabel.isHidden = true
                self.productTextField.isHidden = true
                self.categoryLabel.isHidden = true
                self.categoryTextField.isHidden = true
                self.submitButton.isHidden = true
                self.cameraBtn.isHidden = false
                self.photoLibraryBtn.isHidden = false
                
            }
            
            
        }
    }
    
    
}

extension VendorCameraLibraryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
