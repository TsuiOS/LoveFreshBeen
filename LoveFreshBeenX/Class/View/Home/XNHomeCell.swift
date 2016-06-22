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
    
    private lazy var goodsImageView: UIImageView = {
        let goodsImageView = UIImageView()
        return goodsImageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .Left
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
        buildUI()
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
    
    
    
}


extension XNHomeCell {


    private func buildUI() {
        addSubview(backImageView)
        addSubview(goodsImageView)
        addSubview(nameLabel)
        addSubview(fineImageView)
        addSubview(giveImageView)
        
        backImageView.snp_makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        
        
    }

}
