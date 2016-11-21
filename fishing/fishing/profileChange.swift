//
//  profileChange.swift
//  fishing
//
//  Created by Yazz on 2016. 11. 21..
//  Copyright © 2016년 IMS. All rights reserved.
//

import UIKit

class profileChange: UIViewController, UINavigationBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tbMyinformation : UITableView!
    
    var fishinginfor = [ "낚시대","낚시줄","루어","릴"]
    var myinfor = ["ID", "이메일","즐겨찾는 장소"]
    var imIcon = ["imProfile.png","imEmail.png","imBookmark.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbMyinformation.dataSource = self
        tbMyinformation.delegate = self
        

        navigationItem.title="프로필 편집"
        navigationItem.leftBarButtonItem = UIBarButtonItem (title: "취소", style:.plain, target: self, action: #selector(backButton))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem (title: "완료", style:.plain, target: self, action: #selector(setting))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
   
    func backButton (_ sendr: AnyObject) {
        
        print ("test")
        
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let vc:UIViewController = storyboard.instantiateViewController(withIdentifier: "mainTabView") as UIViewController
        present (vc, animated: false, completion: nil)
        
        
        
    }
    
    func setting (_ sender: AnyObject){
        
        let storyboard : UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
        let vc:UIViewController = storyboard.instantiateViewController(withIdentifier: "mainTabView") as UIViewController
        present (vc, animated: false, completion: nil)
        
        print ("test")

    }
    
    //table 이미지
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = UITableViewCell()
        
        switch indexPath.section {
        case 0 :

            cell.textLabel?.text = fishinginfor[indexPath.row]
            return cell
        case 1:
         
            let imageName = UIImage(named: imIcon[indexPath.row])
            cell.imageView?.sizeToFit()
         
            
            
             cell.imageView?.image  = imageName
             cell.textLabel?.text = myinfor[indexPath.row]
        return cell
            
        default:
            return cell

        }

    }
    
    
    // 헤더title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        switch section {
        case 0:
            
            return""
            
        case 1:
            
            
            return"개인정보"
        default:
             return ""
        }

        
        
    }
    
    
 //그룹 머릿말 크기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
    
        switch section {
        case 0:
            return 130
 
        case 1:
            
            return 20
      
        default:
            return 0
        }
    }
    
    
    
    //그룹별 table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        switch section {
            
        case 0:
            
            return fishinginfor.count
        case 1:
            return myinfor.count

        default:
            return 0
        }
        
        
    }
    
    // 헤더 버튼 및 이미지 뷰 설정
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        
//        
//    }
    
    
    
    
}







