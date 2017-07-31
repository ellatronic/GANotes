//
//  FaceTracker.swift
//  GooglyEyes
//
//  Created by Ella on 4/20/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//
import Foundation
import GoogleMVDataOutput
// The data source provides the FaceTracker object with the information it needs to display
// superimposed googly eyes.
protocol FaceTrackerDataSource: NSObjectProtocol {
    // View to display googly eyes.
    func overlayView() -> UIView
}
// Manages GooglyEyeViews. This class implements GMVOutputTrackerDelegate to receive
// face and landmarks tracking notifications. It updates the GooglyEyeViews' positions and
// sizes accordingly.
class FaceTracker: NSObject, GMVOutputTrackerDelegate {
    weak var delegate: FaceTrackerDataSource?

    var leftEyeView: GooglyEyeView?
    var rightEyeView: GooglyEyeView?
    var lastLeftEyePosition = CGPoint.zero
    var lastRightEyePosition = CGPoint.zero

    // MARK: - GMVOutputTrackerDelegate
    func dataOutput(_ dataOutput: GMVDataOutput, detectedFeature feature: GMVFeature) {
        leftEyeView = GooglyEyeView()
        rightEyeView = GooglyEyeView()
        delegate.overlayView().addSubview(leftEyeView)
        delegate.overlayView().addSubview(rightEyeView)
    }

    func dataOutput(_ dataOutput: GMVDataOutput, updateFocusing face: GMVFaceFeature, forResultSet features: [GMVFaceFeature]) {
        leftEyeView.isHidden = false
        rightEyeView.isHidden = false
        // Update left eye rect.
        let newLeftEyePosition = face.hasLeftEyePosition ? face.leftEyePosition : CGPoint.zero
        let leftEyeRect: CGRect = eyeRect(lastLeftEyePosition, newEyePosition: newLeftEyePosition, faceRect: face.bounds, xScale: dataOutput.xScale, yScale: dataOutput.yScale, offset: dataOutput.offset)
        leftEyeView.updateEyeRect(leftEyeRect, with: face.leftEyeOpenProbability, eulerZAngle: face.headEulerAngleZ)
        // Update right eye rect.
        let newRightEyePosition = face.hasRightEyePosition ? face.rightEyePosition : CGPoint.zero
        let rightEyeRect: CGRect = eyeRect(lastRightEyePosition, newEyePosition: newRightEyePosition, faceRect: face.bounds, xScale: dataOutput.xScale, yScale: dataOutput.yScale, offset: dataOutput.offset)
        rightEyeView.updateEyeRect(rightEyeRect, with: face.rightEyeOpenProbability, eulerZAngle: face.headEulerAngleZ)
        // Remeber last known eyes positions.
        updateLast(face)
    }

    func dataOutput(_ dataOutput: GMVDataOutput, updateMissingFeatures features: [GMVFaceFeature]) {
        leftEyeView.isHidden = true
        rightEyeView.isHidden = true
    }

    func dataOutputCompleted(withFocusingFeature dataOutput: GMVDataOutput) {
        leftEyeView.removeFromSuperview()
        rightEyeView.removeFromSuperview()
    }

    // MARK: - Helper methods
    func scaledRect(_ rect: CGRect, xScale xscale: CGFloat, yScale yscale: CGFloat, offset: CGPoint) -> CGRect {
        var resultRect = CGRect(x: CGFloat(floor(rect.origin.x * xscale)), y: CGFloat(floor(rect.origin.y * yscale)), width: CGFloat(floor(rect.size.width * xscale)), height: CGFloat(floor(rect.size.height * yscale)))
        resultRect = resultRect.offsetBy(dx: CGFloat(offset.x), dy: CGFloat(offset.y))
        return resultRect
    }

    func eyeRect(_ lastEyePosition: CGPoint, newEyePosition: CGPoint, face faceRect: CGRect, xScale: CGFloat, yScale: CGFloat, offset: CGPoint) -> CGRect {
        var eye: CGPoint = lastEyePosition
        if !newEyePosition.equalTo(CGPoint.zero) {
            eye = newEyePosition
        }
        let faceToEyeRatio: CGFloat = 4.0
        let width: CGFloat = faceRect.size.width / faceToEyeRatio
        var rect = CGRect(x: CGFloat(eye.x - width / 2), y: CGFloat(eye.y - width / 2), width: width, height: width)
        rect = scaledRect(rect, xScale: xScale, yScale: yScale, offset: offset)
        return rect
    }

    func updateLast(_ feature: GMVFaceFeature) {
        if feature.hasLeftEyePosition {
            lastLeftEyePosition = feature.leftEyePosition
        }
        if feature.hasRightEyePosition {
            lastRightEyePosition = feature.rightEyePosition
        }
    }
}
