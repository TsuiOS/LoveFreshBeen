//
//  XNPageScrollView.swift
//  LoveFreshBeenX
//
//  Created by xuning on 16/6/9.
//  Copyright © 2016年 hus. All rights reserved.
//

import UIKit

class XNPageScrollView: UIView {

    private let imageViewMaxCount = 3
    private var imageScrollView: UIScrollView!
    private var pageContorl: UIPageControl!
    private var timer: NSTimer?
    private var placeholderImage: UIImage?
    
    
    var imageURLString: [String]? {
        didSet {
            
            print(imageURLString?.count)
            pageContorl.numberOfPages = imageURLString!.count
            pageContorl.currentPage = 0
            
            updatePageScrollView()
            startTimer()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildImageScrollView()
        buildPageControl()
    }
    
    // 构造便利函数
    convenience init(frame: CGRect, placeholder: UIImage) {
        
        self.init(frame:frame)
        
        placeholderImage = placeholder
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageScrollView.frame = bounds
        
        imageScrollView.contentSize = CGSizeMake(CGFloat(imageViewMaxCount) * width , 0)
        for i in 0...imageViewMaxCount - 1 {
            let imageView = imageScrollView.subviews[i] as! UIImageView
            imageView.userInteractionEnabled = true
            imageView.frame = CGRectMake(CGFloat(i) * imageScrollView.width, 0, imageScrollView.width, imageScrollView.height)
            
        }
        
        let pageW: CGFloat  = 80
        let pageH: CGFloat  = 20
        let pageX: CGFloat  = imageScrollView.width - pageW
        let pageY: CGFloat  = imageScrollView.height - pageH
        pageContorl.frame = CGRectMake(pageX, pageY, pageW, pageH)
        
        updatePageScrollView()
        
    }
}
// MARK: - 设置界面
extension XNPageScrollView {
    
    // MARK: - 更新内容
    private func updatePageScrollView() {
        
        for i in 0 ..< imageScrollView.subviews.count {
            let imageView = imageScrollView.subviews[i] as! UIImageView
            var index = pageContorl.currentPage
            
            if i == 0 {
                index -= 1
            } else if i == 2 {
                index += 1
            }
            
            if index < 0 {
                index = self.pageContorl.numberOfPages - 1
            } else if index >= pageContorl.numberOfPages {
            
                index = 0
            }
            imageView.tag = index
            imageView.image = placeholderImage
        }
        imageScrollView.contentOffset = CGPointMake(imageScrollView.width, 0)

    }
    
    // buildUI
    private func buildImageScrollView() {
        imageScrollView = UIScrollView()
        imageScrollView.bounces = false
        imageScrollView.showsVerticalScrollIndicator = false
        imageScrollView.showsHorizontalScrollIndicator = false
        imageScrollView.pagingEnabled = true
        imageScrollView.delegate = self
        addSubview(imageScrollView)
        
        for _ in 0..<3 {
            let  imageView = UIImageView()
            let  tap = UITapGestureRecognizer(target: self, action: #selector(XNPageScrollView.imageViewClick(_:)))
            imageView.addGestureRecognizer(tap)
            imageScrollView.addSubview(imageView)

        }
    }
    
    private func buildPageControl() {
        pageContorl = UIPageControl()
        //设置当总页数为1时，自动隐藏控制器
        pageContorl.hidesForSinglePage = true
        pageContorl.pageIndicatorTintColor = UIColor(patternImage: UIImage(named: "v2_home_cycle_dot_normal")!)
        pageContorl.currentPageIndicatorTintColor = UIColor(patternImage: UIImage(named: "v2_home_cycle_dot_selected")!)
        addSubview(pageContorl)
    }
    
    // Timer
    private func startTimer() {
        
        timer = NSTimer(timeInterval: 3.0, target: self, selector: #selector(XNPageScrollView.next), userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
    
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func next() {
     
        imageScrollView.setContentOffset(CGPointMake(2.0*imageScrollView.frame.size.width, 0), animated: true)
        
    }
    // action
    @objc private func imageViewClick(tap:UITapGestureRecognizer) {
        
        print(tap.view!.tag)
    }

}

// MARK: - UIScrollViewDelegate
extension XNPageScrollView: UIScrollViewDelegate {

    func scrollViewDidScroll(scrollView: UIScrollView) {
        var  page: Int = 0
        
        var  miniDistance: CGFloat = CGFloat(MAXFLOAT)
        for i in 0..<imageScrollView.subviews.count {
            let imageView = imageScrollView.subviews[i] as! UIImageView
            let  distance:CGFloat = abs(imageView.x - scrollView.contentOffset.x)
            
            if distance < miniDistance {
                miniDistance = distance
                page = imageView.tag
            }
        }
        pageContorl.currentPage = page
    }
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        stopTimer()
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        startTimer()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        updatePageScrollView()
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        updatePageScrollView()
    }

}

