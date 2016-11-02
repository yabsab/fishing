//
//  myProfile.swift
//  fishing
//
//  Created by Yazz on 2016. 11. 1..
//  Copyright © 2016년 IMS. All rights reserved.
//

import UIKit

class myProfile: UICollectionViewCell {
    
//    @IBOutlet weak var allimage:UIImageView!
    var allimage: UIImageView!
    
    
    
    override func awakeFromNib() {
        
        allimage = UIImageView(frame: contentView.frame)
        allimage.contentMode = .scaleToFill
        allimage.clipsToBounds = true
        contentView.addSubview(allimage) //ui eleemnts to the contentview not the cell 
//        
    }
    
    
    
}
