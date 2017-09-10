//
//  ZRButton.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/9/10.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation


class ZRButton: UIButton {
    
    
    override func awakeFromNib() {
        super.awakeFromNib();
         commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
//        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.titleLabel?.textAlignment = .center
        self.imageView?.contentMode = .scaleAspectFit
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let titleX = 0
        let titleY = contentRect.size.height * 0.4
        let titleW = contentRect.size.width
        let titleH = contentRect.size.height - titleY
        
        return CGRect(x: CGFloat(titleX), y:  titleY, width: titleW, height: titleH)
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let imageW = contentRect.width
        let imageH = contentRect.size.height * 0.5
        return CGRect(x: 0, y:  5, width: imageW, height: imageH)
    }
    
    
    
}
