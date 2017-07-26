//
//  WeatherDelegate.swift
//  WeatherApp
//
//  Created by Richard Ash on 3/15/17.
//  Copyright © 2017 Richard. All rights reserved.
//

import Foundation


/*
 VC to VC communication
 1. completion handlers - within the scope of whatever you're using
 2. delegates - one to one
 3. notifications - one to many
 
 The class that want to communicate owns the delegate. (When I say own i mean)
 
 class SomeClass {
    // SomeClass OWNS the delegate
    var delegate: WeatherDelegate?
 
    // SomeClass call the delegate function. SomeOtherClass recieves a message in weatherDidUpdate()
    func updateWeather() {
      delegate.weatherDidUpdate(WeatherStatus(...))
    }
 }
 
 The class that wants to listen implements the protocol.
 
 class SomeOtherClass: WeatherDelegate {
    func weatherDidUpdate(_ weatherStatus: WeatherStatus) {
        // specific implementation
    }
 }
 
 
*/
protocol WeatherDelegate {
  func weatherDidUpdate(_ weatherStatus: WeatherStatus)
}

//protocol iOSDeveloper {
//  func buildiPhoneApp()
//  func buildiOSTVApp()
//}
//
//struct Kevin: iOSDeveloper {
//  func buildiOSTVApp() {
//    print("I am Kevin and I like dougnuts")
//  }
//  
//  func buildiPhoneApp() {
//    print("I am Kevin and will build a tiny home")
//  }
//}
//
//struct Joy: iOSDeveloper {
//  func buildiPhoneApp() {
//    print("I can build you an iphone app!")
//  }
//  
//  func buildiOSTVApp() {
//    print("Who wants a tv app!?!")
//  }
//}
