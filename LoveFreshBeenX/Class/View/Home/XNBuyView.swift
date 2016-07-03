//
//  XNBuyView.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/25.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

private extension Selector {


    static let addGoodsButtonClick = #selector(XNBuyView.addGoodsButtonClick)
    static let reduceGoodsButtonClick = #selector(XNBuyView.reduceGoodsButtonClick)
    
}

class XNBuyView: UIView {
    
    
    ///  添加按钮
    private lazy var addGoodsButton: UIButton = {
        let addGoodsButton = UIButton(type: .Custom)
        addGoodsButton.setImage(UIImage(named: "v2_increase"), forState: .Normal)
        addGoodsButton.addTarget(self, action: .addGoodsButtonClick, forControlEvents: .TouchUpInside)
        
        return addGoodsButton
    }()
    
    ///  删除按钮
    private lazy var reduceGoodsButton: UIButton = {
        let reduceGoodsButton = UIButton(type: .Custom)
        reduceGoodsButton.setImage(UIImage(named: "v2_reduce"), forState: .Normal)
        reduceGoodsButton.addTarget(self, action: .reduceGoodsButtonClick, forControlEvents: .TouchUpInside)
        reduceGoodsButton.hidden = true
        return reduceGoodsButton
    }()
    
    ///  购买数量
    private lazy var buyCountLabel: UILabel = {
    
        let buyCountLabel = UILabel()
        buyCountLabel.hidden = true
        buyCountLabel.textColor = UIColor.blackColor()
        buyCountLabel.textAlignment = .Center
        buyCountLabel.font = HomeCollectionTextFont
        return buyCountLabel
    }()
    ///  补货中
    private lazy var supplementLabel: UILabel = {
        
        let supplementLabel = UILabel()
        supplementLabel.text = "补货中"
        supplementLabel.hidden = true
        supplementLabel.textColor = UIColor.redColor()
        supplementLabel.textAlignment = .Right
        supplementLabel.font = HomeCollectionTextFont
        return supplementLabel
    }()
    
    private var buyNumber: Int = 0 {
        willSet {
            if newValue > 0 {
                reduceGoodsButton.hidden = false
                buyCountLabel.text = "\(newValue)"
            } else {
                reduceGoodsButton.hidden = true
                buyCountLabel.hidden = false
                buyCountLabel.text = "\(newValue)"
            }
            
        }
    }

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(addGoodsButton)
        addSubview(reduceGoodsButton)
        addSubview(buyCountLabel)
        addSubview(supplementLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bugCountWidth: CGFloat = 25
        
        addGoodsButton.snp_makeConstraints { (make) in
            make.top.right.bottom.equalTo(self)
        }
        buyCountLabel.snp_makeConstraints { (make) in
            make.top.bottom.equalTo(self)
            make.right.equalTo(addGoodsButton.snp_left)
            make.width.equalTo(bugCountWidth)
        }
        reduceGoodsButton.snp_makeConstraints { (make) in
            make.right.equalTo(buyCountLabel.snp_left)
            make.top.equalTo(addGoodsButton)
        }
        supplementLabel.snp_makeConstraints { (make) in
            make.top.right.bottom.equalTo(self)
        }
        
    }
    
    ///  商品模型set方法
    var goods: XNGoods? {
    
        didSet {
            buyNumber = goods!.userBuyNumber
            if goods?.number <= 0 {
                showSupplementLabel()
            } else {
                hideSupplementLabel()
            }
            if buyNumber == 0 {
                reduceGoodsButton.hidden = true
                buyCountLabel.hidden = true
            }else {
                reduceGoodsButton.hidden = false
                buyCountLabel.hidden = false
            }
            
            
        }
    
    }

    
    /// 显示补货中
    private func showSupplementLabel() {
        supplementLabel.hidden = false
        addGoodsButton.hidden = true
        reduceGoodsButton.hidden = true
        buyCountLabel.hidden = true
    }
    
    /// 隐藏补货中,显示添加按钮
    private func hideSupplementLabel() {
        supplementLabel.hidden = true
        addGoodsButton.hidden = false
        reduceGoodsButton.hidden = false
        buyCountLabel.hidden = false
    }

    
    //MARK: - action
    func addGoodsButtonClick() {
        
        if buyNumber >= goods?.number {
            NSNotificationCenter.defaultCenter().postNotificationName(GoodsInventoryProblem, object: goods?.name)
            return
        }
        
        reduceGoodsButton.hidden = false
        buyNumber += 1
        goods?.userBuyNumber = buyNumber
        buyCountLabel.text = "\(buyNumber)"
        buyCountLabel.hidden = false
        
    }
    
    func reduceGoodsButtonClick() {
        
        if buyNumber <= 0 {
            return
        }
        buyNumber -= 1
        if buyNumber == 0 {
            reduceGoodsButton.hidden = true
            buyCountLabel.hidden = true
            buyCountLabel.text = ""
        } else {
            buyCountLabel.text = "\(buyNumber)"
        }
        
    }
    
}
