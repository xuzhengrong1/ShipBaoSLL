//
//  EDMBaseUIViewController.swift
//  YDMShop
//
//  Created by Xuzhengrong on 2017/2/20.
//  Copyright © 2017年 elenjoy. All rights reserved.
//

import Foundation


@objc class XZRBaseUIViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let count = self.navigationController?.viewControllers.count ,count > 1{
            
            self.navigationItem.leftBarButtonItem = navCustomBarButton("icon_back")
        }
//        if (self.navigationController?.viewControllers.count)! > 1 {
//            self.navigationItem.leftBarButtonItem = navCustomBarButton("icon_back")
//        }
        
    }
    

    
   
    
    func navCustomBarButton(_ image:String = "icon_back", selector:Selector = #selector(backToDo), textColor: UIColor = UIColor.hexStringToUIColor(hex: "#303030")) -> UIBarButtonItem {
        let icon  = UIImage(named:image)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let button =  EDMNavLeftButton()
        button.setImage(icon, for: .normal)
        button.addTarget(self, action: #selector(XZRBaseUIViewController.backToDo), for: .touchUpInside)
        button.frame = CGRect(x:0, y:30, width: 18, height: 24)
        let label = UILabel(frame: CGRect(x:18, y:2, width: 50, height: 18))
        label.font = UIFont(name: "PingFangSC-Regular", size: 16)
        label.text = "返回"
        label.textAlignment = .left
        label.textColor = textColor
        label.backgroundColor =   UIColor.clear
        button.addSubview(label)
        let barButton = UIBarButtonItem(customView: button)
        return  barButton;
    }
    
    func navCustomBarNoNameButton(_ image:String = "icon_back", selector:Selector = #selector(backToDo), textColor: UIColor = UIColor.hexStringToUIColor(hex: "#303030")) -> UIBarButtonItem {
        let icon  = UIImage(named:image)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let button =  UIButton(type: .custom)
        button.setImage(icon, for: .normal)
        button.addTarget(self, action: #selector(XZRBaseUIViewController.backToDo), for: .touchUpInside)
        button.frame = CGRect(x:0, y:30, width: 18, height: 24)
        let barButton = UIBarButtonItem(customView: button)
        return  barButton;
    }
    
    
    
     func navBarButton(_ image:String, selector:Selector) -> UIBarButtonItem {
        
        let icon  = UIImage(named:image)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let navBarButton = UIBarButtonItem(image: icon, style: .plain, target: self, action: selector)
        return  navBarButton;
    }
    
   @objc  func backToDo () {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
