//
//  changeProfile.swift
//  fishing
//
//  Created by Yazz on 2016. 10. 20..
//  Copyright © 2016년 IMS. All rights reserved.
//

import UIKit

class changeProfile: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationBarDelegate  {
 
   
    var finishingInfor =  ["낚시대","릴","줄","루어"]


    
    @IBOutlet weak var myInfor:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        myInfor.delegate = self
        myInfor.dataSource = self
       
        
        
        navigationController?.navigationBar.barTintColor = UIColor.red
     
        
        
       navigationItem.title="프로필 편집"
        navigationItem.leftBarButtonItem = UIBarButtonItem (title: "back", style:.plain, target: self, action: #selector(backButton))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem (title: "setting", style:.plain, target: self, action: #selector(setting))
      
        
    }
        
    

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        
        return  [.portrait,.portraitUpsideDown]

    }
    
    
    
    func backButton(sender: UIBarButtonItem) {
        
        
        print("test")
    }
        
        //기능 추후 생각
    func setting(sender: UIBarButtonItem) {
        
        
        print("test")
    }
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 1){
            
            return "개인 정보"
        }else {
            
            return ""
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 1 ){
            
            return 50
            
        }else {
            
            
            return 0
        }
    }
    
    
    
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return finishingInfor.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = UITableViewCell()
        cell.textLabel?.text = finishingInfor[indexPath.row]
        return cell
 
    }
    
    
    
    
    //cell 크기
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
    
    return 50
    }
    



    
    
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
    }
}
