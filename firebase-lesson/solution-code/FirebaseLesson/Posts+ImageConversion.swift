//
//  Posts+ImageConversion.swift
//  FirebaseLesson
//
//  Created by Wellington Moreno on 9/21/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation
import UIKit

//MARK: ImageConversion
//=======================

enum ImageConversionErrors: Error {
    case ConversionFailed
    case InvalidArgument
    case ImageDownscaleFailed
}

extension ImagePost {
    
    /** This is the biggest that a String can be */
    private static let maxStringSize = 10485760
    
    /**
        This function takes an Image and converts it to a 
        Base64 encoded String.
    */
    static func toString(image: UIImage) throws -> String {
        
        //Start out with the image
        var downscaledImage = image
        //Encode it into a string
        var encodedImage = try encode(image: image)
        
        //If the string is too big, let's reduce the size of the picture.
        while encodedImage.characters.count >= maxStringSize {
            
            if let smallerImage = downscale(image: downscaledImage) {
                downscaledImage = smallerImage
            }
            else {
                throw ImageConversionErrors.ImageDownscaleFailed
            }
            
            guard let data = UIImageJPEGRepresentation(downscaledImage, 95)
            else {
                throw ImageConversionErrors.ConversionFailed
            }
            
            encodedImage = data.base64EncodedString(options: [])
        }
        
        return encodedImage
    }
    
    /**
        This function takes a Base64 encoded String (that is supposed to represent an Image),
        decodes it, and reads it into an Image.
    */
    static func fromString(base64String: String) throws -> UIImage {
        
        guard !base64String.isEmpty
        else {
            print("base64 string is empty")
            throw ImageConversionErrors.InvalidArgument
        }
        
        guard let data = Data(base64Encoded: base64String)
        else {
            throw ImageConversionErrors.ConversionFailed
        }
        
        guard let image = UIImage(data: data)
        else {
            throw ImageConversionErrors.ConversionFailed
        }
        
        return image
    }
    
    fileprivate static func encode(image: UIImage) throws -> String {
        
        guard let data = UIImageJPEGRepresentation(image, 95)
            else {
                throw ImageConversionErrors.ConversionFailed
        }
        
        return data.base64EncodedString()
    }
    
    fileprivate static func downscale(image: UIImage) -> UIImage? {
        
        let size = __CGSizeApplyAffineTransform(image.size, CGAffineTransform(scaleX: 0.5, y: 0.5))
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        print("Downscaling image from \(image.size) to \(size)")
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        image.draw(in: CGRect(origin: CGPoint.zero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
    
}
