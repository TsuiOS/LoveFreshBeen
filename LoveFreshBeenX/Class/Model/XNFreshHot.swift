//
//  XNFreshHot.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/22.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

class XNFreshHot: Reflect {
    
    var page: Int = -1
    var code: Int = -1
    var msg: String?
    var data: [Goods]?
    
    class func loadFreshHotData(completion:(data: XNFreshHot?, error: NSError?) -> Void) {
        let path = NSBundle.mainBundle().pathForResource("首页新鲜热卖", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        if data != nil {
            let dict: NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)) as! NSDictionary
            let data = XNFreshHot.parse(dict: dict)
            completion(data: data, error: nil)
            print(data)
        }
    }
    
}

class Goods: Reflect{
    //*************************商品模型默认属性**********************************
    /// 商品ID
    var id: String?
    /// 商品姓名
    var name: String?
    var brand_id: String?
    /// 超市价格
    var market_price: String?
    var cid: String?
    var category_id: String?
    /// 当前价格
    var partner_price: String?
    var brand_name: String?
    var pre_img: String?
    
    var pre_imgs: String?
    /// 参数
    var specifics: String?
    var product_id: String?
    var dealer_id: String?
    /// 当前价格
    var price: String?
    /// 库存
    var number: Int = -1
    /// 买一赠一
    var pm_desc: String?
    /// urlStr
    var img: String?
    
    //*************************商品模型辅助属性**********************************
    // 记录用户对商品添加次数
    var userBuyNumber: Int = 0

}