//
//  Theme.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/9.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

public let NavigationH: CGFloat = 64
public let ScreenWidth: CGFloat = UIScreen.mainScreen().bounds.size.width
public let ScreenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
public let ScreenBounds: CGRect = UIScreen.mainScreen().bounds
public let LFBGlobalBackgroundColor = UIColor.colorWithCustom(239, g: 239, b: 239)
public let LFBNavigationYellowColor = UIColor.colorWithCustom(253, g: 212, b: 49)
public let LFBTextGreyColol = UIColor.colorWithCustom(130, g: 130, b: 130)

public let HomeCollectionViewCellMargin: CGFloat = 10
public let HotViewMargin: CGFloat = 10
public let HomeTableHeadViewHeightDidChange = "HomeTableHeadViewHeightDidChange"
public let HomeCollectionTextFont = UIFont.systemFontOfSize(14)

/// 商品库存不足
public let GoodsInventoryProblem = "GoodsInventoryProblem"

/// 延迟在主线程执行函数
///
/// - parameter delta:    延迟时间
/// - parameter callFunc: 要执行的闭包
func delay(delta: Double, callFunc: ()->()) {
    
    dispatch_after(
        dispatch_time(DISPATCH_TIME_NOW, Int64(delta * Double(NSEC_PER_SEC))),
        dispatch_get_main_queue()) {
            
            callFunc()
    }
}