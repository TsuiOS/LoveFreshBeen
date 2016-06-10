//
//  XNHeaderView.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/9.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

class XNHeaderView: UIView {

    private var pageScrollView: XNPageScrollView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildPageScrollView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildPageScrollView() {
    
        pageScrollView = XNPageScrollView(frame: CGRectMake(0, 0, ScreenWidth, 150), placeholder: UIImage(named: "v2_placeholder_full_size")!)
        pageScrollView?.imageURLString = ["1","2","3","4","5"]
        addSubview(pageScrollView!)
    }

}
