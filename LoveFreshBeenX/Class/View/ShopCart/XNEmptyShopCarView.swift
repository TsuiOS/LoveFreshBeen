//
//  XNEmptyShopCarView.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/7/4.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

private extension Selector {
    
    static let buttonClick = #selector(XNEmptyShopCarView.buttonClick)
}

class XNEmptyShopCarView: UIView {
    
    private lazy var emptyImageView: UIImageView = {
        let emptyImageView = UIImageView(image: UIImage(named: "v2_shop_empty"))
        emptyImageView.contentMode = .Center
        return emptyImageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "亲,购物车空空的耶~赶紧挑选好吃的吧"
        titleLabel.font = UIFont.systemFontOfSize(16)
        titleLabel.textAlignment = .Center
        titleLabel.textColor = UIColor.colorWithCustom(150, g: 150, b: 150)
        return titleLabel
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "btn.png"), forState: .Normal)
        button.setTitle("去逛逛", forState: .Normal)
        button.setTitleColor(UIColor.colorWithCustom(100, g: 100, b: 100), forState: .Normal)
        button.addTarget(self, action: .buttonClick, forControlEvents: .TouchUpInside)
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(emptyImageView)
        addSubview(titleLabel)
        addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        emptyImageView.snp_makeConstraints { (make) in
            make.top.equalTo(self)
            make.centerX.equalTo(self)
        }
        
        titleLabel.snp_makeConstraints { (make) in
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.top.equalTo(emptyImageView.snp_bottom)
            make.height.equalTo(50)
        }
        
        button.snp_makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp_bottom)
            make.centerX.equalTo(self)
            make.height.equalTo(30)
            make.width.equalTo(150)
        }
        
    }
    
    func buttonClick() {
        let tabBarController = UIApplication.sharedApplication().keyWindow?.rootViewController as! XNMainTabBarController
        
        tabBarController.selectedIndex = 1
    }

}
