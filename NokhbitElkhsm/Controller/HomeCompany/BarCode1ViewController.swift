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
    
    //@IBOutlet weak var BarcodeMenue: UIButton!
    @IBOutlet weak var Squar: UIImageView!
    var viedo = AVCaptureVideoPreviewLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomNavigation()
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
    
    //MarK:- Custom Navigation
    func CustomNavigation (){
        let imageView = UIImageView(image: UIImage(named: "icon"))
        let item = UIBarButtonItem(customView: imageView)
        self.navigationItem.rightBarButtonItem = item
        /////////////////////////////////////////////////////////////////////////////////////////////////////
        let homeBtn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        homeBtn.setImage(UIImage(named: "home-btn"), for: [])
        homeBtn.addTarget(self, action: #selector(homeAction), for: UIControl.Event.touchUpInside)
        homeBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let homeButton = UIBarButtonItem(customView: homeBtn)
        /////////////////////////////////////////////////////////////////////////////////////////////////
        let backBtn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        backBtn.setImage(UIImage(named: "search-btn"), for: [])
        backBtn.addTarget(self, action: #selector(backAction), for: UIControl.Event.touchUpInside)
        backBtn.frame = CGRect(x: -30, y: 0, width: 30, height: 30)
        let backButton = UIBarButtonItem(customView: backBtn)
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        let Menu: UIButton = UIButton(type: UIButton.ButtonType.custom)
        Menu.setImage(UIImage(named: "side-nav-btn"), for: [])
        Menu.addTarget(self, action: #selector(SideMenu), for: UIControl.Event.touchUpInside)
        Menu.frame = CGRect(x: -50, y: 0, width: 30, height: 30)
        let MenueButton = UIBarButtonItem(customView: Menu)
        self.navigationItem.setLeftBarButtonItems([MenueButton,homeButton,backButton], animated: true)
        
    }
    
    @objc func homeAction(){
        let sb: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier:"HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func backAction(){
        let sb: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier:"SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func SideMenu(){
        print("gooooo")
    }

    
    
//Mark:- Barcode
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
