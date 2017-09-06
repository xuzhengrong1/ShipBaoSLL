//
//  IdentityCell.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/8/27.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
import YNExpandableCell
class IdentityCell: YNExpandableCell {
    override func awakeFromNib() {
        self.initView();
    }
    open override func initView() {
        let width = UIScreen.main.bounds.size.width
        let height = self.frame.size.height
        
        self.normalCustomAccessoryType = UIImageView(frame: CGRect(x: width - 46, y: (height-26)/2, width: 26, height: 26))
        let yn_nor = UIImage(named: "yn_nor", in: Bundle(for: YNExpandableCell.self), compatibleWith: nil)
        self.normalCustomAccessoryType.image = yn_nor
        self.selectedCustomAccessoryType = UIImageView(frame: CGRect(x: width - 46, y: (height-26)/2, width: 26, height: 26))
        let yn_sel = UIImage(named: "yn_sel", in: Bundle(for: YNExpandableCell.self), compatibleWith: nil)
        self.selectedCustomAccessoryType.image = yn_sel
        self.selectedCustomAccessoryType.isHidden = true
        
        self.contentView.addSubview(self.normalCustomAccessoryType)
        self.contentView.addSubview(self.selectedCustomAccessoryType)
        
        self.selectionStyle = .none
    }
}
