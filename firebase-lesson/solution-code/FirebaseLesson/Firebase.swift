//
//  Firebase.swift
//  FirebaseLesson
//
//  Created by Wellington Moreno on 9/21/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//
import Firebase
import FirebaseDatabase
import Foundation

class Firebase {
    
    fileprivate static let firebase = FIRDatabase.database().reference()
    fileprivate static let main = OperationQueue.main
    
    static func saveToFirebase(imagePost: ImagePost) {
        
        guard let json = imagePost.asJSON() else { return }
        
        let postId = imagePost.postID
        
        firebase.child("posts").child("images").child(postId).setValue(json)
    }
    
    static func saveToFirebase(textPost: TextPost) {
        
        guard let json = textPost.asJSON() else { return }
        let postId = textPost.postID
        
        firebase.child("posts").child("texts").child(postId).setValue(json)
    }
    
    static func loadTextPosts(onDone: @escaping ([TextPost]) -> (Void)) {
        
        firebase.child("posts").child("texts").observe(.value) { (snapshot: FIRDataSnapshot) -> (Void) in
            
            var posts: [TextPost] = []
            
            for json in snapshot.children {
                
                guard let subSnapshot = json as? FIRDataSnapshot
                else {
                    continue
                }
                
                guard let dictionary = subSnapshot.value as? NSDictionary
                else {
                    print("Expecting Dictionary, instead :\(subSnapshot.value)")
                    continue
                }
                
                guard let post = TextPost.fromJSON(json: dictionary) else { continue }
                
                posts.append(post)
                
            }
            
            
            main.addOperation {
                onDone(posts)
            }
        }
    }
    
    static func loadImagePosts(onDone: @escaping ([ImagePost]) -> (Void)) {
        
        firebase.child("posts").child("images").observe(.value) { (snapshot: FIRDataSnapshot) -> (Void) in
            
            var posts: [ImagePost] = []
            
            for childSnapshot in snapshot.children {
                
                guard let subObject = childSnapshot as? FIRDataSnapshot
                else {
                    continue
                }
                
                guard let object = subObject.value as? NSDictionary
                else {
                    continue
                }
                
                guard let post = ImagePost.fromJSON(json: object)
                else {
                    continue
                }
                
                posts.append(post)
            }
            
            
            //At the end, call the callback and pass the function
            //the Image Posts
            main.addOperation {
                onDone(posts)
            }

        }
    }
    
}
