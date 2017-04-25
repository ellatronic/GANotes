//
//  Rainbow.swift
//  CustomViews
//
//  Created by Ella on 4/17/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit

@IBDesignable
class Rainbow: UIView {
    @IBInspectable var color: UIColor = .clear
    @IBInspectable var arcRadius: CGFloat = 0.0
    @IBInspectable var eyeSize: CGSize = CGSize(width: 0, height: 0)

    override func draw(_ rect: CGRect) {
        self.addCircle(arcRadius, color: color)

        let rect = CGRect(x: superview!.frame.midX - 25.0, y: superview!.frame.midY - 25.0, width: eyeSize.width, height: eyeSize.height)
        let path = UIBezierPath(rect: rect)
        self.addOval(lineWidth: 20.0, path: path.cgPath, strokeStart: 0, strokeEnd: 0.5, strokeColor: color, fillColor: .clear, shadowRadius: 0, shadowOpacity: 0, shadowOffset: .zero)
    }

    func addCircle(_ arcRadius: CGFloat, color: UIColor) {
        let X = self.bounds.midX
        let Y = self.bounds.midY

        let ovalIn = CGRect(x: (X - (arcRadius/2)), y: (Y - (arcRadius/2)), width: arcRadius, height: arcRadius)
        let path = UIBezierPath(ovalIn: ovalIn)
        self.addOval(lineWidth: 20.0, path: path.cgPath, strokeStart: 0, strokeEnd: 0.5, strokeColor: color, fillColor: .clear, shadowRadius: 0, shadowOpacity: 0, shadowOffset: .zero)
    }

    func addOval(lineWidth: CGFloat, path: CGPath, strokeStart: CGFloat, strokeEnd: CGFloat, strokeColor: UIColor, fillColor: UIColor, shadowRadius: CGFloat, shadowOpacity: Float, shadowOffset: CGSize) {

        let arc = CAShapeLayer()
        arc.lineWidth = lineWidth
        arc.path = path
        arc.strokeStart = strokeStart
        arc.strokeEnd = strokeEnd
        arc.strokeColor = strokeColor.cgColor
        arc.fillColor = fillColor.cgColor
        arc.shadowColor = UIColor.black.cgColor
        arc.shadowRadius = shadowRadius
        arc.shadowOpacity = shadowOpacity
        arc.shadowOffset = shadowOffset
        layer.addSublayer(arc)
    }
}

