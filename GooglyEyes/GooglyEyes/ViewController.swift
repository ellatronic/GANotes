//
//  ViewController.swift
//  GooglyEyes
//
//  Created by Ella on 4/20/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import AVFoundation
import GoogleMobileVision
import GoogleMVDataOutput

class ViewController: UIViewController, GMVMultiDataOutputDelegate, FaceTrackerDataSource {
    @IBOutlet weak var placeHolder: UIView!
    @IBOutlet weak var overlay: UIView!
    @IBOutlet weak var cameraSwitch: UISwitch!

    var session: AVCaptureSession?
    var dataOutput: GMVDataOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?

    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up default camera settings.
        session = AVCaptureSession()
        session.sessionPreset = AVCaptureSessionPresetMedium
        cameraSwitch.on = true
        updateCameraSelection()
        // Set up processing pipeline.
        setupGMVDataOutput()
        // Set up camera preview.
        setupCameraPreview()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = view.layer.bounds
        previewLayer.position = CGPoint(x: CGFloat(previewLayer.frame.midX), y: CGFloat(previewLayer.frame.midY))
    }

    override func viewDidUnload() {
        cleanupCaptureSession()
        super.viewDidUnload()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        session.startRunning()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        session.stopRunning()
    }

    func willAnimateRotation(toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        // Camera rotation needs to be manually set when rotation changes.
        if previewLayer {
            if toInterfaceOrientation == .portrait {
                previewLayer.connection.videoOrientation = .portrait
            }
            else if toInterfaceOrientation == .portraitUpsideDown {
                previewLayer.connection.videoOrientation = .portraitUpsideDown
            }
            else if toInterfaceOrientation == .landscapeLeft {
                previewLayer.connection.videoOrientation = .landscapeLeft
            }
            else if toInterfaceOrientation == .landscapeRight {
                previewLayer.connection.videoOrientation = .landscapeRight
            }
        }
        dataOutput.previewFrameSize = previewLayer.frame.size
    }

    var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }

    // MARK: - GMV Pipeline Setup
    func setupGMVDataOutput() {
        let options: [AnyHashable: Any] = [GMVDetectorFaceTrackingEnabled: (true), GMVDetectorFaceMode: (GMVDetectorFaceFastMode), GMVDetectorFaceLandmarkType: (GMVDetectorFaceLandmarkAll), GMVDetectorFaceClassificationType: (GMVDetectorFaceClassificationAll), GMVDetectorFaceMinSize: (cameraSwitch.isOn ? 0.35 : 0.15)]
        let detector = GMVDetector.ofType(GMVDetectorTypeFace, options: options)
        if cameraSwitch.isOn {
            dataOutput = GMVLargestFaceFocusingDataOutput(detector)
            let tracker = FaceTracker()
            tracker.delegate = self
            (dataOutput as? GMVLargestFaceFocusingDataOutput)?.trackerDelegate = tracker
        }
        else {
            dataOutput = GMVMultiDataOutput(detector)
            (dataOutput as? GMVMultiDataOutput)?.multiDataDelegate = self
        }
        if !session.canAddOutput(dataOutput) {
            cleanupGMVDataOutput()
            print("Failed to setup video output")
            return
        }
        session.addOutput(dataOutput)
    }

    func cleanupGMVDataOutput() {
        if dataOutput {
            session.removeOutput(dataOutput)
        }
        dataOutput.cleanup()
        dataOutput = nil
    }

    @IBAction func switchCamera(_ switchControl: UISwitch) {
        updateCameraSelection()
        cleanupGMVDataOutput()
        setupGMVDataOutput()
    }

    // MARK: - FaceTrackerDataSource
    func overlayView() -> UIView? {
        return overlay
    }

    // MARK: - GMVMultiDataOutputDelegate
    func dataOutput(_ dataOutput: GMVDataOutput, trackerFor feature: GMVFeature) -> GMVOutputTrackerDelegate {
        let tracker = FaceTracker()
        tracker.delegate = self
        return tracker
    }

    // MARK: - Camera setup
    func cleanupCaptureSession() {
        session.stopRunning()
        cleanupGMVDataOutput()
        session = nil
        previewLayer.removeFromSuperlayer()
    }

    func setupCameraPreview() {
        previewLayer = AVCaptureVideoPreviewLayer(session)
        previewLayer.backgroundColor = UIColor.white.cgColor
        previewLayer.videoGravity = .resizeAspect
        let rootLayer: CALayer? = placeHolder.layer()
        rootLayer?.masksToBounds = true
        previewLayer.frame = rootLayer?.bounds
        rootLayer?.addSublayer(previewLayer)
    }

    func updateCameraSelection() {
        session.beginConfiguration()
        // Remove old inputs
        let oldInputs: [Any] = session.inputs()
        for oldInput: AVCaptureInput in oldInputs {
            session.removeInput(oldInput)
        }
        let desiredPosition: AVCaptureDevicePosition = cameraSwitch.isOn ? .front : .back
        let input: AVCaptureDeviceInput? = camera(for: desiredPosition)
        if input == nil {
            // Failed, restore old inputs
            for oldInput: AVCaptureInput in oldInputs {
                session.addInput(oldInput)
            }
        }
        else {
            // Succeeded, set input and update connection states
            session.addInput(input)
        }
        session.commitConfiguration()
    }

    func camera(for desiredPosition: AVCaptureDevicePosition) -> AVCaptureDeviceInput {
        var hadError: Bool = false
        for device: AVCaptureDevice in AVCaptureDevice.devices(withMediaType: AVMediaTypeVideo) {
            if device.position == desiredPosition {
                var error: Error? = nil
                let input = try? AVCaptureDeviceInput(device: device)
                if error != nil {
                    hadError = true
                    print("Could not initialize for AVMediaTypeVideo for device \(device)")
                }
                else if session.canAddInput(input) {
                    return input!
                }
            }
        }
        if !hadError {
            print("No camera found for requested orientation")
        }
        return nil
    }
}
