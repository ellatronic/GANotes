//
//  PostNewItemViewController.swift
//
//
//  Created by Theron Jones on 4/5/17.
//
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI

class TestForImagesViewController: UIViewController, UINavigationControllerDelegate {
    
    // MARK: Properties
    
    let imageCache = NSCache<NSString, UIImage>()
    //var placeholderImage = UIImage(named: "ic_account_circle")
    var displayName = "TJ testing - Anonymous"
    
    
    // MARK: Outlets
    @IBOutlet weak var imageMessage: UIButton!
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet var dismissImageRecognizer: UITapGestureRecognizer!
    
    
    // MARK: Send Message
    
    func sendMessage(data: [String:String]) {
        // MARK: Step 4 - This is where we need to add the code to push the message to the database. It was empty before I added code here. To do this, we will use the database reference, "ref" that we used in earlier in previous STEPs. We are able to walk down the JSON using the "child" method. Here, we are specifing the node at the path "/messages". Recalling the example we saw earlier, we want to store each message as a child of messages using some kind of unique identifying string for each message. "childByAutoID" this function generates a unique key that is prefixed with a timestamp so that the resulting list of messages that we have will be chronologicalley stored. It ensures that that path is unique and that the datatbease will be able to distinguish between messages even if they contain the same text. And then once we have the path, we use the "setValue" function. I went a step further and added "mdata" to represent "data" already of the form [String : String] and added some code including "displayName" so that we show the actual text of the message and hte displayName of the person who sent it. The next step is going to modify the rules so we can write to the database. The message will not populate in the database (and obviously not move to the users) without allowing access to do this. We have to do this in firebase online in the "Database" tab on the left... We in this app set the read and write rules to "true" only to use for testing, but you should NEVER set the read and write rules to true for a production app because it makes it possible for a savvy user to read all of the data and erase all of the data
        // TODO: create method that pushes message to the firebase database
        var mdata = data
        mdata[Constants.ItemFields.name] = displayName
        FirebaseManager.shared.ref.child("users").childByAutoId().setValue(mdata)
    }

    // MARK: STEP 15 - Push photo to firebase database, doesn't show in app but will show in firebase
    func sendPhotoMessage(photoData: Data) {
        // TODO: create method that pushes message w/ photo to the firebase database
        // build a path using the user's ID and a timestamp
        let imagePath = "seller_item_photos/" + FIRAuth.auth()!.currentUser!.uid + "/\(Double(Date.timeIntervalSinceReferenceDate * 1000)).jpg"
        // set content type to "image/jpeg" in firebase storage meta data
        let metadata = FIRStorageMetadata()
        metadata.contentType = "image/jpeg"
        // create a child node at imagePath with photoData and metadata
        
        
        let product = ["Calvin Klein Jeans": ["imageURL": imagePath,
                                                "description": "Some cool jeans",
                                                "cost": 60,
                                                "size": 32]]
        print(FirebaseManager.shared.ref.child("Products").child("Calvin Klein Jeans"))
        FirebaseManager.shared.ref.child("products").updateChildValues(product)
        
        
        print(imagePath)
        FirebaseManager.shared.storageRef!.child(imagePath).put(photoData, metadata: metadata) { (metadata, error) in
            if let error = error {
                print ("error uploading: \(error)")
                return
            }
            // use SendMessage to add imageURL to database
            self.sendMessage(data: [Constants.ItemFields.imageUrl: FirebaseManager.shared.storageRef!.child((metadata?.path)!).description])
        }
    }

    // MARK: Actions
    
    @IBAction func didTapAddPhoto(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func dismissImageDisplay(_ sender: Any) {
        // if touch detected when image is displayed
        if imageDisplay.alpha == 1.0 {
            UIView.animate(withDuration: 0.25) {
//             self.backgroundBlur.effect = nil
                self.imageDisplay.alpha = 0.0
            }
            dismissImageRecognizer.isEnabled = false
  //          messageTextField.isEnabled = true
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension TestForImagesViewController: UIImagePickerControllerDelegate {
    
    // MARK: STEP 14 - setting up image picker
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String:Any]) {
        // constant to hold the information about the photo
        if let photo = info[UIImagePickerControllerOriginalImage] as? UIImage, let photoData = UIImageJPEGRepresentation(photo, 0.8) {
            // call function to upload photo message
            sendPhotoMessage(photoData: photoData)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}



