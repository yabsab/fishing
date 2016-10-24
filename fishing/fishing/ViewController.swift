

//
//  ViewController.swift
//  fishing
//
//  Created by Yazz on 2016. 10. 14..
//  Copyright © 2016년 IMS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var txid: UITextField!
    @IBOutlet weak var txpassword: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
     
        txid.delegate = self
        txpassword.delegate = self
        
        
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
    
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        //세로모드
        return [.portrait,.portraitUpsideDown]
        
        
    }
    

    
    
    //키보드 숨기기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        switch textField {
            
        case txid:
            print("test1")
            txid.text = ""

            
        case txpassword:
            print("test2")
            txpassword.text = ""
            txpassword.isSecureTextEntry = true
            
        default:
            
            print("test4")

        }
        


    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func joinMember(_ sender: AnyObject) {
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc:UIViewController = storyboard.instantiateViewController(withIdentifier: "joinMemeber") as UIViewController
        
        present(vc, animated: false, completion: nil)
        
        

        
        
    }
    
    
    
    @IBAction func goMapView(_ sender: AnyObject) {
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc:UIViewController = storyboard.instantiateViewController(withIdentifier: "mainTabView") as UIViewController
        
        present(vc, animated: false, completion: nil)

        
        
    }

}

