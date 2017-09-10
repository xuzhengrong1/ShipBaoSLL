//
//  EDMBaseNavigationController.swift
//  YDMShop
//
//  Created by Xuzhengrong on 2017/2/20.
//  Copyright © 2017年 elenjoy. All rights reserved.
//

import Foundation

class XZRBaseNavigationController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true;
            
//            let tab = self.tabBarController as! EDMTabBarController
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ){
//                
//                tab.animationTabBarHidden(true)
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ){
//                tab.tabBar.isHidden = true
//            }
            
            super.pushViewController(viewController, animated: animated)
        }
        else{
            
            super.pushViewController(viewController, animated: animated)
        }
    }
//    
//    override func popViewController(animated: Bool) -> UIViewController? {
//        
////        let tab = self.tabBarController as! EDMTabBarController
//        let ctrl = super.popViewController(animated: animated)
//
////        let current = self.visibleViewController
////        
////        if current is MeViewController || current is OpenShopViewController ||
////           current is FirstPageViewController || current is CollegesViewController {
////
////            if animated {
////                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ){
////                    
////                    tab.animationTabBarHidden(false)
////                }
////                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ){
////                    tab.tabBar.isHidden = false
////                }
////            }
////            else{
////                tab.animationTabBarHidden(false)
////                tab.tabBar.isHidden = false
////            }
////        }
//        
//        return ctrl
//    }
//    
//    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
//        
//        let tab = self.tabBarController as! EDMTabBarController
//        
////        if animated {
////            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ){
////                
////                tab.animationTabBarHidden(false)
////            }
////            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ){
////                tab.tabBar.isHidden = false
////            }
////        }
////        else{
////            tab.animationTabBarHidden(false)
////            tab.tabBar.isHidden = false
////        }
//        
//        return super.popToRootViewController(animated: animated)
//    }
//
}
