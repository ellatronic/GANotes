//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Richard Ash on 3/15/17.
//  Copyright © 2017 Richard. All rights reserved.
//

import Foundation

class WeatherService {
  
  // MARK: - Static Parameters
  
  // Be careful when you make global variables!!!
  // Global states are difficult to manage without bugs!
  static let shared = WeatherService()
  
  var delegate: WeatherDelegate?
  
  // MARK: - Init
  
  private init() {}
  
  // MARK: - Functions
  
  func getCurrentWeather() -> WeatherStatus {
    return WeatherStatus(temperature: 0, condition: .snowy)
  }
}
