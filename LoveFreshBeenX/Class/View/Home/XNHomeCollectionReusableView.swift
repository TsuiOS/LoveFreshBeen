//
//  XNHomeCollectionReusableView.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/7/1.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

class XNHomeCollectionReusableView: UICollectionReusableView {
        
}
class HomeCollectionFooterView: UICollectionReusableView {
    
    private let titleLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.text = "查看更多商品 >"
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.font = UIFont.systemFontOfSize(16)
        titleLabel.textColor = UIColor.colorWithCustom(150, g: 150, b: 150)
        titleLabel.frame = CGRectMake(0, 0, ScreenWidth, 60)
        
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hideLabel() {
        self.titleLabel.hidden = true
    }
    
    func showLabel() {
        self.titleLabel.hidden = false
    }
    
}

class HomeCollectionHeaderView: UICollectionReusableView {
    
    private let titleLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.text = "新鲜热卖"
        titleLabel.textAlignment = .Left
        titleLabel.font = UIFont.systemFontOfSize(14)
        titleLabel.frame = CGRectMake(10, 0, 200, 20)
        titleLabel.textColor = UIColor.colorWithCustom(150, g: 150, b: 150)
        
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}