//
//  UIButton+Extension.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/13.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

extension XNCustomButton {
    
    ///  便利构造函数
    ///
    ///  - parameter title:                标题
    ///  - parameter color:                颜色
    ///  - parameter fontSize:             字体
    ///  - parameter imageWithURL:         图片链接
    ///  - parameter placeholderImageName: 占位图
    ///
    ///  - returns: 自定义Button
    convenience init(title: String, color: UIColor,fontSize: CGFloat, imageWithURL: NSURL, placeholderImageName: String) {
        self.init()
        setImage(UIImage(named: placeholderImageName), forState: UIControlState.Normal)
//        sd_setImageWithURL(imageWithURL, forState: UIControlState.Normal, placeholderImage: UIImage(named: placeholderImageName))
        imageView?.contentMode = UIViewContentMode.ScaleAspectFill
        setTitle(title, forState: .Normal)
        setTitleColor(color, forState: .Normal)
        titleLabel?.font = UIFont.systemFontOfSize(fontSize)
        
        sizeToFit()
    }
    
    ///  便利构造函数
    ///
    ///  - parameter title:     标题
    ///  - parameter color:     颜色
    ///  - parameter fontSize:  字体
    ///  - parameter imageName: 图片名
    ///
    ///  - returns: 自定义button
    convenience init(title: String, color: UIColor,fontSize: CGFloat, imageName: String) {
        self.init()
        setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        setTitle(title, forState: .Normal)
        setTitleColor(color, forState: .Normal)
        titleLabel?.font = UIFont.systemFontOfSize(fontSize)
        
        sizeToFit()
    }

}
