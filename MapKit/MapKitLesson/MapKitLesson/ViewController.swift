//
//  ViewController.swift
//  MapKitLesson
//
//  Created by Ella on 4/18/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    let mapView = MKMapView()
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        let longGestureRecognizer: UIGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress))

        mapView.addGestureRecognizer(longGestureRecognizer)

        locationManager.delegate = self

        if locationManager.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization)) {
            locationManager.requestAlwaysAuthorization()
        }

        mapView.frame = CGRect(x: 10, y: 8, width: view.frame.size.width, height: view.frame.size.height)

        mapView.center = view.center
        mapView.mapType = .standard
        mapView.isZoomEnabled = true

        mapView.delegate = self
        mapView.showsUserLocation = true

        view.addSubview(mapView)
    }

    // MARK: - Helper Functions
    func longPress(recognizer: UIGestureRecognizer) {
        let touchPoint = recognizer.location(in: mapView)
        let newCoordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinates
        mapView.addAnnotation(annotation)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }


}

