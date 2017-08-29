//
//  PostsViewController.swift
//  FirebaseLesson
//
//  Created by Wellington Moreno on 9/21/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation
import MobileCoreServices
import UIKit

class PostsViewController: UITableViewController {
    
    var posts: [Post] {
        var posts: [Post] = []
        
        imagePosts.forEach() { posts.append($0) }
        textPosts.forEach() { posts.append($0) }
        
        return posts
    }
    
    //This computed property scans through all the posts
    //and filters the ones that are image posts
    var imagePosts: [ImagePost] = []
    
    var textPosts: [TextPost] = []
    
    private var isReloading = false
    
    var emptyCell = UITableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reload()
    }
    
 
    func save() {
        
        for post in imagePosts {
            Firebase.saveToFirebase(imagePost: post)
        }
        
        for post in textPosts {
            Firebase.saveToFirebase(textPost: post)
        }
        
    }
    
    func reload() {
        
        
        //Make sure we are not already reloading
        guard !isReloading else { return }
        
        self.showIndicator()
        
        let firstSection = IndexSet(integer: 0)
        
        Firebase.loadTextPosts() { texts in
            self.textPosts = texts
            self.tableView.reloadSections(firstSection, with: .automatic)
        }
        
        Firebase.loadImagePosts() { images in
            self.imagePosts = images
            self.tableView.reloadSections(firstSection, with: .automatic)
            self.hideIndicator()
        }
    }

}

//MARK: Table View Data Source Methos
extension PostsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let post = posts[row]
        
        if let imagePost = post as? ImagePost {
            return createImageCell(tableView, forPost: imagePost, atIndexPath: indexPath)
        }
        else if let textPost = post as? TextPost {
            return createTextCell(tableView, forPost: textPost, atIndexPath: indexPath)
        }
        else {
            return emptyCell
        }
    }
    
    private func createImageCell(_ tableView: UITableView, forPost post: ImagePost, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImagePostCell", for: indexPath) as? ImagePostCell
        else {
            return emptyCell
        }
        
        cell.imagePostView.image = post.image
        
        return cell
    }
    
    private func createTextCell(_ tableView: UITableView, forPost post: TextPost, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextPostCell", for: indexPath) as?  TextPostCell
        else {
            return emptyCell
        }
        
        cell.textView.text = post.text
        
        
        return cell
    }
}


//MARK: Table View Delegate Methods
extension PostsViewController {
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}


//MARK: IB Actions
extension PostsViewController {
    
    @IBAction func onRefresh(_ sender: AnyObject) {
        self.reload()
    }
    
    @IBAction func onCamera(_ sender: AnyObject) {
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.mediaTypes = [kUTTypeImage as String]
        picker.delegate = self
        
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func onWrite(_ sender: AnyObject) {
        
        let title = "What's on your mind?"
        let message = ""
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addTextField() { textField in
            textField.autocorrectionType = .yes
            textField.spellCheckingType = .default
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let post = UIAlertAction(title: "Post", style: .default) { action in
            
            guard let text = alertController.textFields?[0].text else { return }
            
            let newPost = self.createTextPost(withText: text)
            self.textPosts.append(newPost)
            self.save()
            self.reload()
        }
        
        alertController.addAction(cancel)
        alertController.addAction(post)
        
        self.present(alertController, animated: true, completion: nil)
    }
}


//MARK: Creating Posts
fileprivate extension PostsViewController {
    
    func createPost() -> Post {
        
        let username = UIDevice.current.name
        let now = Date()
        
        let postId = String(Int(now.timeIntervalSince1970))
        
        return Post(timeOfPost: now, postID: postId, usernameOfPoster: username)
    }
    
    func createImagePost(withImage image: UIImage) -> ImagePost {
        
        let post = createPost()
        
        return ImagePost(timeOfPost: post.timeOfPost, postID: post.postID, usernameOfPoster: post.usernameOfPoster, image: image)
    }
    
    func createTextPost(withText text: String) -> TextPost {
        
        let post = createPost()
        
        return TextPost(timeOfPost: post.timeOfPost, postID: post.postID, usernameOfPoster: post.usernameOfPoster, text: text)
    }
}

//MARK: Camera Functionality
extension PostsViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //Defer is like, do this thing last, at the end of the function,
        //But do it no matter what happens below (return, exception, etc)
        defer {
            picker.dismiss(animated: true, completion: nil)
        }
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        else {
            return
        }
        
        let newImagePost = createImagePost(withImage: image)
        self.imagePosts.append(newImagePost)
        
        self.save()
        self.reload()
    }
}
