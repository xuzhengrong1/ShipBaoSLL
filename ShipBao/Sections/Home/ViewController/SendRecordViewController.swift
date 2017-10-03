//
//  CollegesViewController.swift
//  YDMShop
//
//  Created by huangwenfeng on 2017/1/21.
//  Copyright © 2017年 elenjoy. All rights reserved.
//

import UIKit
import  XLPagerTabStrip
//import SwiftyJSON
class SendRecordViewController: ButtonBarPagerTabStripViewController,NavgationTransitionable {


    var tr_pushTransition: TRNavgationTransitionDelegate?
   
    override func viewDidLoad() {
        self.title = "發貨記錄"
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarMinimumLineSpacing = 5
        
        settings.style.selectedBarHeight = 2.0
        
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 17)
        settings.style.buttonBarLeftContentInset = 10
//        settings.style.buttonBarRightContentInset = 20
        
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            
            guard changeCurrentIndex == true else { return }
            
            
            oldCell?.label.textColor = UIColor.hexStringToUIColor(hex: "#303030")
            oldCell?.label.font = UIFont.systemFont(ofSize: 15)
            newCell?.label.textColor = NavTintColor
            newCell?.label.font = UIFont.systemFont(ofSize: 17)
           
        }

       super.viewDidLoad()
        buttonBarView.selectedBar.backgroundColor = NavTintColor//UIColor.hexStringToUIColor(hex: "#F76E16")
        buttonBarView.backgroundColor = UIColor.white//UIColor.hexStringToUIColor(hex: "#F7F8FA")
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
   
        var controllersArr:[UIViewController] = []
        if controllersArr.count <= 0 {
            
            let recommend = SendRecordTableViewController(style: .plain, itemInfo:"等待處理" , type:"1")
            let new = SendRecordTableViewController(style: .plain, itemInfo:"未完成訂單" , type:"2")
            controllersArr = [recommend,new]
        }
       
        return controllersArr
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    
    
}

extension UIColor
{
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
}
}

