//
//  XNMineCell.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/10.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

class XNMineCell: UITableViewCell {

    private lazy var bottomLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.grayColor()
        line.alpha = 0.15
        return line
    }()
    
    private lazy var iconImageView = UIImageView()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.blackColor()
        label.font  = UIFont.systemFontOfSize(16)
        label.alpha = 0.8
        return label
    }()
    private lazy var arrowView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_go")
        return imageView
    }()
    
    var mineModel: XNMineCellModel? {
    
        didSet {
            titleLabel.text = mineModel!.title
            iconImageView.image = UIImage(named: (mineModel!.iconName)!)
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(bottomLine)
        contentView.addSubview(arrowView)
        
        selectionStyle = .None
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        arrowView.frame = CGRectMake(width - 20, (height - (arrowView.image?.size.height)!)/2, (arrowView.image?.size.width)!, (arrowView.image?.size.height)!)
        
        let rightMargin: CGFloat = 10
        let iconWH: CGFloat = 20
        iconImageView.frame = CGRectMake(rightMargin, (height - iconWH)/2, iconWH, iconWH)
        
        titleLabel.frame = CGRectMake(CGRectGetMaxX(iconImageView.frame) + rightMargin, 0, 200, height)
        
        let leftMargin: CGFloat = 20
        bottomLine.frame = CGRectMake(leftMargin, height - 0.5, width - leftMargin, 0.5)
        
    }
    

}

class XNMineCellModel: NSObject {
    
    
    var title: String?
    var iconName: String?
    
    
    class func loadMineCellModels() -> [XNMineCellModel] {
        
        var mines = [XNMineCellModel]()
        
        let path = NSBundle.mainBundle().pathForResource("MinePlist", ofType: "plist")
        
        let arr = NSArray(contentsOfFile: path!)
        
        for dict in arr! {
            
            let model = XNMineCellModel(dict: dict as! [String : AnyObject])
            
            mines.append(model)
        }
        return mines
    }
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    
}