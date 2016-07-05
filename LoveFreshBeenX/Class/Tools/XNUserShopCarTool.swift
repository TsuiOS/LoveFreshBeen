//
//  XNUserShopCarTool.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/7/4.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

class XNUserShopCarTool: NSObject {
    
    private static let instance = XNUserShopCarTool()
    private var supermarketProducts = [XNGoods]()
    
    class var sharedUserShopCar: XNUserShopCarTool {
        return instance
    }
    
    ///  添加商品
    func addSupermarkProductToShopCar(goods: XNGoods) {
        for everyGoods in supermarketProducts {
            if everyGoods.id == goods.id {
                return
            }
        }
        supermarketProducts.append(goods)

    }
    
    ///  删除商品
    func removeSupermarketProduct(goods: XNGoods) {
        for i in 0..<supermarketProducts.count {
            let everyGoods = supermarketProducts[i]
            if everyGoods.id == goods.id {
                supermarketProducts.removeAtIndex(i)
                NSNotificationCenter.defaultCenter().postNotificationName(LFBShopCarDidRemoveProductNSNotification, object: nil)
            }
        }
    }
    
    ///  获取所有商品
    func getShopCarProducts() -> [XNGoods] {
        return supermarketProducts
    }
    
    ///  获取商品数量
    func getShopCarProductsCount() -> Int {
        return supermarketProducts.count
    }
    
    ///  获取所有商品的价格
    func getAllProductsPrice() -> String {
        var allPrice: Double = 0
        for goods in supermarketProducts {
            allPrice = allPrice + Double(goods.partner_price!)! * Double(goods.userBuyNumber)
        }
        return "\(allPrice)"
    }
}
