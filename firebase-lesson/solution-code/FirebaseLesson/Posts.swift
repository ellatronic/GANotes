//
//  Posts.swift
//  FirebaseLesson
//
//  Created by Wellington Moreno on 9/21/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation
import UIKit

class Post {
   
    let timeOfPost: Date
    let postID: String
    let usernameOfPoster: String
    
    init(timeOfPost: Date, postID: String, usernameOfPoster: String) {
        self.timeOfPost = timeOfPost
        self.postID = postID
        self.usernameOfPoster = usernameOfPoster
    }
    
    func asJSON() -> NSDictionary? {
        
        //A [String: Any} Dictionary type is the same as an NSDictionary.
        var dictionary = [String: Any]()
        
        dictionary[Keys.postID] = self.postID
        let timeOfPostEpochTime = self.timeOfPost.timeIntervalSince1970
        dictionary[Keys.timeOfPost] = timeOfPostEpochTime
        dictionary[Keys.usernameOfPoster] = self.usernameOfPoster
        
        return dictionary as NSDictionary
    }
    
    class func fromJSON(json: Any) -> Post? {
        
        //We definitely expect a Dictionary
        guard let dictionary = json as? [String: Any]
            else {
                print("Expecting a Dictionary, instead: \(json)")
                return nil
        }
        
        guard let postID = dictionary[Keys.postID] as? String,
            let timeOfPostEpochTime = dictionary[Keys.timeOfPost] as? TimeInterval,
            let usernameOfPoster = dictionary[Keys.usernameOfPoster] as? String
            else {
                print("Keys missing in dictionary: \(dictionary)")
                return nil
        }
        
        let timeOfPost = Date(timeIntervalSince1970: timeOfPostEpochTime)
        
        return Post(timeOfPost: timeOfPost, postID: postID, usernameOfPoster: usernameOfPoster)
    }

    
}

class TextPost: Post {
   
    let text: String
    
    init(timeOfPost: Date, postID: String, usernameOfPoster: String, text: String) {
        self.text = text
        super.init(timeOfPost: timeOfPost, postID: postID, usernameOfPoster: usernameOfPoster)
    }
    
    override func asJSON() -> NSDictionary? {
        
        //`super` is a keyword that references the parent class
        //of the class we are in right now.
        //The super of an ImagePost is a Post, since an ImagePost
        //extends a Post
        guard var json = super.asJSON() as? [String: Any]
        else {
            return nil
        }
        
        json[Keys.text] = self.text
        
        return json as NSDictionary?
    }
    
     override class func fromJSON(json: Any) -> TextPost? {
        
        //We definitely expect a Dictionary
        guard let dictionary = json as? [String: Any]
        else {
            print("Expecting a Dictionary, instead: \(json)")
            return nil
        }
        
        guard let originalPost = Post.fromJSON(json: json)
        else {
            return nil
        }
        
        //Pull our the text from the dictionary
        //If that value is nil, use the empty string on the right
        //This ensures that `text` will always have a value.
        let text = (dictionary[Keys.text] as? String) ?? ""
        
        return TextPost(timeOfPost: originalPost.timeOfPost, postID: originalPost.postID, usernameOfPoster: originalPost.usernameOfPoster, text: text)
    }
    
    
}

class ImagePost: Post {
    
    let image: UIImage
    
    init(timeOfPost: Date, postID: String, usernameOfPoster: String, image: UIImage) {
        self.image = image
        super.init(timeOfPost: timeOfPost, postID: postID, usernameOfPoster: usernameOfPoster)
    }
    
    override func asJSON() -> NSDictionary? {
        //`super` is a keyword that references the parent class
        //of the class we are in right now.
        //The super of an ImagePost is a Post, since an ImagePost
        //extends a Post
        guard var json = super.asJSON() as? [String: Any]
        else {
            return nil
        }
        
        //Let's take that JSON and add the image to it
        
        do {
            let imageAsString = try ImagePost.toString(image: self.image)
            json[Keys.image] = imageAsString
            print("Saving image with \(imageAsString.characters.count) bytes")
        }
        catch {
            print("Failed to convert image to Base64: \(error)")
            return nil
        }
        
        return json as NSDictionary
    }

    override class func fromJSON(json: Any) -> ImagePost? {
        
        guard let dictionary = json as? [String: Any]
        else {
            print("Expecting Dictionary, instead, \(json)")
            return nil
        }
        
        //Let's use the original function to get a regular post
        //and pull our the data from there, instead of re-writing 
        //all of the logic again
        
        guard let regularPost = Post.fromJSON(json: dictionary)
        else {
            return nil
        }
        
        guard let imageAsString = dictionary[Keys.image] as? String
        else {
            print("JSON missing image data: \(dictionary)")
            return nil
        }
        
        let image: UIImage
        
        do {
            image = try ImagePost.fromString(base64String: imageAsString)
        }
        catch {
            print("Failed to convert Image String to Image: \(error)")
            return nil
        }
        
        return ImagePost(timeOfPost: regularPost.timeOfPost, postID: regularPost.postID, usernameOfPoster: regularPost.usernameOfPoster, image: image)
    }
    
}


//MARK: ADDS JSON SUPPORT
//===========================


//This class contains the keys that will be used for JSON
//Serialization
fileprivate class Keys {
    
    static let timeOfPost = "time_of_post"
    static let postID = "post_id"
    static let usernameOfPoster = "username_of_poster"
    static let text = "text"
    static let image = "image"
}
