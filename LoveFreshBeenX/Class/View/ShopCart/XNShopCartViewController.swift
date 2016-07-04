//
//  XNShopCartViewController.swift
//  LoveFreshBeenHsu
//
//  Created by xuning on 16/6/8.
//  Copyright © 2016年 Hsu. All rights reserved.
//

import UIKit

class XNShopCartViewController: UIViewController {
    
    private var shopTableView: UITableView!
    private var emptyShopCarView: XNEmptyShopCarView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "购物车"
        self.navigationController?.navigationBar.barTintColor = LFBNavigationYellowColor
        buildShopCarTableView()
        buildEmptyUI()
    }

    private func buildShopCarTableView() {
        shopTableView = UITableView(frame: CGRectZero, style: .Grouped)
        shopTableView.delegate = self
        shopTableView.dataSource = self
        shopTableView.showsVerticalScrollIndicator = false
        shopTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "shopCarCell")
        shopTableView.separatorStyle = .None
        
        view.addSubview(shopTableView)
        shopTableView.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    private func buildEmptyUI() {
    
        emptyShopCarView = XNEmptyShopCarView()
        view.addSubview(emptyShopCarView!)
        emptyShopCarView?.snp_makeConstraints(closure: { (make) in
            make.center.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(170)
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension XNShopCartViewController: UITableViewDelegate, UITableViewDataSource {
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        emptyShopCarView?.hidden = false
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("shopCarCell")
        cell?.textLabel?.text = indexPath.row.description
        return cell!
        
    }
    
 

}
