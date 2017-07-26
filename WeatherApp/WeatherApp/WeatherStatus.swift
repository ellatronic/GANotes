//
//  WeatherStatus.swift
//  WeatherApp
//
//  Created by Richard Ash on 3/15/17.
//  Copyright © 2017 Richard. All rights reserved.
//

import Foundation

class WeatherStatus {
  
  // MARK: - Variables
  
  var temperature: Double
  var condition: WeatherCondition
  
  // MARK: - Init
  
  init(temperature: Double, condition: WeatherCondition) {
    self.temperature = temperature
    self.condition = condition
  }
}
