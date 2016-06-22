//
//  XNHeadResources.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/15.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

class XNHeadResources: Reflect {
    var msg: String?
    var reqid: String?
    var data: HeadData?
    
    
    class func loadHomeHeadData(completion:(model: XNHeadResources?, error: NSError?) -> Void) {
        
        let path = NSBundle.mainBundle().pathForResource("首页焦点按钮", ofType: nil)
        
        let data = NSData(contentsOfFile: path!)
        
        if data != nil {
            let dict = (try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)) as! NSDictionary
            
            let data = XNHeadResources.parse(dict: dict)
            
            completion(model: data, error: nil)

        }
    }

}

class HeadData: Reflect {
    
    var focus: [Activities]?
    var icons: [Activities]?
    var activities: [Activities]?

}

class Activities: Reflect {
    var id: String?
    var name: String?
    var img: String?
    var mimg: String?
    var topimg: String?
    var jptype: String?
    var trackid: String?
}
