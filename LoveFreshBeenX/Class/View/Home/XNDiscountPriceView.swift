//
//  XNDiscountPriceView.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/23.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

class XNDiscountPriceView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // 构造便利函数
    convenience init(price: String?, marketPrice: String?) {
        self.init()
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
}
