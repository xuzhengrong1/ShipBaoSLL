//
//  ZRBaseView.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/9/10.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
import Material
class ZRBaseView: View{
    override func awakeFromNib() {
        super.awakeFromNib();
        self.shadowOffset = CGSize(width: 2, height: 2)
        self.shadowRadius = 4;
        self.shadowOpacity = 1;
        self.shadowColor = UIColor.lightGray
        self.isShadowPathAutoSizing = true;
    
//        self.isShadowPathAutoSizing =
    }
}
