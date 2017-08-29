//
//  UITableView+RegisterNib.swift
//  Merchant
//
//  Created by 许正荣 on 2017/5/3.
//  Copyright © 2017年 卢羊羊. All rights reserved.
//

import Foundation
import UIKit
extension UITableView{
    func  registerCell(_ identifier: String)
    {
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func dequeueCelllForReuse<T>(_ cellClass: Swift.AnyClass,indexPath:IndexPath) -> T where  T:UITableViewCell  {
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: cellClass), for: indexPath)
        return cell as! T
    }
}
