//
//  UIControl+Apperance.swift
//  YDMShop
//
//  Created by Xuzhengrong on 2017/3/7.
//  Copyright © 2017年 elenjoy. All rights reserved.
//

import Foundation
import UIKit
//import Toaster

extension UIControl{
    
    override open class func initialize() {
//       ap_tabbar()
        ap_navView()
    }
    
    
   static func ap_tabbar()   {
      let tabbar  =   UITabBar.appearance()
    tabbar.tintColor = UIColor.green //NavTintColor;
    tabbar.unselectedItemTintColor = UIColor.red//TabbarTextColor
//      tabbar.isTranslucent = false
    }
    
    static func ap_navView()
    {
    
       let navAp =  UINavigationBar.appearance()
        navAp.barTintColor = NavTintColor
        navAp.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.white,
             NSFontAttributeName: UIFont.boldSystemFont(ofSize: 19)]
        navAp.isTranslucent  = false;
        navAp.backIndicatorImage = UIImage(named:"icon_arrow_left")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
         navAp.backIndicatorTransitionMaskImage = UIImage(named:"icon_arrow_left")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        navAp.backItem?.title = ""
//)
        
        
    }
    
    
//   static func app_toastView() {
//        let appearance = ToastView.appearance()
//        appearance.backgroundColor = .lightGray
//        appearance.textColor = .black
//        appearance.font = .boldSystemFont(ofSize: 16)
//        appearance.textInsets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
//        appearance.bottomOffsetPortrait = SCREEN_H/2
//        appearance.cornerRadius = 20
//    }
    
}
