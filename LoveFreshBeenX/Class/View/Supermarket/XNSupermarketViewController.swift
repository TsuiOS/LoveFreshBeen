//
//  XNSupermarketViewController.swift
//  LoveFreshBeenHsu
//
//  Created by xuning on 16/6/8.
//  Copyright © 2016年 Hsu. All rights reserved.
//

import UIKit
import SVProgressHUD


class XNSupermarketViewController: UIViewController {
    
    private var categoryTableView: UITableView!
    private var supermarketData: XNSupermarket?
    private var productsVC: XNProductsViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = LFBNavigationYellowColor
        
        SVProgressHUD.showWithStatus("全力加载中...")
        buildCategoryTableView()
        
        delay(0.1) {
             self.loadSupermarketData()
        }
        buildProductsViewController()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func buildCategoryTableView() {
        categoryTableView = UITableView(frame: CGRectMake(0, 0, ScreenWidth * 0.25, ScreenHeight), style: .Plain)
        categoryTableView.backgroundColor = LFBGlobalBackgroundColor
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.showsVerticalScrollIndicator = false
        categoryTableView.showsHorizontalScrollIndicator = false
        categoryTableView.separatorStyle = .None
        categoryTableView.contentInset = UIEdgeInsetsMake(0, 0, NavigationH, 0)
        view.addSubview(categoryTableView)
    }
    
    func buildProductsViewController() {
        productsVC = XNProductsViewController()
        addChildViewController(productsVC)
        view.addSubview(productsVC.view)
    }
    
    private func loadSupermarketData() {
        XNSupermarket.loadSupermarketData { (data, error) in
            self.supermarketData = data
            self.productsVC.supermarketData = data
            self.categoryTableView.reloadData()
            self.categoryTableView.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: true, scrollPosition: UITableViewScrollPosition.Bottom)
            SVProgressHUD.dismiss()
        }
    }
}

extension XNSupermarketViewController: UITableViewDelegate, UITableViewDataSource {


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return supermarketData?.data?.categories?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = XNCategoryCell.categoryCellWithTableView(tableView)
        cell.category = supermarketData!.data!.categories![indexPath.row]
        ///  初始化indexPath.row = 0的数据
        let selectedIndexPath = tableView.indexPathForSelectedRow
        productsVC.name = supermarketData?.data?.categories![selectedIndexPath!.row].id
    
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if productsVC != nil {
            productsVC.name = supermarketData?.data?.categories![indexPath.row].id
            productsVC.categorySelectedIndexPath = indexPath
        }
    }
}
