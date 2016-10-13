//
//  mapView.swift
//  fishing
//
//  Created by Yazz on 2016. 10. 14..
//  Copyright © 2016년 IMS. All rights reserved.
//

import UIKit
import MapKit


class mapView: UIViewController, MTMapViewDelegate,UINavigationBarDelegate {
    let viewMap = MTMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       navigationController?.navigationBar.barTintColor = UIColor.green
        
        viewMap.frame =  CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        viewMap.delegate = self
        viewMap.baseMapType = .hybrid
        viewMap.daumMapApiKey = "6c92f6351cf2b138b045ba4b1b1ef0f3"
       
        
        self.view.addSubview(viewMap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
