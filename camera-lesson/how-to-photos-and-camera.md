# How To: Camera & Photo Library 📱📸🤳

### Ask for Permission

You need to request permission to use the camera/photo library in iOS!

+ Add the library AVFoundation to your project
	+ Target->LinkedFrameworks and Libraries -> Plus Button 
+ Request access using the following:

```
AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo) { (authorized) in
      
}
```

+ Add the key `Privacy - Camera Usage Description` key on your `Info.plist`


### What do you want to use?

+ Camera
+ Photo Library
+ Both?

### UIImagePickerController

+ Initialize a new UIImagePickerController
`let imagePicker = UIImagePickerController()`
+ Set up the delegate of the image picker
`imagePicker.delegate = self`

> Make you `UIViewController` conform to `UIImagePickerControllerDelegate` & `UINavigationControllerDelegate`

+ Set the source type
`imagePicker.sourceType = .camera`
+ allow editing?
`imagePicker.allowsEdits = true`
+ present the image
`present(imagePicker, animated: true)`

+ To get the picked image implement `func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])`

```
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    dismiss(animated: true, completion: nil)
    if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
      print(image)
      // Do work with the image
    }
  }
```
