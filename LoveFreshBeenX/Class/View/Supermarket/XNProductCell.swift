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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .None
        contentView.backgroundColor = UIColor.whiteColor()
        
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
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
