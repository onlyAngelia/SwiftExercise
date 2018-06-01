//
//  ViewController.swift
//  SeniorFunc
//
//  Created by yangxiuying on 2018/5/31.
//  Copyright © 2018年 lanjiying. All rights reserved.
//

import UIKit

extension Array{
    
    func map<T>(_ transform:(Element) ->T) -> [T] {
        var result:[T] = []
        for x in self {
            result.append(transform(x))
        }
        return result
        
    }
    
    
    func filter(_ includeElement:(Element)-> Bool) -> [Element] {
        var result:[Element] = []
        for x in self where includeElement(x) {
            result.append(x)
        }
        return result
    }
    
//    func reduce<T>(_ initial:T,combine:(T,Element)->T)->T{
//        var result = initial;
//        for x in self {
//            result = combine(result,x)
//        }
//        return result
//    }
    
}
struct City {
    
    let name:String
    let population:Int
    
}
extension City{
    func scalingPopulation() -> City {
        return City(name: name, population: population*1000)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //map、filter、reduce实践
        let paris = City(name: "Paris", population: 2241)
        let madrid = City(name: "Madrid", population: 3165)
        let amsterdam = City(name: "Amsteram", population: 827)
        let berlin = City(name: "Berlin", population: 3562)
        let cities = [paris,madrid,amsterdam,berlin]
        cities.filter{$0.population > 1000}.map{$0.scalingPopulation()}.reduce("City:Population"){
            result,c in return result + "\n" + "\(c.name):\(c.population)"
        }
       
    }
    
    func compute(array:[Int],transfor:(Int) -> Int) -> [Int] {
        var result:[Int] = []
        for x in array {
            result.append(transfor(x))
        }
        return result;
        
    }
    
   //泛型
    func genericCompute<T>(array:[Int],transform:(Int)->T) -> [T] {
        var result:[T] = []
        for x in array{
            result.append(transform(x))
        }
        return result
    }
    
    func genericCompute2<T>(array:[Int],transform:(Int)->T) -> [T] {
        return array.map(transform)
    }
    
    //reduce计算加减乘除
//    func productUsingReduce(integers:[Int]) -> Int {
//        return integers.reduce(1, combine: *)
//    }
    
  
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

