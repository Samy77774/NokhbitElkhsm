//
//  BarCode1ViewController.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/17/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit
import AVFoundation
class BarCode1ViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    
    
    @IBOutlet weak var Squar: UIImageView!
    var viedo = AVCaptureVideoPreviewLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Creating Session
        let session = AVCaptureSession()
        // Define Capture device
 guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {return}
        do
        {
           let Input = try AVCaptureDeviceInput(device: captureDevice)
            session.addInput(Input)
            
            
        }
            
        catch
        {
            print ("Error")
            
        }
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        viedo = AVCaptureVideoPreviewLayer (session: session)
        viedo.frame = view.layer.bounds
        view.layer.addSublayer(viedo)
        self.view.bringSubviewToFront(Squar)
        session.startRunning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection){
        if metadataObjects != nil && metadataObjects.count != 0
        {
            if let object = metadataObjects [0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObject.ObjectType.qr {
                    
                }
                let alert = UIAlertController(title: "QR Code", message: object.stringValue, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "that is ok", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Copy", style: .default, handler: { (nil) in
                    UIPasteboard.general.string = object.stringValue
                }))
                present(alert, animated: true, completion: nil)
            }
        }
    }
}
