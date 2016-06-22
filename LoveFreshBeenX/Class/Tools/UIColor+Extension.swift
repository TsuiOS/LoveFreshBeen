//
//  UIColor+Extension.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/13.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

extension UIColor {


    class func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(256))
        let g = CGFloat(arc4random_uniform(256))
        let b = CGFloat(arc4random_uniform(256))
        return UIColor.colorWithCustom(r, g: g, b: b)
    }
    
    class func colorWithCustom(r: CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }

}