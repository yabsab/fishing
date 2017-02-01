//
//  profileChange.swift
//  fishing
//
//  Created by Yazz on 2016. 11. 21..
//  Copyright © 2016년 IMS. All rights reserved.
//

import UIKit
import AssetsLibrary

class profileChange: UIViewController, UINavigationBarDelegate, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var tbMyinformation : UITableView!
    
   var arrayfishinginfor: [String] = ["","","","",""]
   var arrayMyinfor: [String] = ["","",""]
    
    var dicInfor : Dictionary <String, String> = [:]
    
    var ivPhoto = UIImageView()
    let picpic = UIImagePickerController()
    
    
    var fishinginfor = ["낚시대","낚시줄","루어","릴","상태"]
    var tes11t = ["","","","",""]
    var myinfor = ["ID", "이메일","즐겨찾는 장소"]
    var imIcon = ["imProfile.png","imEmail.png","imBookmark.png"]
    var fishinIcon = ["imStick.png","imThread.png","imLures.png","imReel.png",
                      "imInforicon.jpg"]
    
    var arrayOfTextFields:[UITextField] = []
    var arrayOfTextFields1:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
        tbMyinformation.dataSource = self
        tbMyinformation.delegate = self
        
        
        
       
        navigationItem.title="프로필 편집"
        navigationItem.leftBarButtonItem = UIBarButtonItem (title: "취소", style:.plain, target: self, action: #selector(backButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem (title: "완료", style:.plain, target: self, action: #selector(setting))
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileChange.dismissKeyboard))
   
        
        view.addGestureRecognizer(tap)
        
    }
    
  
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
    

    func firstResponderAction(){
        
         self.view.endEditing(true);
        
    }
    
    

    
    
    //table 이미지
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        tbMyinformation.register(profileChangeCell.self, forCellReuseIdentifier: "cell")

        
        let cell = tbMyinformation.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! profileChangeCell
      
        let screenSize: CGRect = cell.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let inputTxFiled = UITextField(frame: CGRect(x: 60, y: 0, width: screenWidth-59, height: screenHeight))
        
        inputTxFiled.clearButtonMode =  UITextFieldViewMode.whileEditing
        inputTxFiled.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
       
        
    switch indexPath.section {
        
  // 그룹 1 낚시대, 낚시줄, 루어, 릴, 상태 아이템 입력
        
        
        case 0 :
     
 
        let imageName = UIImage(named: fishinIcon[indexPath.row])
    
        if (fishinginfor[0] == "낚시대" && fishinginfor[1] == "낚시줄" && fishinginfor[2] == "루어" && fishinginfor[3] == "릴" && fishinginfor[4] == "상태"){

            cell.contentView.addSubview(inputTxFiled)
            cell.imageView?.image  = imageName
            inputTxFiled.text = fishinginfor[indexPath.row]
            inputTxFiled.clearsOnBeginEditing = true
            inputTxFiled.font = UIFont(name: "Kailasa", size: 13)
            inputTxFiled.endEditing(true)
   
           
            
           if let textfield  = cell.contentView.subviews[0] as? UITextField {

      
           dicInfor = ["test" : textfield.text!]
          
            Savedata(wowowo: dicInfor)
        }

 
               
                
            
 
        }else {
            

            inputTxFiled.text = fishinginfor[indexPath.row]
            cell.contentView.addSubview(inputTxFiled)
            cell.imageView?.image  = imageName
            inputTxFiled.font = UIFont(name: "Kailasa", size: 13)
            inputTxFiled.endEditing(true)
            
    
        }
        
        tbMyinformation?.sectionIndexBackgroundColor? = UIColor.clear


        return cell

// 그룹 1 ID, 이메일, 즐겨찾는 장소 (DB에 불러 올 수 있도록) 즐겨찾기는 자주 가든거 3군대 또는 지역 하나로
        
        case 1:
         
         let imageName = UIImage(named: imIcon[indexPath.row])
//         cell.imageView?.sizeToFit()
         inputTxFiled.font = UIFont(name: "Kailasa", size: 13)
         
         inputTxFiled.delegate = self
         
         
         inputTxFiled.text = myinfor[indexPath.row]
         cell.imageView?.image  = imageName
         cell.contentView.addSubview(inputTxFiled)
         print("case 1 ",myinfor[indexPath.row])
         inputTxFiled.endEditing(true)
  
         tbMyinformation?.sectionIndexBackgroundColor? = UIColor.clear
         
         for i in 0 ..< 3 {
            
            arrayMyinfor[i] = myinfor[i]
          
         }
        
         
         return cell
        
            
        default:
            return cell

        }

    }
    
    
    
    
    //profile Change 오른쪽 버튼
    
    func setting (_ sender: AnyObject){

        tbMyinformation?.reloadData()

    }
    
    
    func Savedata(wowowo : Dictionary<String, Any>){
        
        var i = 0
  
        for value in wowowo.values {
             arrayfishinginfor[i] = value as! String
             print("array:\(arrayfishinginfor[i])")
            
            i += 1
            
            print("i:\(i)")

        }
      
        
    }
    
    
    
    
    
    // 함수 일단 대기
    
    func getTablecellData(test:NSArray) {
        
        
        
    }
    

    
    
    
    @IBAction func textField(_ sender: AnyObject) {
        self.view.endEditing(true);
    }
    
    
    
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
    

    func call_data(data:NSArray){
        
        
        
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
            
            ivPhoto = UIImageView (frame: CGRect(x :tableView.frame.width/2-23, y: 10, width : 65, height :65 ))
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
    
    
    

    
    
    
    
    
    
    
    
    
    func btPhotoPopup(sender: AnyObject){
        
        let alert = UIAlertController(title: nil , message: "프로필 사진 바꾸기", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        
        
        //사진 삭제하기
        let ACdeletePhoto = UIAlertAction(title: "사진 삭제하기" , style: .default, handler: {
            
            
            (alert: UIAlertAction!) -> Void in
            
            //이부분 수정 하기 2016.12.14
            self.ivPhoto.image = UIImage(named: "testimage.jpg")
            
            print("delete")
   
        })
        
        
        
        
        //사진 촬영
        let ACtakePhoto = UIAlertAction(title: "사진 찍기" , style: .default, handler: {
            
            
            (alert: UIAlertAction!) -> Void in

            
            let storyboard : UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
            let vc:UIViewController = storyboard.instantiateViewController(withIdentifier: "profileCameraView") as UIViewController
            self.present (vc, animated: false, completion: nil)

            
//            self.picpic.delegate = self
//            
//            self.picpic.sourceType = .camera
//           
//            self.present(self.picpic, animated: true, completion: nil)
//            
            print("takepic")
        
            })
        
         //라이브러리에서 선택
        
        let ACtakelib = UIAlertAction(title: "라이브러리에서 선택" , style: .default, handler: {
            
            
            (alert: UIAlertAction!) -> Void in
            
           
            self.picpic.delegate = self
            self.picpic.sourceType = .photoLibrary
            self.present(self.picpic, animated: true, completion: nil)
            
            
            
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


//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            ivPhoto.contentMode = .scaleToFill
//            ivPhoto.image = pickedImage
//        }
//        
//        picker.dismiss(animated: true, completion: nil)
//    }
//    
    
       
}








