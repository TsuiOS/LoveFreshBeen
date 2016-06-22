//
//  XNMineTableHeadView.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/10.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit
import SnapKit

class XNMineTableHeadView: UIView {

    //我的订单
    private lazy var orderButton: XNCustomButton = XNCustomButton(title: "我的订单",
                                                                  color: UIColor.colorWithCustom(80, g: 80, b: 80),
                                                                  fontSize: 13,
                                                                  imageName: "v2_my_order_icon")
    //优惠券
    private lazy var couponButton: XNCustomButton = XNCustomButton(title: "优惠券",
                                                                   color: UIColor.colorWithCustom(80, g: 80, b: 80),
                                                                   fontSize: 13,
                                                                   imageName: "v2_my_coupon_icon")
    //我的消息
    private lazy var messageButton: XNCustomButton = XNCustomButton(title: "我的消息",
                                                                    color: UIColor.colorWithCustom(80, g: 80, b: 80),
                                                                    fontSize: 13,
                                                                    imageName: "v2_my_message_icon")
    
    
  
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        buildUI()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension XNMineTableHeadView {
   
    ///  自定义布局
    private func buildUI() {
        backgroundColor = UIColor.whiteColor()
        
        addSubview(orderButton)
        addSubview(couponButton)
        addSubview(messageButton)
        

        //自动布局
        orderButton.snp_makeConstraints { (make) in
            make.left.bottom.equalTo(self)
            make.top.equalTo(self.snp_top)
        }
        couponButton.snp_makeConstraints { (make) in
            make.top.width.height.equalTo(orderButton)
            make.left.equalTo(orderButton.snp_right)
            
        }
        messageButton.snp_makeConstraints { (make) in
            make.top.width.height.equalTo(couponButton)
            make.left.equalTo(couponButton.snp_right)
            make.right.equalTo(self.snp_right)
        }
        //分割试图
        let sep1 = sepView()
        let sep2 = sepView()
        
        addSubview(sep1)
        addSubview(sep2)
        
        let w = 1
        let scale = 0.8
        
        sep1.snp_makeConstraints { (make) in
            make.left.equalTo(orderButton.snp_right)
            make.centerY.equalTo(self)
            make.width.equalTo(w)
            make.height.equalTo(self).multipliedBy(scale)
        }
        sep2.snp_makeConstraints { (make) in
            make.left.equalTo(couponButton.snp_right)
            make.centerY.equalTo(self)
            make.width.equalTo(w)
            make.height.equalTo(self).multipliedBy(scale)
        }
    
    }
    
    /// 创建分隔视图
    private func sepView() -> UIView {
        let v = UIView()
        v.backgroundColor = UIColor.grayColor()
        v.alpha = 0.3
        return v
    }
}

