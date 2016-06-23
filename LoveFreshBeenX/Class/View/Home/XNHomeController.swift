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
    static let homeTableHeadViewHeightDidChange = #selector(XNHomeController.homeTableHeadViewHeightDidChange(_:))
    
}
class XNHomeController: UIViewController {
    
    var headerView: XNHomeHeadView?
    var collectionView: UICollectionView!
    var lastContentOffsetY: CGFloat = 0
    private var headData: XNHeadResources?
    private var freshHot: XNFreshHot?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = LFBGlobalBackgroundColor
        
        addHomeNotification()
        
        buildNavigationItem()
        
        buildCollectionView()

        buildTableHeaderView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }


}

// MARK: - 设置界面

extension XNHomeController {
    
    func addHomeNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: .homeTableHeadViewHeightDidChange , name: HomeTableHeadViewHeightDidChange, object: nil)
    }
    
    private func buildNavigationItem() {
        
        
        navigationController?.navigationBar.barTintColor = LFBNavigationYellowColor
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "icon_black_scancode", title: "扫一扫", target: self, action: .leftItemClick)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "icon_search", title: "搜索", target: self, action: .rightItemClick)
        
    }
 
    
    func buildCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsetsMake(0, HomeCollectionViewCellMargin, 0, HomeCollectionViewCellMargin)
        ///  设置header区域大小
        layout.headerReferenceSize = CGSizeMake(0, 10)
        
        collectionView = UICollectionView(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = LFBGlobalBackgroundColor

        collectionView.registerClass(XNHomeCell.self, forCellWithReuseIdentifier: "home_cell")
        view.addSubview(collectionView)
    
    }
    
    func buildTableHeaderView() {
        
        headerView = XNHomeHeadView()
        
        XNHeadResources.loadHomeHeadData { (model, error) in
            if error == nil {
                self.headerView?.headData = model
                self.headData = model
                self.collectionView.reloadData()
            }
        }
        collectionView.addSubview(headerView!)
        
        XNFreshHot.loadFreshHotData { (data, error) in
            self.freshHot = data
            self.collectionView.reloadData()

        }
        
    }
    
    func leftItemClick() {
        print("左")
    }
    func rightItemClick() {
        print("左")
    }
    
    func homeTableHeadViewHeightDidChange(noti: NSNotification) {
        
        collectionView.contentInset = UIEdgeInsetsMake(noti.object as! CGFloat, 0, NavigationH, 0)
        collectionView.setContentOffset(CGPointMake(0, -(collectionView.contentInset.top)), animated: false)
    }
    

}

// MARK: - UICollectionViewDelegate UICollectionViewDataSource
extension XNHomeController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if 0 == section {
            return headData?.data?.activities?.count ?? 0;
        } else if 1 == section {
            return freshHot?.data?.count ?? 0
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let  cell = collectionView.dequeueReusableCellWithReuseIdentifier("home_cell", forIndexPath: indexPath) as! XNHomeCell
        
        if indexPath.section == 0 {
            cell.activities = headData!.data!.activities![indexPath.row]
        } else if indexPath.section == 1 {
            
            cell.goods = freshHot!.data![indexPath.row]
        }
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var itemSize = CGSizeZero
        if 0 == indexPath.section {
            itemSize = CGSizeMake(ScreenWidth - HomeCollectionViewCellMargin * 2, 140)
        } else if indexPath.section == 1 {
        
            itemSize = CGSizeMake((ScreenWidth - HomeCollectionViewCellMargin * 2) * 0.5 - 4, 250)
        }
        
        return itemSize
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSizeMake(ScreenWidth, HomeCollectionViewCellMargin)
        } else if section == 1 {
            return CGSizeMake(ScreenWidth, HomeCollectionViewCellMargin * 2)
        }
        
        return CGSizeZero
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSizeMake(ScreenWidth, HomeCollectionViewCellMargin)
        } else if section == 1 {
            return CGSizeMake(ScreenWidth, HomeCollectionViewCellMargin * 8)
        }
        
        return CGSizeZero
    }
    
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        if lastContentOffsetY <= collectionView.contentOffset.y {
            
            //Animation
            
            lastContentOffsetY = collectionView.contentOffset.y
        }
    }

}


