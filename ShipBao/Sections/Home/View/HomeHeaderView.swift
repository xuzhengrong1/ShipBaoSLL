//
//  HomeHeaderView.swift
//  YDMShop
//
//  Created by Xuzhengrong on 2017/2/14.
//  Copyright © 2017年 elenjoy. All rights reserved.
//

import Foundation
import UIKit

class HomeHeaderView: UIView {
    
    
    var  marquee: UIVerticalLoopView? = nil ;
    override func awakeFromNib() {
        super.awakeFromNib()
        marquee = UIVerticalLoopView(frame: CGRect(x: 0, y: 0, width: self.marqueeView.width, height: self.marqueeView.height))
        marquee?.direction = VerticalLoopDirectionDown;
        self.marqueeView.addSubview(marquee!)
    }
     //var dataBanners : [Banner]  = []
    @IBOutlet  var ssCyleBanner: LLCycleScrollView!
    @IBOutlet weak var marqueeView: UIView!

    
    }

