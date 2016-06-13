//
//  XNMineViewController.swift
//  LoveFreshBeenHsu
//
//  Created by xuning on 16/6/8.
//  Copyright © 2016年 Hsu. All rights reserved.
//

import UIKit

class XNMineViewController: UIViewController {
    
    private var headView: XNMineHeadView!
    private var tableView: UITableView!
    private var headViewheight: CGFloat = 150
    private var tableHeadView: XNMineTableHeadView!
    
    private lazy var mines: [XNMineCellModel] = {
    
        let mines = XNMineCellModel.loadMineCellModels()
        return mines
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.hidden = true
        
        
        
        buildUI()
    }
    
    // MARK: - Private Method
    private func buildUI() {
        
        //设置顶部试图
        headView = XNMineHeadView(frame: CGRectMake(0, 0, ScreenWidth, headViewheight))
        
        view.addSubview(headView)
        
        //设置tableView
        buildTableView()
        
    }
    
    private func buildTableView() {
    
        tableView = UITableView(frame: CGRectMake(0, headViewheight, ScreenWidth, ScreenHeight - headViewheight), style: .Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        tableView.registerClass(XNMineCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        //设置tableView的headerView
        tableHeadView = XNMineTableHeadView(frame: CGRectMake(0,0,ScreenWidth,70))
        
        tableView.tableHeaderView = tableHeadView
        
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

}


// MARK: - UITableViewDataSource UITableViewDelegate
extension XNMineViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if 0 == section {
            return 2
        } else if 1 == section {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! XNMineCell
        
        if 0 == indexPath.section {
           cell.mineModel = mines[indexPath.row]
        } else if 1 == indexPath.section {
            cell.mineModel = mines[2]
        } else {
        
            if indexPath.row == 0 {
                cell.mineModel = mines[3]
            } else {
                cell.mineModel = mines[4]
            }
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("didselect")
        
    }
    




}
