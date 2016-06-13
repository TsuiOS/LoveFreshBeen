//
//  XNMineHeadView.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/10.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

private extension Selector {

    static let setUpBtnClick = #selector(XNMineHeadView.setUpBtnClick(_:))

}

class XNMineHeadView: UIImageView {
    
    let setUpBtn: UIButton = UIButton(type: .Custom)
    let iconView: IconView = IconView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        image = UIImage(named: "v2_my_avatar_bg")
        setUpBtn.setImage(UIImage(named: "v2_my_settings_icon"), forState: .Normal)
        setUpBtn.addTarget(self, action: Selector.setUpBtnClick, forControlEvents: .TouchUpInside)
        addSubview(setUpBtn)
        addSubview(iconView)
        
        self.userInteractionEnabled = true
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let  iconViewWH: CGFloat = 150
        iconView.frame = CGRectMake((width - 150)/2, 30, iconViewWH, iconViewWH)
        setUpBtn.frame = CGRectMake(width - 50, 10, 50, 50)
    }
    
    func setUpBtnClick(sender: UIButton) {
        print("buttonClick")
    }

}

class IconView: UIView {
    
    // 懒加载
    private lazy var iconImageView: UIImageView = UIImageView(image: UIImage(named: "v2_my_avatar"))
    
    private lazy var phoneNum: UILabel = {
        
        let label = UILabel()
        label.text = "13280459899"
        label.font = UIFont.boldSystemFontOfSize(18)
        label.textColor = UIColor.whiteColor()
        label.textAlignment = .Center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(iconImageView)
        addSubview(phoneNum)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.frame = CGRectMake((width - iconImageView.width)/2, 0, iconImageView.width, iconImageView.height)
        
        phoneNum.frame = CGRectMake(0, CGRectGetMaxY(iconImageView.frame) + 5, width, 30)
    }
    
    
}