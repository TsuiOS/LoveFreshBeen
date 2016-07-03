//
//  XNProductsViewController.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/7/2.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

class XNProductsViewController: UIViewController {

    var productsTableView: UITableView?
    var supermarketData: XNSupermarket?
    
    var name: String? {
        didSet {
            let products = supermarketData?.data?.products
            goodArray = products!.valueForKey(name!) as? [XNGoods]
        }
    }
    
    var goodArray: [XNGoods]? {
        didSet {
            productsTableView?.reloadData()
            productsTableView?.scrollToRowAtIndexPath(NSIndexPath(forRow: 0,inSection: 0), atScrollPosition: .Top, animated: true)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = LFBGlobalBackgroundColor
        view = buildProductsTableView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func buildProductsTableView() -> UITableView {
        productsTableView = UITableView(frame: CGRectMake(ScreenWidth * 0.25, 0, ScreenWidth * 0.75, ScreenHeight - NavigationH - 49), style: .Plain)
        productsTableView?.backgroundColor = LFBGlobalBackgroundColor
        productsTableView?.dataSource = self
        productsTableView?.delegate = self
        productsTableView!.separatorStyle = .None
        productsTableView?.rowHeight = 85
        return productsTableView!
    }
}

extension XNProductsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goodArray?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
        let cell = XNProductCell.productCellWithTableView(tableView)
        
        cell.textLabel?.text = goodArray![indexPath.row].name
        return cell
        
    }


}
