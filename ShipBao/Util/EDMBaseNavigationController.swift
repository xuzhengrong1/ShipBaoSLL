//
//  EDMBaseNavigationController.swift
//  YDMShop
//
//  Created by Xuzhengrong on 2017/2/20.
//  Copyright © 2017年 elenjoy. All rights reserved.
//

import Foundation

class EDMBaseNavigationController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
         let animatedTabBar = self.tabBarController as! RAMAnimatedTabBarController;
        
       let index =  self.navigationController?.index(ofAccessibilityElement: self)
        
        if index == 0 {
             animatedTabBar.animationTabBarHidden(false)
        }
        if self.viewControllers.count >= 1 {
            
            animatedTabBar.animationTabBarHidden(true)
            super.pushViewController(viewController, animated: animated)
        }
        else{
//            animatedTabBar.animationTabBarHidden(false)
            super.pushViewController(viewController, animated: animated)
        }
    }
}
