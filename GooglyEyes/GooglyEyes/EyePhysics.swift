//
//  EyePhysics.swift
//  GooglyEyes
//
//  Created by Ella on 4/20/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit
// Simulates the physics of motion for an iris which moves within a googly eye. The iris moves
// independently of the motion of the face/eye.
class EyePhysics: NSObject {
    // Generates the next position of the iris based on simulated velocity, eye boundaries, gravity,
    // friction, and bounce momentum.
    // @param eyeRect the current eye rect in parent view coordinates.
    // @param irisRect the last computed iris rect.
    func nextIrisRect(from eyeRect: CGRect, withIrisRect irisRect: CGRect) -> CGRect {
    }

    // Calculates the new position for |point| by rotating |angle| degrees around the |anchor| point.
    // @param point The point to be rotated.
    // @param angle The rotation angle.
    // @param anchor The anchor point for the rotation.
    func point(_ point: CGPoint, rotatedAngle angle: CGFloat, aroundAnchor anchor: CGPoint) -> CGPoint {
    }

    let kFriction: CGFloat = 2.2
    let kGravity: CGFloat = 10
    let kBounceMultiplier: CGFloat = 20
    let kZeroTolerance: CGFloat = 0.001
    let kIrisRatio: CGFloat = 0.45
    class EyePhysics {
        var lastUpdated: Date?
        var xVelocity: CGFloat = 0.0
        var yVelocity: CGFloat = 0.0
        var consecutiveBounces: Int = 0

        override init() {
            super.init()

            lastUpdated = Date()

        }

        func point(_ point: CGPoint, rotatedAngle angle: CGFloat, aroundAnchor anchor: CGPoint) -> CGPoint {
            // The rotation is calculated based on the formula:
            // x' = (point.x - anchor.x) * cosθ - (point.x - anchor.y) * sinθ + anchor.x
            // y' = (point.x - anchor.x) * sinθ + (point.y - anchor.y) * cosθ + anchor.y
            let sinAngle: CGFloat = sinf(-angle / 180 * .pi)
            let cosAngle: CGFloat = cosf(-angle / 180 * .pi)
            let newX: CGFloat = (point.x - anchor.x) * cosAngle - (point.x - anchor.y) * sinAngle + anchor.x
            let newY: CGFloat = (point.x - anchor.x) * sinAngle + (point.y - anchor.y) * cosAngle + anchor.y
            return CGPoint(x: newX, y: newY)
        }

        // Generate the next position of the iris based on simulated velocity, eye boundaries, gravity,
        // friction, and bounce momentum. This is independent from face/eye motion.
        func nextIrisRect(from eyeRect: CGRect, withIrisRect irisRect: CGRect) -> CGRect {
            let now = Date()
            let elapsed: TimeInterval = now.timeIntervalSince(lastUpdated)
            lastUpdated = now
            let irisRadius: CGFloat = eyeRect.size.width * kIrisRatio / 2
            if irisRect.isNull() || irisRect.isEmpty() || irisRect.isInfinite() {
                // Initialize eyeball at the top of the eye.
                irisRect = CGRect(x: CGFloat(eyeRect.midX - irisRadius), y: CGFloat(eyeRect.origin.y), width: CGFloat(irisRadius * 2), height: CGFloat(irisRadius * 2))
            }
            if !isStopped(eyeRect, irisRect: irisRect) {
                // Only apply gravity when the iris is not stopped at the bottom of the eye.
                yVelocity += kGravity * elapsed
            }
            // Apply friction in the opposite direction of motion, so that the iris slows in the absence
            // of other head motion.
            xVelocity = applyFriction(xVelocity, simulationRate: elapsed)
            yVelocity = applyFriction(yVelocity, simulationRate: elapsed)
            // Update iris rect based on velocity.
            let irisX: CGFloat = irisRect.origin.x + (xVelocity * irisRadius * elapsed)
            let irisY: CGFloat = irisRect.origin.y + (yVelocity * irisRadius * elapsed)
            var nextIris = CGRect(x: irisX, y: irisY, width: CGFloat(irisRect.size.width), height: CGFloat(irisRect.size.height))
            nextIris = makeIris(nextIris, inEyeBounds: eyeRect, simulationRate: elapsed)
            return nextIris
        }

        // The iris is stopped if it is at the bottom of the eye and its velocity is zero.
        func isStopped(_ eyeRect: CGRect, irisRect: CGRect) -> Bool {
            if eyeRect.contains(irisRect) {
                return false
            }
            let offsetY: CGFloat = irisRect.maxY - eyeRect.maxY
            let maxDistance: CGFloat = (eyeRect.size.height - irisRect.size.height) / 2
            if offsetY < maxDistance {
                return false
            }
            return isZero(xVelocity) && isZero(yVelocity)
        }

        func isZero(_ number: CGFloat) -> Bool {
            return isnan(number) || (number < kZeroTolerance && number > -kZeroTolerance)
        }

        // Friction slows velocity in the opposite direction of motion, until zero velocity is reached.
        func applyFriction(_ velocity: CGFloat, simulationRate elapsed: TimeInterval) -> CGFloat {
            if isZero(velocity) {
                velocity = 0
            }
            else if velocity > 0 {
                velocity = fmaxf(0, velocity - kFriction * elapsed)
            }
            else {
                velocity = fminf(0, velocity + kFriction * elapsed)
            }
            
            return velocity
        }

        // Correct the iris position to be in-bounds within the eye, if it is now out of bounds.  Being
        // out of bounds could have been due to a sudden movement of the head and/or camera, or the
        // result of just bouncing/rolling around.
        // In addition, modify the velocity to cause a bounce in the opposite direction.
        func makeIris(_ nextIrisRect: CGRect, inEyeBounds eyeRect: CGRect, simulationRate elapsed: TimeInterval) -> CGRect {
            if eyeRect.contains(nextIrisRect) {
                consecutiveBounces = 0
                return nextIrisRect
            }
            // Accumulate a consecutive bounce count to aid for velocity calculation.
            consecutiveBounces += 1
            // Move the iris back to where it would have been when it would have contacted the side of
            // the eye.
            var newOrigin: CGPoint = nextIrisRect.origin
            let intersectRect: CGRect = eyeRect.intersection(nextIrisRect)
            if !intersectRect.isNull() {
                // Handle overlapping case.
                newOrigin.x += (intersectRect.origin.x <= nextIrisRect.origin.x ? -1 : 1) * (nextIrisRect.size.width - intersectRect.size.width)
                newOrigin.y += (intersectRect.origin.y > eyeRect.origin.y ? -1 : 1) * (nextIrisRect.size.height - intersectRect.size.height)
            }
            else {
                // Handle not overlapping case.
                if nextIrisRect.origin.x < eyeRect.origin.x {
                    // Iris to the left of the eye.
                    newOrigin.x = eyeRect.origin.x
                }
                else {
                    // Iris to the right of the eye.
                    newOrigin.x = eyeRect.origin.x + eyeRect.size.width - nextIrisRect.size.width
                }
                if nextIrisRect.origin.y < eyeRect.origin.y {
                    // Iris to the top of the eye.
                    newOrigin.y = eyeRect.origin.y
                }
                else {
                    // Iris to the bottom of the eye.
                    newOrigin.y = eyeRect.origin.y + eyeRect.size.height - nextIrisRect.size.height
                }
            }

            
}
