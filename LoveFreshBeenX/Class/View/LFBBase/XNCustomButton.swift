//
//  XNCustomButton.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/13.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

class XNCustomButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margin: CGFloat = 5
        let buttonH = (imageView?.height)! + (titleLabel?.height)!    
        let imageY = (height - buttonH - margin) / 2
        
        // center image
        imageView?.center = CGPointMake(width/2, 0)
        imageView?.frame.origin.y = imageY
        
        // center text
        titleLabel?.frame.origin = CGPointMake(0, CGRectGetMaxY((imageView?.frame)!) + margin)
        titleLabel?.frame.size = CGSizeMake(width, (titleLabel?.height)!)

        titleLabel?.textAlignment = .Center
        
    }
    
}
