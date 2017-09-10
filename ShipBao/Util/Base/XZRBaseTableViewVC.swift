//
//  YDMBaseTableViewVC.swift
//  YDMShop
//
//  Created by Xuzhengrong on 2017/2/10.
//  Copyright © 2017年 elenjoy. All rights reserved.
//

import Foundation
class XZRBaseTableViewVC : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 102;
        tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.separatorStyle = .none
    
//        self.edgesForExtendedLayout = []
    
        if self.navigationController != nil && (self.navigationController?.viewControllers.count)!>1 {
           
            
//            self.navigationItem.leftBarButtonItem = navCustomBarButton("icon_back")
           self.navigationItem.leftBarButtonItem =  navCustomBarButton("icon_back", selector: #selector(backToDo))

        }
    
    }
    
    
    open func  registerCell(_ identifier: String)
    {
         self.tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
//    open func  registerCellFirst(_ identifier: String)
//    {
//        
//        self.tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
//        
//        
//            let cell  =  Bundle.main.loadNibNamed(identifier, owner: nil, options: nil)?.first as! EDMThisWeekendCell;
//        self.tableView.register(EDMThisWeekendCell.self, forCellReuseIdentifier: identifier);
////        let nib =  Bundle.main.loadNibNamed(identifier, owner: nil, options: nil)?.first as! EDMThisWeekendCell;
////        
////        self.tableView.register(nib, forCellReuseIdentifier: identifier)
////        self.tableView.register(nib, forCellReuseIdentifier: identifier)
////        self.tableView.register(nib, forCellReuseIdentifier: identifier)
//    }
//    
    
    func backToDo()  {
        
        self.navigationController?.popViewController(animated: true)
    }
    
     func navCustomBarButton(_ image:String, selector:Selector = #selector(backToDo)) -> UIBarButtonItem {
         let icon  = UIImage(named:image)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
       let button =  EDMNavLeftButton()
        button.setImage(icon, for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.frame = CGRect(x:0, y:30, width: 18, height: 24)
        let label = UILabel(frame: CGRect(x:18, y:2, width: 50, height: 18))
        label.font = UIFont(name: "PingFangSC-Regular", size: 17)
        label.text = "返回"
        label.textAlignment = .left
        label.textColor = UIColor.hexStringToUIColor(hex: "#303030")
        label.backgroundColor =   UIColor.clear
        button.addSubview(label)
        let barButton = UIBarButtonItem(customView: button)
        return  barButton;
    }
    
    
    
//    func customUIBarButtionView()-> UIBarButtonItem  {
//        let  messageImageView = EDMHomeDotImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
//        messageImageView.image = UIImage(named: "icon_black_message")
//        messageImageView.width = 24
//        messageImageView.height = 24
//        messageImageView.contentMode = .center
//        let messageTap = UITapGestureRecognizer(target: self, action: #selector(self.redirectToMessage))
//        messageImageView.addGestureRecognizer(messageTap)
//        let rightItem:UIBarButtonItem = UIBarButtonItem()
//        rightItem.customView = messageImageView
//        return rightItem
//    }
     func navBarButton(_ image:String, selector:Selector) -> UIBarButtonItem {
        
        let icon  = UIImage(named:image)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
                let navBarButton = UIBarButtonItem(image: icon, style: .plain, target: self, action: selector)
         return  navBarButton;
    }
    
    func navBarButtonWithName(_ title:String, color:UIColor ,selector:Selector) -> UIBarButtonItem {
        
        let navBarButton = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
        
//        navBarButton.tintColor=color;
        navBarButton.setTitleTextAttributes({[
            NSForegroundColorAttributeName: color,
            NSFontAttributeName: UIFont(name: "PingFangSC-Regular", size: 17)!
            ]}(), for: .normal)

        return  navBarButton;
        
    }
    
    
    
    
    
    
}
