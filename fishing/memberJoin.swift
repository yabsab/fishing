//
//  memberJoin.swift
//  fishing
//
//  Created by Yazz on 2016. 10. 14..
//  Copyright © 2016년 IMS. All rights reserved.
//

import UIKit

class memberJoin: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goMain(_ sender: AnyObject) {
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc:UIViewController = storyboard.instantiateViewController(withIdentifier: "mainView") as UIViewController
        
        present(vc, animated: false, completion: nil)
   
        
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        //세로모드
        return [.portrait,.portraitUpsideDown]
    
    }

}
