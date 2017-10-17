//
//  ViewController.swift
//  PermissionsLesson
//
//  Created by Ella on 3/29/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit
import Photos
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()

        let status = PHPhotoLibrary.authorizationStatus()
        print(status)
        getPhotosPermission()
    }

    func getPhotosPermission() {
        PHPhotoLibrary.requestAuthorization { (authorizationStatus) in
            switch authorizationStatus {
            case .authorized:
                print("authorized")
            case .denied:
                print("denied")
            case .notDetermined:
                print("not determined")
            case .restricted:
                print("restricted")
            }
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.first!)
    }
}
