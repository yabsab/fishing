//
//  mapView.swift
//  fishing
//
//  Created by Yazz on 2016. 10. 14..
//  Copyright © 2016년 IMS. All rights reserved.
//

import UIKit
import CoreLocation



class mapView: UIViewController, MTMapViewDelegate,UINavigationBarDelegate,UITabBarControllerDelegate,CLLocationManagerDelegate{
    
    let viewMap = MTMapView()
    let locationMager = CLLocationManager()
    var shopPoint : MTMapPOIItem!
    let accurary = MTMapLocationAccuracy()
    
override func viewDidLoad() {
        super.viewDidLoad()

       
        let loc = locationMager.location?.coordinate
        let map_latitude = loc?.latitude
        let map_longitude = loc?.longitude
        let centerPoint = MTMapPointGeo(latitude: map_latitude!, longitude:map_longitude!)
    
        print(centerPoint)
        
       navigationController?.navigationBar.barTintColor = UIColor.green
        
        viewMap.frame =  CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        viewMap.delegate = self
        viewMap.baseMapType = .hybrid
        viewMap.daumMapApiKey = "6c92f6351cf2b138b045ba4b1b1ef0f3"
        
        //지금 위치 불러오기
        locationMager.delegate = self
        locationMager.requestAlwaysAuthorization()
        locationMager.startUpdatingLocation()
        viewMap.setMapCenter(MTMapPoint.init(geoCoord: centerPoint), zoomLevel: 2, animated: true)

        mapView(viewMap, updateCurrentLocation: MTMapPoint.init(geoCoord: centerPoint), withAccuracy:accurary)
    
        self.view.addSubview(viewMap)
        
        
    }
 

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    func mapView(_ mapView: MTMapView!, updateCurrentLocation location: MTMapPoint!, withAccuracy accuracy: MTMapLocationAccuracy) {
        
        
        
    }
    
    
    
    

}
