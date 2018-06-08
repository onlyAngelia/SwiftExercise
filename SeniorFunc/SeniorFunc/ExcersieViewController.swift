//
//  ExcersieViewController.swift
//  SeniorFunc
//
//  Created by yangxiuying on 2018/6/8.
//  Copyright © 2018年 lanjiying. All rights reserved.
//

import UIKit

struct User{
    
    let name :String
    let age:Int

}
extension User{
    func UserName() -> String {
        
    }
}
class ExcersieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let userArray = [User(name:"小明",age:18),User(name:"朱莉",age:14)]
        let stringArray = userArray.map{（var name in
            
        }
        
    }
    //
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
