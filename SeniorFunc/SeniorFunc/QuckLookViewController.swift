//
//  QuckLookViewController.swift
//  SeniorFunc
//
//  Created by yangxiuying on 2018/6/4.
//  Copyright © 2018年 lanjiying. All rights reserved.
//

import UIKit

protocol Arbitrary {
    static func arbitrary()->Self
}

extension Int: Arbitrary{
    static func arbitrary() -> Int {
        return Int(arc4random())
    }
}

class QuckLookViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

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
