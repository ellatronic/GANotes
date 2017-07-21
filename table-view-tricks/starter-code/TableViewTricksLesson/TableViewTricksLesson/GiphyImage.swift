//
//  GiphyImage.swift
//  TableViewTricksLesson
//
//  Created by Wellington Moreno on 9/13/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation

/**
 This Struct is modeled after a Giphy Image.
 Documentation for this image and API can be found [here](https://github.com/Giphy/GiphyAPI#random-endpoint).
 */
struct GiphyImage {
  
  let type: String
  let id: String
  let url: URL
  let originalImageUrl: URL
  let imageURL: URL
  let imageFrames: Int
  let imageWidth: Int
  let imageHeight: Int
  
  static func from(_ dictionary: [String: Any]) -> GiphyImage? {
    
    //Loads all of the keys from the dictionary that correspond to our Giphy Object
    guard let type = dictionary["type"] as? String,
      let id = dictionary["id"] as? String,
      let urlString = dictionary["url"] as? String,
      let url = URL(string: urlString),
      let originalImageURLString = dictionary["image_original_url"] as? String,
      let originalImageURL = URL(string: originalImageURLString),
      let imageURLString = dictionary["image_url"] as? String,
      let imageFramesString = dictionary["image_frames"] as? String,
      let imageFrames = Int(imageFramesString),
      let imageURL = URL(string: imageURLString),
      let imageHeightString = dictionary["image_height"] as? String, //height and width comes back as a String, so we want to convert it to an Int afterwards
      let imageHeight = Int(imageHeightString),
      let imageWidthString = dictionary["image_width"] as? String,
      let imageWidth = Int(imageWidthString)
      else {
        return nil
    }
    
    return GiphyImage(type: type, id: id, url: url, originalImageUrl: originalImageURL, imageURL: imageURL, imageFrames: imageFrames, imageWidth: imageWidth, imageHeight: imageHeight)
  }
}
