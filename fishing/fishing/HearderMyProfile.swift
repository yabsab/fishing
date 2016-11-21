//
//  HearderMyProfile.swift
//  fishing
//
//  Created by Yazz on 2016. 11. 18..
//  Copyright © 2016년 IMS. All rights reserved.
//

import UIKit

protocol HearderMyProfileDelegate: class {
    
    func btClickHearderMyProfile(_ view: UIView)
    
    
    
    
}




class HearderMyProfile: UICollectionReusableView {
    
    weak var delegate: HearderMyProfileDelegate?
    
    @IBOutlet weak var lbFishingstic:UILabel!
    @IBOutlet weak var lbFishingline:UILabel!
    @IBOutlet weak var lbFishingreel:UILabel!
    @IBOutlet weak var lbFishinglure:UILabel!
    
    
    @IBAction func btgotoChangeProfile(_ sender: AnyObject) {
        
        self.delegate?.btClickHearderMyProfile(self)
        
        
    }
    
    
    
    
}



