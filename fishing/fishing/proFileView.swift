//
//  proFileView.swift
//  fishing
//
//  Created by Yazz on 2016. 10. 19..
//  Copyright © 2016년 IMS. All rights reserved.
//

import UIKit

class proFileView: UIViewController {
    @IBOutlet weak var myPhoto:UIImageView!
    @IBOutlet weak var chagneProfile:UIButton!
    
    let imageName = "testimage.jpg"
    override func viewDidLoad() {
        super.viewDidLoad()

        chagneProfile.backgroundColor = UIColor.gray
       
        
        profileMyphoto()
      
       
      
       
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        //세로모드
        return [.portrait,.portraitUpsideDown]
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func profileMyphoto()  {
       
        let image = UIImage(named: imageName)
        myPhoto.layer.cornerRadius = myPhoto.frame.width/2.0
        myPhoto.layer.borderWidth = 2.0
        myPhoto.layer.borderColor = UIColor.white.cgColor
        myPhoto.clipsToBounds = true
        myPhoto.image = image
        
        

    }
    
    
    @IBAction func chagneProfile(_ sender: AnyObject){
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc:UIViewController = storyboard.instantiateViewController(withIdentifier: "profileChange") as UIViewController
        
        present(vc, animated: false, completion: nil)
        
        
    }
   
}
