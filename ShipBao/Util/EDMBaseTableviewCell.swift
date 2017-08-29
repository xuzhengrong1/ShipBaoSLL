//
//  EDMBaseTableviewCell.swift
//  YDMShop
//
//  Created by Xuzhengrong on 2017/2/13.
//  Copyright © 2017年 elenjoy. All rights reserved.
//

import Foundation
class EDMBaseTableviewCell: UITableViewCell {
    override func awakeFromNib() {
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
    }
    
    
    static func getCelllForReuse<T>(_ tableView: UITableView, indexPath:IndexPath) -> T where  T:UITableViewCell  {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: self), for: indexPath)
        if  cell == nil {
            if let cellTemp  = Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as? T {
                cell = cellTemp
            }
        }
        
        return cell as! T
    }
    
    static func getCelllForReuseFirst<T>(_ tableView: UITableView, indexPath:IndexPath) -> T where  T:UITableViewCell  {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: self), for: indexPath)
        if  cell == nil {
            if let cellTemp  = Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.first as? T {
                cell = cellTemp
            }
        }
        
        return cell as! T
    }

}
