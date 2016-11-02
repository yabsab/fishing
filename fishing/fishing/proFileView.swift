//
//  proFileView.swift
//  fishing
//
//  Created by Yazz on 2016. 10. 19..
//  Copyright © 2016년 IMS. All rights reserved.
//

import UIKit

class proFileView: UIViewController, UINavigationBarDelegate {
//    @IBOutlet weak var myPhoto:UIImageView!
//    @IBOutlet weak var chagneProfile:UIButton!
    @IBOutlet weak var collectionEnvy:UICollectionView!
    

  
    
    var items = ["image1.png","image2.png","image3.png","image4.png","image5.png","image6.png","image7.png"]
    var image = [UIImage(named:"image1"),UIImage(named:"image2"), UIImage(named:"image3"),UIImage(named:"image4"),UIImage(named:"image5"), UIImage(named:"image6"),UIImage(named:"image7") ]
    
    
    
    let imageName = "testimage.jpg"
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = UIColor.green

        navigationItem.title="프로필"
        navigationItem.leftBarButtonItem = UIBarButtonItem (title: "back", style:.plain, target: self, action: #selector(backButton))

        
        setupCollectinView()
        profileMyphoto()
      
       
      
       
    }
    
    
    //backbutton
    
    func backButton (sender : UIBarButtonItem){
        
        print("sexy")
    }
    
    //콜렉션 뷰 delegate
    
    
    
    //initializing a collection view
    func setupCollectinView(){
        
        collectionEnvy.delegate = self
      
//        let layout = UICollectionViewFlowLayout()
//        collectionEnvy = UICollectionView(frame: view.frame, collectionViewLayout: layout)
//        collectionEnvy.backgroundColor = UIColor.red
       collectionEnvy.register(myProfile.self, forCellWithReuseIdentifier:"personData")
  
        view.addSubview(collectionEnvy)
//    
//    
    }
//    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        //세로모드
        return [.portrait,.portraitUpsideDown]
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func profileMyphoto()  {
       
//        let image = UIImage(named: imageName)
//        myPhoto.layer.cornerRadius = myPhoto.frame.width/2.0
//        myPhoto.layer.borderWidth = 2.0
//        myPhoto.layer.borderColor = UIColor.white.cgColor
//        myPhoto.clipsToBounds = true
//        myPhoto.image = image
        
        

    }
    
    
    @IBAction func chagneProfile(_ sender: AnyObject){
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc:UIViewController = storyboard.instantiateViewController(withIdentifier: "profileChange") as UIViewController
        
        present(vc, animated: false, completion: nil)
        
        
    }
   
}


extension proFileView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//     //specifying the number of section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        collectionEnvy.backgroundColor = UIColor.white
        return 5
    }
   
//    //cell number
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return image.count
    }
//    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "personData", for: indexPath) as! myProfile
        cell.awakeFromNib()
        return cell
    }
   
    
//이미지 호출 
    
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let personCell = cell as! myProfile
        
            
             personCell.allimage.image = image[indexPath.row]

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let collection = collectionEnvy!
        let viewWidth = collection.bounds.size.width
        let viewHeigth = collection.bounds.size.height
        print(viewWidth)
        print(viewHeigth)
        
        
        
        // 아이폰 사이즈 받아서 /3
        return CGSize(width: viewWidth/4, height: viewHeigth/5)
    
    
    
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        
        
        return 5.0
        
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        
        
        return 5.0
        
    }
    
    
   
   
}
