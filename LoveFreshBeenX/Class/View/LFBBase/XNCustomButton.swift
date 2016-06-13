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
        
        
        // center image
        var center: CGPoint = (imageView?.center)!
        center.x = width/2
        center.y = (imageView?.frame.size.height)!/2
        imageView?.center = center
        
        // center text
        var newFrame = titleLabel?.frame
        newFrame?.origin.x = 0
        newFrame?.origin.y = CGRectGetMaxY((imageView?.frame)!) + 5
        newFrame?.size.width = width
        
        titleLabel?.frame = newFrame!
        titleLabel?.textAlignment = .Center
        
    }

}
