//
//  XZRNavButton.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/8/27.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
class XZRNavButton: UIButton {
    var menuTitle: UILabel!
    var menuArrow: UIImageView!
    init(height: CGFloat = 40, title: String, font: UIFont = UIFont.systemFont(ofSize: 15), image:UIImage, padding: CGFloat = 15) {
    
        
    
        let titleSize: CGSize
        
        titleSize = (title as NSString).size(attributes: [NSFontAttributeName:font])
        
        // Set frame
        let frame = CGRect(x: 0, y: 0, width: titleSize.width + (padding + image.size.width )*2, height:40)

        super.init(frame: frame);
        self.menuTitle = UILabel(frame: frame)
        self.menuTitle.text = title
        self.menuTitle.textColor =  UIColor.white
        self.menuTitle.font = UIFont.systemFont(ofSize: 15)
        self.menuTitle.textAlignment = .center
        self.addSubview(self.menuTitle)
       
        
        self.menuArrow = UIImageView(image: UIImage.init(named: "Settings"))
        self.addSubview(self.menuArrow)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func rotateArrow() {
        UIView.animate(withDuration: 0.3, animations: {[weak self] () -> () in
            if let selfie = self {
                selfie.menuArrow.transform = selfie.menuArrow.transform.rotated(by: 180 * CGFloat(Double.pi/180))
            }
        })
    }
    
    override func layoutSubviews() {
        self.menuTitle.sizeToFit()
        self.menuTitle.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        self.menuArrow.sizeToFit()
        self.menuArrow.center = CGPoint(x: self.menuTitle.frame.maxX + 15, y: self.frame.size.height/2)
    }
}
