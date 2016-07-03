//
//  XNHeaderView.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/9.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

class XNHomeHeadView: UIView {

    private var pageScrollView: XNPageScrollView?
    private var hotView: XNHomeHotView?
    
    var tableHeadViewHeight: CGFloat = 0 {
        willSet {
            NSNotificationCenter.defaultCenter().postNotificationName(HomeTableHeadViewHeightDidChange, object: newValue)
            frame = CGRectMake(0, -newValue, ScreenWidth, newValue)
        }
    }
    
    
    var headData: XNHeadResources? {
        didSet {
            pageScrollView?.headData = headData
            hotView?.headData = headData?.data
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildPageScrollView()
        buildHotView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildPageScrollView() {
    
        pageScrollView = XNPageScrollView(frame: CGRectZero, placeholder: UIImage(named: "v2_placeholder_full_size")!)
        addSubview(pageScrollView!)
    }
    
    private func buildHotView() {
        hotView = XNHomeHotView()
        hotView?.backgroundColor = UIColor.whiteColor()
        addSubview(hotView!)
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pageScrollView?.frame = CGRectMake(0, 0, ScreenWidth, 150)
        hotView?.frame = CGRectMake(0, CGRectGetMaxY(pageScrollView!.frame), ScreenWidth, 80)
        
        tableHeadViewHeight = CGRectGetMaxY(hotView!.frame)
    }

}
