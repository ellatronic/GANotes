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
    
    //WRITE THE FUNCTION THAT SAVES THIS IMAGE TO FIREBASE
    static func saveToFirebase(imagePost: ImagePost) {
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
                    print("Expecting Dictionary, instead :\(String(describing: subSnapshot.value))")
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
    
    //WRITE THE FUNCTION THAT LOADS ALL IMAGE POSTS FROM FIREBASE
    static func loadImagePosts(onDone: @escaping ([ImagePost]) -> (Void)) {
        
        firebase.child("posts").child("images").observe(.value) {
            (snapshot: FIRDataSnapshot) -> (Void) in

            var posts: [ImagePost] = []

            for childSnapshot in snapshot.children {
                guard let subObject = childSnapshot as? FIRDataSnapshot else { continue }
                guard let object = subObject.value as? NSDictionary else { continue }
                guard let post = ImagePost.fromJSON(json: object) else { continue }

                posts.append(post)
            }

            main.addOperation {
                onDone(posts)
            }
        }
        
    }
    
}
