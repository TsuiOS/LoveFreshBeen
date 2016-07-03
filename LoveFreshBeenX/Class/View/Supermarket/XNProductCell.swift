//
//  XNProductCell.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/7/2.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

class XNProductCell: UITableViewCell {
    
    static private let identifier = "productCell"
    
    //MARK: - 初始化子控件
    private lazy var goodsImageView: UIImageView = {
        let goodsImageView = UIImageView()
        return goodsImageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = NSTextAlignment.Left
        nameLabel.font = HomeCollectionTextFont
        nameLabel.textColor = UIColor.blackColor()
        return nameLabel
    }()
    
    private lazy var fineImageView: UIImageView = {
        let fineImageView = UIImageView()
        fineImageView.image = UIImage(named: "jingxuan.png")
        return fineImageView
    }()
    
    private lazy var giveImageView: UIImageView = {
        let giveImageView = UIImageView()
        giveImageView.image = UIImage(named: "buyOne.png")
        return giveImageView
    }()
    
    private lazy var specificsLabel: UILabel = {
        let specificsLabel = UILabel()
        specificsLabel.textColor = UIColor.colorWithCustom(100, g: 100, b: 100)
        specificsLabel.font = UIFont.systemFontOfSize(12)
        specificsLabel.textAlignment = .Left
        return specificsLabel
    }()
    
    private lazy var buyView: XNBuyView = {
        let buyView = XNBuyView()
        return buyView
    }()
    
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.colorWithCustom(100, g: 100, b: 100)
        lineView.alpha = 0.05
        return lineView
    }()
    
    private var discountPriceView: XNDiscountPriceView?

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .None
        contentView.backgroundColor = UIColor.whiteColor()
        contentView.addSubview(goodsImageView)
        contentView.addSubview(lineView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(fineImageView)
        contentView.addSubview(giveImageView)
        contentView.addSubview(specificsLabel)
        contentView.addSubview(buyView)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func productCellWithTableView(tableView: UITableView) -> XNProductCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? XNProductCell
        if cell == nil {
            cell = XNProductCell(style: .Default, reuseIdentifier: identifier)
        }
        return cell!
    }
    
    // MARK: - 模型set方法
    var goods: XNGoods? {
        didSet {
            goodsImageView.sd_setImageWithURL(NSURL(string: goods!.img!), placeholderImage: UIImage(named: "v2_placeholder_square"))
            nameLabel.text = goods?.name
            if goods!.pm_desc == "买一赠一" {
                giveImageView.hidden = false
            } else {
                giveImageView.hidden = true
            }
            
            if goods!.is_xf == 1 {
                fineImageView.hidden = false
            } else {
                fineImageView.hidden = true
            }
            
            if discountPriceView != nil {
                discountPriceView!.removeFromSuperview()
            }
            discountPriceView = XNDiscountPriceView(price: goods?.price, marketPrice: goods?.market_price)
            addSubview(discountPriceView!)
            
            specificsLabel.text = goods?.specifics
            buyView.goods = goods
        }
    }
    
    // MARK: - 布局
    override func layoutSubviews() {
        super.layoutSubviews()
        
        goodsImageView.frame = CGRectMake(0, 0, height, height)
        fineImageView.frame = CGRectMake(CGRectGetMaxX(goodsImageView.frame), HotViewMargin, 30, 16)
        
        if fineImageView.hidden {
            nameLabel.frame = CGRectMake(CGRectGetMaxX(goodsImageView.frame) + 3, HotViewMargin - 2, width - CGRectGetMaxX(goodsImageView.frame), 20)
        } else {
            nameLabel.frame = CGRectMake(CGRectGetMaxX(fineImageView.frame) + 3, HotViewMargin - 2, width - CGRectGetMaxX(fineImageView.frame), 20)
        }
        
        giveImageView.frame = CGRectMake(CGRectGetMaxX(goodsImageView.frame), CGRectGetMaxY(nameLabel.frame), 35, 15)
        
        specificsLabel.frame = CGRectMake(CGRectGetMaxX(goodsImageView.frame), CGRectGetMaxY(giveImageView.frame), width, 20)
        discountPriceView?.frame = CGRectMake(CGRectGetMaxX(goodsImageView.frame), CGRectGetMaxY(specificsLabel.frame), 60, height - CGRectGetMaxY(specificsLabel.frame))
        lineView.frame = CGRectMake(HotViewMargin, height - 1, width - HotViewMargin, 1)
        buyView.frame = CGRectMake(width - 85, height - 30, 80, 25)
    }

}
