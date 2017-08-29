//
//  UIViewController+MethodSwizzing.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/8/19.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
// 
extension UIViewController{
    override open class func initialize() {
//        methodSwizThreadSafe(self, #selector(self.viewDidLoad), #selector(self.xl_viewDidLoad))
        
        methodSwizThreadSafe(self, #selector(self.viewWillAppear(_:)), #selector(self.xl_viewWillAppear(_:)))
    }
    

    
    func xl_viewWillAppear(_ animated: Bool)
    {
        self.xl_viewWillAppear(animated);
        let index =  self.navigationController?.viewControllers.index(of: self)
        if index == 0 {
            let animatedTabBar = self.tabBarController as! RAMAnimatedTabBarController
            animatedTabBar.animationTabBarHidden(false)
        }
    
        let title = (self.title != nil) ? self.title! : "";
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
//        print("xl_viewDidLoad in swizzleMethod")
    }
    
    func xl_viewDidLoad() {
        
     
        self.xl_viewDidLoad()
        let title = (self.title != nil) ? self.title! : "";
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        print("xl_viewDidLoad in swizzleMethod")
    }
    
//    var tr_pushTransition: TRNavgationTransitionDelegate?
//
//    func pop() {
//        tr_popViewController()
//    }
}
