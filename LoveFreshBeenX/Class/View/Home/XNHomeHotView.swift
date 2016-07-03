//
//  XNHomeHotView.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/15.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit


private extension Selector {
    
    static let iconClick = #selector(XNHomeHotView.iconClick(_:))

}

class XNHomeHotView: UIView {
    
    
    private let iconW = (ScreenWidth - 2 * HotViewMargin) * 0.25
    private let iconH: CGFloat = 80;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 模型的set方法
    var headData: HeadData? {
    
        didSet {
            if headData?.icons?.count > 0 {
                
                if (headData?.icons?.count)! % 4 != 0 {
                    self.rows = (headData?.icons?.count)! / 4 + 1
                } else {
                    self.rows = (headData?.icons?.count)! / 4
                }
                
                var iconX: CGFloat = 0
                var iconY: CGFloat = 0
                
                for i in 0..<headData!.icons!.count {
                    iconX = CGFloat(i % 4) * iconW + HotViewMargin
                    iconY = iconH * CGFloat(i / 4)
                    let activitie: Activities = headData!.icons![i]

                    let icon = XNCustomButton(title: headData!.icons![i].name!, color: UIColor.blackColor(), fontSize: 13, imageWithURL: NSURL(string: activitie.img!)!, placeholderImageName: "icon_icons_holder")
                    icon.frame = CGRectMake(iconX, iconY, iconW, iconH-20)
                    let sizeWh = icon.currentImage?.size
                    
                    icon.sd_setImageWithURL(NSURL(string: activitie.img!)!, forState: UIControlState.Normal)
                    icon.imageView?.frame = CGRectMake(0, 0, (sizeWh?.width)!, (sizeWh?.height)!)
                    icon.tag = i
                    icon.addTarget(self, action: .iconClick, forControlEvents: .TouchUpInside)
                    addSubview(icon)
                }
            }
        
        }
    
    }
    
    // MARK: rows数量
    private var rows: Int = 0 {
        willSet {
        
            bounds = CGRectMake(0, 0, ScreenWidth, iconH * CGFloat(newValue))
        }
    }
    
    
    func iconClick(button: UIButton) {
    
        print(button.tag)
    }
    
}
