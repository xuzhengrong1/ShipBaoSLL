//
//  HomeHeaderView.swift
//  YDMShop
//
//  Created by Xuzhengrong on 2017/2/14.
//  Copyright © 2017年 elenjoy. All rights reserved.
//

import Foundation
import UIKit
import FSPagerView
import SwiftyUserDefaults
import Kingfisher

class HomeHeaderView: UIView,FSPagerViewDataSource,FSPagerViewDelegate {
    
    
    var  marquee: CCPScrollView? = nil ;
    var bannerData:[Banner]? = Defaults[.homeDataList]?.banners;
    var tipsData:[Tip]? = Defaults[.homeDataList]?.tips;
    
    @IBOutlet weak var homeHeadBanner: FSPagerView!{
        didSet {
            self.homeHeadBanner.delegate = self;
            self.homeHeadBanner.dataSource = self;
            self.homeHeadBanner.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.homeHeadBanner.automaticSlidingInterval = 2.0;
            self.homeHeadBanner.isInfinite = true
//            self.homeHeadBanner.transformer = FSPagerViewTransformer(type:.crossFading)
        }
    }
    
    @IBOutlet weak var marqueeView: CCPScrollView!
    
    @IBOutlet weak var homeBannerPageControl: FSPageControl! {
        didSet {
            if let count = self.bannerData?.count{
                self.homeBannerPageControl.numberOfPages = count
            }
//            self.homeBannerPageControl.numberOfPages = 5
            
            self.homeBannerPageControl.contentHorizontalAlignment = .center
            self.homeBannerPageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            self.homeBannerPageControl.backgroundColor = .clear;
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        marquee = CCPScrollView(frame: CGRect(x: 0, y: 0, width: self.marqueeView.width, height: self.marqueeView.height))
//        marquee?.direction = VerticalLoopDirectionDown;
        
        var tipArr:[String] = [];
        for tip in tipsData! {
            tipArr.append(tip.content!)
        }
        marquee?.titleArray = tipArr;
        marquee?.titleFont = 15;
        marquee?.titleColor = COLORLIKEGREEN;
        marquee?.textAlignment = .left;
//        marquee?.start();
        self.marqueeView.addSubview(marquee!)
        
        
    }
    
    
    
    
    
    //var dataBanners : [Banner]  = []
//    @IBOutlet  var ssCyleBanner: UIScrollView!
 
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        if let count = self.bannerData?.count{
            return count
        }
        return 0;
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
//        cell.imageView.kf_set

        if let banner = self.bannerData?[index]{
                        let url = URL(string: banner.file!)
            cell.imageView?.kf.setImage(with: url);
        }
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
//        cell.textLabel?.text = index.description+index.description
        return cell
    }
    
    // MARK:- FSPagerView Delegate
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
        self.homeBannerPageControl.currentPage = index
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard self.homeBannerPageControl.currentPage != pagerView.currentIndex else {
            return
        }
        self.homeBannerPageControl.currentPage = pagerView.currentIndex // Or Use KVO with property "currentIndex"
    }

    
    
    
    
    }



