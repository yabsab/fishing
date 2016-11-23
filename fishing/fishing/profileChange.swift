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
        tbMyinformation.allowsSelection = false

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
    
    
//    // 헤더title
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//        
//        switch section {
//        case 0:
//            
//            return""
//            
//        case 1:
//            
//            
//            return"개인정보"
//        default:
//             return ""
//        }
//
//        
//        
//    }
    
    
 //그룹 머릿말 크기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
    
        switch section {
        case 0:
            return 130
 
        case 1:
            
            return 0
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
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if (section == 0) {
           // 뷰
            let oneView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
            oneView.backgroundColor = UIColor.red
            
            //버튼
            let btPhoto = UIButton(frame: CGRect(x: tableView.frame.width/2-40, y:75, width: 50, height: 75))
            
            btPhoto.backgroundColor = UIColor.yellow
           btPhoto.setTitle("프로필 사진 바꾸기", for: UIControlState.normal)
                btPhoto.titleLabel!.font = UIFont.systemFont(ofSize: 13)
            btPhoto.setTitleColor(UIColor.blue, for: UIControlState.normal)
            btPhoto.sizeToFit()
            
            //image view 
            
            let ivPhoto : UIImageView = UIImageView (frame: CGRect(x :tableView.frame.width/2-23, y: 10, width : 65, height :65 ))
            ivPhoto.backgroundColor = UIColor.white
            
            ivPhoto.image = UIImage(named: "testimage.jpg")
            
            oneView.addSubview(btPhoto)
            oneView.addSubview(ivPhoto)
            
            btPhoto.addTarget(self, action: #selector(btPhotoPopup),  for: .touchUpInside)
            
            return oneView
  
            
            
            
            
        }else if(section == 1) {
            
            let oneView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            let lbTitle1 = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.frame.width, height: 20))
           lbTitle1.textColor = UIColor.black
            lbTitle1.font = lbTitle1.font.withSize(12)
            lbTitle1.text = "개인 정보"
            oneView.addSubview(lbTitle1)
            

        return oneView

        }else {
            
             let oneView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            return oneView

        }

    }
    
    
    
    
    func btPhotoPopup(sender: UIButton){
        
        let alert = UIAlertController(title: nil , message: "프로필 사진 바꾸기", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        
        
        //사진 삭제하기
        let ACdeletePhoto = UIAlertAction(title: "사진 삭제하기" , style: .default, handler: {
            
            
            (alert: UIAlertAction!) -> Void in
            
            print("delete")
            
            
        })
        
        //사진 삭제하기
        let ACtakePhoto = UIAlertAction(title: "사진 찍기" , style: .default, handler: {
            
            
            (alert: UIAlertAction!) -> Void in
            
            print("takepic")
        
            })
        
        let ACtakelib = UIAlertAction(title: "라이브러리에서 선택" , style: .default, handler: {
            
            
            (alert: UIAlertAction!) -> Void in
            
            print("takepic")
            
        })
        
        
        let ACcancel = UIAlertAction(title: "취소" , style: .cancel, handler: {
            
            
            (alert: UIAlertAction!) -> Void in
            
            print("takepic")
            
        })
        
        
        // add an action (button)
       alert.addAction(ACdeletePhoto)
       alert.addAction(ACtakePhoto)
       alert.addAction(ACtakelib)
       alert.addAction(ACcancel)
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        
        
        print ("teset")
        
    }


}







