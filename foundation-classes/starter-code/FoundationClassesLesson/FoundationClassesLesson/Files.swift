//
//  Files.swift
//  FoundationClassesLesson
//
//  Created by Wellington Moreno on 9/14/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation


class Files {
    
    //==========================================================
    //STUDENT EXERCISE
    //Write a static function that loads the Dates file
    //Use the function below as reference, but don't call it
    //==========================================================
    
    //==========================================================
    //STUDENT EXERCISE
    //Write a static function that loads the Numbers file
    //Use the function below as reference, but don't call it
    //==========================================================
    
    static func loadFile(filename: String) -> String? {
        
        //This is the path of the file we want to load.
        //Even though the path is in the 'assets' folder, the path to the file
        //remains simply the filename. This is because in XCode,
        //Yellow folders are groups, and do not necessarily correspond to a folder
        //on the filesystem.
        //A lot of times you really have to guess to see whether to include the
        //folder name or not.
        let path = "\(filename)"
        
        //Create a variable to access the main bundle.
        //The main bundle contains all of an App's resources
        //and is packaged with the App
        let bundle = Bundle.main
        
        //Use the bundle to figure our and create a URL for the resource.
        guard let url = bundle.url(forResource: path, withExtension: ".txt")
        else {
            print("Could not load asset: \(path)")
            return nil
        }
        
        //After we have the URL, we can then load it into a String
        //for normal use
        guard let fileAsString = try? String(contentsOf: url)
        else {
            //Could not load the URL for some reason
            print("Failed to load file at URL \(url)")
            return nil
        }
        
        return fileAsString
        
    }
}
