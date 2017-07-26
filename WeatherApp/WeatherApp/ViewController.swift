//
//  ViewController.swift
//  WeatherApp
//
//  Created by Richard Ash on 3/15/17.
//  Copyright © 2017 Richard. All rights reserved.
//

import UIKit

/*
 First Type after the ViewController is the super class, anything afterwards is a protocol
 eg. ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
 
  In this case the UIViewController is ViewController's super class.
  And then UIViewController conforms to the UITableViewDataSource and UITableViewDelegate protocols.
 */
class ViewController: UIViewController {

  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var conditionLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Set the listener for the WeatherService to self (ViewController)
    // Now the ViewController IS listening to WeatherService
    WeatherService.shared.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

// MARK: - Weather Delegate
// You CANNOT Subclass in extensions. Extensions can only be protocols
// extension ViewController: UITabBar will throw an error
extension ViewController: WeatherDelegate {
  // Implementing the protocol only says that the ViewController CAN listen to the delegate, not that it is
  func weatherDidUpdate(_ weatherStatus: WeatherStatus) {
    // Update the UI!!
    temperatureLabel.text = "\(weatherStatus.temperature)"
    switch weatherStatus.condition {
    case .cloudy:
      conditionLabel.text = "Cloudy"
    case .snowy:
      conditionLabel.text = "Snowy"
    case .rainy:
      conditionLabel.text = "Rainy"
    case .windy:
      conditionLabel.text = "Windy"
    case .sunny:
      conditionLabel.text = "Sunny"
    }
  }
}








