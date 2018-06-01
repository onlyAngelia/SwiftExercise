//
//  ViewController.swift
//  OptionalType
//
//  Created by yangxiuying on 2018/5/31.
//  Copyright © 2018年 lanjiying. All rights reserved.
//

import UIKit

infix operator ??

func ??<T>(optional:T?,defalutValue:T)->T{
    if let x = optional {
        return x
    }else{
        return defalutValue
    }
}
    
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cities = ["Paris":2241,"Madrid":3165,"Amsterdam":827,"Berlin":3562]
        //可绑定机制
        if let madridPopulation = cities["Madrid"]{
            print("The population of Madrid is\(madridPopulation * 1000)")
        }else{
            print("Unkown city:Madrid")
        }
    
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

