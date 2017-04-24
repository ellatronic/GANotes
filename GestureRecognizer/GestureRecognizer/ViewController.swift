//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Ella on 4/17/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy private var gestureView: UIView = {
        let gestureView = UIView()
        gestureView.frame = CGRect(x: 40, y: 40, width: 100, height: 200)
        gestureView.backgroundColor = .blue
        return gestureView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(tap))
        gestureView.addGestureRecognizer(tapRecognizer)

        let panRecognizer = UIPanGestureRecognizer()
        panRecognizer.addTarget(self, action: #selector(pan))
        gestureView.addGestureRecognizer(panRecognizer)

        let pinchRecognizer = UIPinchGestureRecognizer()
        pinchRecognizer.addTarget(self, action: #selector(pinch))
        gestureView.addGestureRecognizer(pinchRecognizer)

        let rotationRecognizer = UIRotationGestureRecognizer()
        rotationRecognizer.addTarget(self, action: #selector(rotate))
        gestureView.addGestureRecognizer(rotationRecognizer)

        tapRecognizer.delegate = self
        panRecognizer.delegate = self
        pinchRecognizer.delegate = self
        rotationRecognizer.delegate = self
        view.addSubview(gestureView)
    }

    func tap(recognizer: UITapGestureRecognizer) {
        print("TAPPED")
    }

    func pan(panRecognizer: UIPanGestureRecognizer) {
        let draggableTranslation = panRecognizer.translation(in: self.view)

        if let gestureView = panRecognizer.view {
            gestureView.center = CGPoint(x: gestureView.center.x + draggableTranslation.x, y: gestureView.center.y + draggableTranslation.y)
        }

        panRecognizer.setTranslation(CGPoint.zero, in: gestureView)
    }

    func pinch(pinchRecognizer: UIPinchGestureRecognizer) {
        if let view = pinchRecognizer.view {
            view.transform = view.transform.scaledBy(x: pinchRecognizer.scale, y: pinchRecognizer.scale)
        }

        pinchRecognizer.scale = 1
    }

    func rotate(rotationRecognizer: UIRotationGestureRecognizer) {
        if let view = rotationRecognizer.view {
            let rotation: CGFloat = rotationRecognizer.rotation
            view.transform = view.transform.rotated(by: rotation)
            rotationRecognizer.rotation = 0.0
        }
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
