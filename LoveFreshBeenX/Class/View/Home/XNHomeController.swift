//
//  XNHomeController.swift
//  LoveFreshBeenHsu
//
//  Created by xuning on 16/6/8.
//  Copyright © 2016年 Hsu. All rights reserved.
//

import UIKit
private extension Selector {
    
    static let leftItemClick = #selector(XNHomeController.leftItemClick)
    static let rightItemClick = #selector(XNHomeController.rightItemClick)
    
}
class XNHomeController: UIViewController {
    
    var headerView: XNHeaderView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildNavigationItem()
        buildTableHeaderView()

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK: - 设置界面

extension XNHomeController {

    private func buildNavigationItem() {
        
        
        navigationController?.navigationBar.barTintColor = LFBNavigationYellowColor
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "icon_black_scancode", title: "扫一扫", target: self, action: .leftItemClick)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "icon_search", title: "搜索", target: self, action: .rightItemClick)
    
        
    }
   
 
    func buildTableHeaderView() {
        
        headerView = XNHeaderView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 150))
        
        view.addSubview(headerView!)
        
    }
    
    
    func leftItemClick() {
        print("左")
    }
    func rightItemClick() {
        print("左")
    }
    
    

}



