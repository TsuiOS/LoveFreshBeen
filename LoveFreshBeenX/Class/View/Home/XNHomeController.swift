//
//  XNHomeController.swift
//  LoveFreshBeenHsu
//
//  Created by xuning on 16/6/8.
//  Copyright © 2016年 Hsu. All rights reserved.
//

import UIKit

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
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_black_scancode"), style: .Plain, target: self, action: #selector(XNHomeController.leftItemClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_search"), style: .Plain, target: self, action: #selector(XNHomeController.rightItemClick))
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