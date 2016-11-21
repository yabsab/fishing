//
//  mypictureViewCell.swift
//  fishing
//
//  Created by Yazz on 2016. 11. 10..
//  Copyright © 2016년 IMS. All rights reserved.
//

import UIKit

class mypictureViewCell: UICollectionViewCell {
    
    static let idendifier = "mypictureViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //        self.profileImageView.layer.masksToBounds = true
        //        self.profileImageView.layer.cornerRadius = 30.0
        //        // Initialization code
    }
    
}
