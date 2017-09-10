//
//  CalculateVolumeViewController.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/9/10.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
import Material
class CalculateVolumeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
    
    
//        view.layout(volView).top(40).left(20).right(20);
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    //3.重写无参数初始化方法，自动调用xib文件
    convenience init() {
        
        let nibNameOrNil = String(describing: type(of: self))
        
        //考虑到xib文件可能不存在或被删，故加入判断
        if Bundle.main.path(forResource: nibNameOrNil, ofType: "nib") != nil
        {
            
            self.init(nibName: nibNameOrNil, bundle: nil)
            
        }else{
            
            self.init(nibName: nil, bundle: nil)
            
            self.view.backgroundColor = UIColor.white
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
