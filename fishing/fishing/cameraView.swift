//
//  cameraView.swift
//  fishing
//
//  Created by Yazz on 2016. 11. 30..
//  Copyright © 2016년 IMS. All rights reserved.
//

import UIKit
import AVFoundation


@available(iOS 10.0, *)
class cameraView: UIViewController, UINavigationBarDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, AVCaptureMetadataOutputObjectsDelegate{

    
    
   

    @IBOutlet weak var btTakepic : UIButton?
    @IBOutlet weak var frontcamera : UIButton?
     @IBOutlet weak var flash : UIButton?
    
    @IBOutlet weak var uvCameraView: UIView?
    
    var device: AVCaptureDevice?
    
    var captureSesssion: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title="사진"
        navigationItem.leftBarButtonItem = UIBarButtonItem (title: "back", style:.plain, target: self, action: #selector(backButton))
        
        
        
        
    }
    
    
    
    func backButton (_ sender : AnyObject){
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : UIViewController = storyboard.instantiateViewController(withIdentifier: "VCprofileChange") as UIViewController
        present(vc, animated: false, completion: nil)
        
        
        
        print("test")
        
        
    }
    


    
    
    override func viewWillAppear(_ animated: Bool) {
        
  
        backCamera()
        
        
    }
    
    
    func backCamera(){
        
        
        captureSesssion = AVCaptureSession()
        stillImageOutput = AVCapturePhotoOutput()
        
        captureSesssion.sessionPreset = AVCaptureSessionPreset1920x1080 // 해상도설정
        
        
        // backCamera
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)

        
        
        let picker = UIImagePickerController()
        picker.delegate = self
  
      
        let devices = AVCaptureDevice.devices()
        print ("device : " ,devices!)
     

        
       do {
            
            let input = try AVCaptureDeviceInput(device: device)
        
            // 입력
            if (captureSesssion.canAddInput(input)) {
                captureSesssion.addInput(input)
                
                // 출력
                if (captureSesssion.canAddOutput(stillImageOutput)) {
                    captureSesssion.addOutput(stillImageOutput)
                    captureSesssion.startRunning() // 카메라 시작
                    
                    previewLayer = AVCaptureVideoPreviewLayer(session: captureSesssion)
                    previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect //화면 조절
                
                    
                    
//                    previewLayer?.videoGravity =
                    previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.portrait // 카메라 방향
                    
                    
                    uvCameraView?.layer.addSublayer(previewLayer!)
                    
                    
                    // 뷰 크기 조절

                    previewLayer?.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
                    
                    
                    previewLayer?.position = CGPoint(x: self.view.bounds.midX, y: 210)
                    
                    
//                   previewLayer?.position = CGPoint(x: 0, y: 0)
                    previewLayer?.videoGravity = AVLayerVideoGravityResize
                      previewLayer?.bounds = uvCameraView!.frame
                    // 뷰 크기 조절 상태 조절 알아보기 일단 카메라
                   
//                   previewLayer?.bounds = uvCameraView!.frame
                
                    
                }
            }
        }
        catch {
            print(error)
        }
        
        
        
    }
    
    
    @IBAction func flashButton (_ sender : AnyObject){
        
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        // check if the device has torch
        if (device?.hasTorch)! {
            // lock your device for configuration
            do {
                var abv = try device?.lockForConfiguration()
            } catch {
                print("aaaa")
            }
            
            // check if your torchMode is on or off. If on turns it off otherwise turns it on
            if (device?.isTorchActive)! {
                device?.torchMode = AVCaptureTorchMode.off
            } else {
                // sets the torch intensity to 100%
                do {
                    var abv = try device?.setTorchModeOnWithLevel(1.0)
                } catch {
                    print("bbb")
                }
                //    avDevice.setTorchModeOnWithLevel(1.0, error: nil)
            }
            // unlock your device
            device?.unlockForConfiguration()
        }
    }
    
    
    
    
    @IBAction func frontcamera (_ sender : AnyObject){

        print("aa")
    
    }
    

    
    
    
    
    
 
    
    // 촬영 후 저장
    @IBAction func btTakepic (_ sender : AnyObject){
        
        
//        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
//            
//            let imagepicker = UIImagePickerController()
//            imagepicker.delegate = self
//            imagepicker.sourceType = UIImagePickerControllerSourceType.camera
//            imagepicker.allowsEditing = false
//            self.present(imagepicker, animated : true, completion: nil)
        
            
//            // 저장 
//            
//            let imageData = UIImageJPEGRepresentation((realtimeView?.image)!, 0.6)
//            let compressedJPEGImage = UIImage(data: imageData!)
//            UIImageWriteToSavedPhotosAlbum(compressedJPEGImage!, nil, nil, nil)
            
            
        }
        

   }
