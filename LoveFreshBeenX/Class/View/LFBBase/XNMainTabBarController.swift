//
//  XNMainTabBarController.swift
//  LoveFreshBeenHsu
//
//  Created by xuning on 16/6/8.
//  Copyright © 2016年 Hsu. All rights reserved.
//

import UIKit

class XNMainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubControllers()
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - 设置界面
extension XNMainTabBarController {
    // 初始化tabbar
    private func addSubControllers() {
        
        
        setupChildViewController(XNHomeController(), title: "首页", imageName: "v2_home", selectedImageName: "v2_home_r")
        setupChildViewController(XNSupermarketViewController(), title: "闪电超市", imageName: "v2_order", selectedImageName: "v2_order_r")
        setupChildViewController(XNShopCartViewController(), title: "购物车", imageName: "shopCart", selectedImageName: "shopCart_r")
        setupChildViewController(XNMineViewController(), title: "我的", imageName: "v2_my", selectedImageName: "v2_my_r")
    }
    
    ///  添加指定的控制器
    ///
    ///  - parameter vc:                控制器
    ///  - parameter title:             标题
    ///  - parameter imageName:         图片名
    ///  - parameter selectedImageName: 选中的图片
    private func setupChildViewController(vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)?.imageWithRenderingMode(.AlwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.imageWithRenderingMode(.AlwaysOriginal)
        
        let nav = UINavigationController(rootViewController: vc)
        
        addChildViewController(nav)
    }


}

