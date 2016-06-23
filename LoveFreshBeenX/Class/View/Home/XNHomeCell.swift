//
//  XNHomeCell.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/13.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

enum HomeCellType: Int {
    case Horizontal = 0
    case Vertical = 1
}

class XNHomeCell: UICollectionViewCell {
    
    ///  懒加载
    private lazy var backImageView: UIImageView = {
        let backImageView = UIImageView()
        return backImageView
    }()
    
    // 产品图
    private lazy var goodsImageView: UIImageView = {
        let goodsImageView = UIImageView()
        return goodsImageView
    }()
    
    //产品名
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .Left
        nameLabel.font = HomeCollectionTextFont
        nameLabel.textColor = UIColor.blackColor()
        return nameLabel
    }()
    
    // 精选
    private lazy var fineImageView: UIImageView = {
        let fineImageView = UIImageView()
        fineImageView.image = UIImage(named: "jingxuan.png")
        return fineImageView
    }()
    
    //买一送一
    private lazy var giveImageView: UIImageView = {
        let giveImageView = UIImageView()
        giveImageView.image = UIImage(named: "buyOne.png")
        return giveImageView
    }()
    
    // 产品规格
    private lazy var specificsLabel: UILabel = {
        let specificsLabel = UILabel()
        specificsLabel.textColor = UIColor.colorWithCustom(100, g: 100, b: 100)
        specificsLabel.font = UIFont.systemFontOfSize(12)
        specificsLabel.textAlignment = .Left
        return specificsLabel
    }()
    
    // TODO 
    
    private var type: HomeCellType? {
        didSet {
            backImageView.hidden = !(type == HomeCellType.Horizontal)
            goodsImageView.hidden = (type == HomeCellType.Horizontal)
            nameLabel.hidden = (type == HomeCellType.Horizontal)
            fineImageView.hidden = (type == HomeCellType.Horizontal)
            specificsLabel.hidden = (type == HomeCellType.Horizontal)
       
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.whiteColor()

        contentView.addSubview(backImageView)
        contentView.addSubview(goodsImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(fineImageView)
        contentView.addSubview(giveImageView)
        contentView.addSubview(specificsLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 模型set方法
    var activities: Activities? {
        didSet {
            self.type = HomeCellType.Horizontal
            backImageView.image = UIImage(named: "v2_placeholder_full_size")
        }
    }
    var goods: Goods? {
        didSet {
        
            self.type = HomeCellType.Vertical
            goodsImageView.image = UIImage(named: "v2_placeholder_square")
            nameLabel.text = goods?.name
            if goods!.pm_desc == "买一赠一" {
                giveImageView.hidden = false
            } else {
                giveImageView.hidden = true
            }
            
            specificsLabel.text = goods?.specifics

        }
        
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        ///  这里加判断是为了控制台约束警告的问题
        
        if self.type == HomeCellType.Horizontal {
            backImageView.snp_makeConstraints { (make) in
                make.edges.equalTo(self)
            }
        }
        
        if self.type == HomeCellType.Vertical {
            ///  新鲜热卖的goods
            goodsImageView.snp_makeConstraints { (make) in
                make.top.left.right.equalTo(self)
                make.height.equalTo(width)
            }
            // 产品名
            nameLabel.snp_makeConstraints { (make) in
                make.top.equalTo(self.goodsImageView.snp_bottom)
                make.left.equalTo(self).offset(5)
                make.right.equalTo(self).offset(-5)
                make.height.equalTo(20)
            }
            
            // 精选
            fineImageView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(nameLabel.snp_bottom)
                make.left.equalTo(nameLabel)
                make.width.equalTo(30)
                make.height.equalTo(15)
            })
            
            //买一送一
            giveImageView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(fineImageView)
                make.left.equalTo(fineImageView.snp_right).offset(3)
                make.width.equalTo(35)
                make.height.equalTo(15)
            })
            
            //产品规格
            specificsLabel.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(fineImageView.snp_bottom)
                make.left.equalTo(nameLabel)
                make.width.equalTo(width)
                make.height.equalTo(20)
            })

            
            

        }
    }

}


extension XNHomeCell {


    

    

}
