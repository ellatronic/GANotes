//
//  Giphy.swift
//  TableViewTricksLesson
//
//  Created by Wellington Moreno on 9/13/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation


/**
    This class contains information for working with and calling Giphy's API.
    This API is documented [here](https://github.com/Giphy/GiphyAPI#random-endpoint).
 */
class Giphy {
    
    /** This is the public API key used to make Giphy Requests */
    static let apiKey = "dc6zaTOxFJmzC"
    
    /** All requests to Giphy start with this URL */
    static let baseURL = "http://api.giphy.com/v1/gifs"
    /** This is the Giphy Random API, otherwise known as the roulette API. */
    static let randomGiphyURL = baseURL + "/random"
    
    /** This function takes a regular URL String and appends the API key to the end as a query string. */
    static func appendApiKey(toURL url: String) -> String {
        return url + "?api_key=\(apiKey)"
    }
}
