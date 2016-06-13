//
//  UIBarButtonItem+Exttension.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/9.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

enum ItemButtonType: Int {
    case Left = 0
    case Right = 1
}

extension UIBarButtonItem {
    
    ///  便利构造函数
    ///
    ///  - parameter imageName: 图像名
    ///  - parameter title:     文字
    ///  - parameter target:    监听对象
    ///  - parameter action:    监听对象名
    ///
    ///  - returns: UIBarButtonItem
    convenience init(imageName: String?, title: String, target: AnyObject?, action: Selector) {
        
        let button = XNCustomButton(title: title, color: UIColor.blackColor(), fontSize: 10, imageName: imageName!)
        button.frame = CGRectMake(0, 0, 50, 44)
        
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        self.init(customView: button)
    }
    

}
