//
//  XNCategoryCell.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/7/1.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

class XNCategoryCell: UITableViewCell {
    
    private static let identifier = "categoryCell"
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = LFBTextGreyColol
        nameLabel.highlightedTextColor = UIColor.blackColor()
        nameLabel.backgroundColor = UIColor.clearColor()
        nameLabel.textAlignment = .Center
        return nameLabel
    }()
    
    private lazy var backImageView: UIImageView = {
        let backImageView = UIImageView()
        backImageView.image = UIImage(named: "llll")
        backImageView.highlightedImage = UIImage(named: "kkkkkkk")
        return backImageView
    }()
    
    private lazy var yellowView: UIView = {
        let yellowView = UIView()
        yellowView.backgroundColor = LFBNavigationYellowColor
        return yellowView
    }()
    
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.colorWithCustom(225, g: 225, b: 225)
        return lineView
    }()
    
    var category: XNCategory? {
        didSet {
            nameLabel.text = category?.name
        }
    }
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(backImageView)
        addSubview(lineView)
        addSubview(yellowView)
        addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func categoryCellWithTableView(tableView: UITableView) -> XNCategoryCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? XNCategoryCell
        if cell == nil {
            cell = XNCategoryCell(style: .Default, reuseIdentifier: identifier)
        }
        cell!.selectionStyle = .None
        return cell!
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        nameLabel.highlighted = selected
        backImageView.highlighted = selected
        yellowView.hidden = !selected
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.frame = bounds
        backImageView.frame = CGRectMake(0, 0, width, height)
        yellowView.frame = CGRectMake(0, height * 0.1, 5, height * 0.8)
        lineView.frame = CGRectMake(0, height - 1, width, 1)
    }

}
