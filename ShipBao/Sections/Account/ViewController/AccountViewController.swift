//
//  AccountViewController.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/8/29.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
class AccountViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 2 {
           let vc =   getControllerFromStoryBoard("Accout", identity:"IdentityTableViewController") as! IdentityTableViewController;
            self.navigationController?.pushViewController(vc, animated: true);
        }
    }
}
