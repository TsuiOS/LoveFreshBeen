//
//  XNCategory.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/7/2.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

class XNSupermarket: Reflect {
    var code: Int = -1
    var msg: String?
    var reqid: String?
    var data: XNSupermarkerResouce?
    
    class func loadSupermarketData(completion:(data: XNSupermarket?, error: NSError?) -> Void) {
        let path = NSBundle.mainBundle().pathForResource("supermarket", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        
        if data != nil {
            let dict: NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)) as! NSDictionary
            let model = XNSupermarket.parse(dict: dict)
            completion(data: model, error: nil)
        }
    }
    
    class func searchCategoryMatchProducts(supermarketResouce: XNSupermarkerResouce) -> [[XNGoods]]? {
        
        var arr = [[XNGoods]]()
        let products = supermarketResouce.products
        for cate in supermarketResouce.categories! {
            let goodsArr = products?.valueForKey(cate.id!) as! [XNGoods]
            arr.append(goodsArr)
        }
        return arr
    }
    
}

class XNSupermarkerResouce: Reflect{
    var categories: [XNCategory]?
    var products: XNProducts?
}

class XNCategory: Reflect {
    var id: String?
    var name: String?
    var sort: String?
}

class XNProducts: Reflect {
    var a82: [XNGoods]?
    var a96: [XNGoods]?
    var a99: [XNGoods]?
    var a106: [XNGoods]?
    var a134: [XNGoods]?
    var a135: [XNGoods]?
    var a136: [XNGoods]?
    var a137: [XNGoods]?
    var a141: [XNGoods]?
    var a143: [XNGoods]?
    var a147: [XNGoods]?
    var a151: [XNGoods]?
    var a152: [XNGoods]?
    var a158: [XNGoods]?
}


class XNGoods: Reflect{
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
    var number: String?
    /// 买一赠一
    var pm_desc: String?
    /// urlStr
    var img: String?
    
    //*************************商品模型辅助属性**********************************
    // 记录用户对商品添加次数
    var userBuyNumber: Int = 0
    
}