//
//  ViewController.swift
//  CoreImage
//
//  Created by yangxiuying on 2018/5/30.
//  Copyright © 2018年 lanjiying. All rights reserved.
//


import UIKit

typealias Fliter = CIImage -> CIImage

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.myFilter
        
    }
    override func myFilter()->Fliter{
    
        let url = URL(string: "http://via.placeholder.com/500x500")!
        let image = CIImage(contentsOf: url)
        let radius = 5.0
        let color = UIColor.red.withAlphaComponent(0.2)
        let blurredImage = blur(radius: radius)(image)
        let overlaidImage = overlay(color: color)(blurredImage)
        let result = overlay(color: color)(blur(radius: radius)(image))
    }
    func compose (fliter1:@escaping Filter,with filter2:@escaping Filter) -> Filter {
        return {image in filter2(filter1(image))}
    }
    //模糊处理
    func blur(radius:Double) -> Fliter {
        
        return{
            image in let parameters:[String:Any] = [kCIInputRadiusKey:radius,kCIInputImageKey: image]
            guard let filter = CIFilter(name:"CIGaussianBlur",withInputParameters:parameters) else {
                fatalError()}
            guard let outputImage = filter.outputImage else {fatalError()}
            return outputImage
        }
    }
    
    //颜色组合
    func generate(color:UIColor) -> Filter {
        return { _ in
            let parameters = [kCIInputColorKey: CIColor(cgColor: color.cgColor)]
            guard let filter = CIFilter(name: "CIConstantColorGenerator",
                                        withInputParameters: parameters)
                else { fatalError() }
            guard let outputImage = filter.outputImage
                else { fatalError() }
            return outputImage
        }
    }

    //合成滤镜
    func compositeSourceOver(overlay:CIImage) -> Filter {
        return { image in
            let parameters = [
            kCIInputBackgroundImageKey: image,
            kCIInputImageKey: overlay
            ]
            guard let filter = CIFilter(name: "CISourceOverCompositing",
                                        withInputParameters: parameters)
                else { fatalError() }
            guard let outputImage = filter.outputImage
                else { fatalError() }
            return outputImage.cropped(to: image.extent)
        }
    }
    
    func overlay(color: UIColor) -> Filter {
        return { image in
            let overlay = generate(color: color)(image).cropped(to: image.extent)
            return compositeSourceOver(overlay: overlay)(image)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

