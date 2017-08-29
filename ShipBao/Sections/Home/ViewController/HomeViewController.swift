//
//  HomeViewController.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/8/19.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
import UIKit
// 

class HomeViewController:UITableViewController {
    
    var headerView:HomeHeaderView! = nil;
    var cellData:[[String : String]] = [[String : String]()]
    override func viewDidLoad() {
    super.viewDidLoad()
        
        cellData = [[kCellViewController:"SendRecordViewController"]]
        headerView = HomeHeaderView.loadFromNibNamed() as! HomeHeaderView
        headerView.autoresizingMask = .flexibleWidth
        self.tableView.tableHeaderView = headerView;
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
   let sendVc =      stringClassFromString("SendRecordViewController") as! SendRecordViewController.Type;
        
//        sendVc
    let vc = sendVc.init() 
        
//        navigationController?.tr_pushViewController(vc, method: TRPushTransitionMethod.page)
        
        
//        navigationController?.tr_pushViewController(vc, method: TRPushTransitionMethod.page)
//        navigationController?.tr_pushViewController(sendVc, method: <#T##TransitionAnimationable#>)
        
        
        navigationController?.pushViewController(sendVc.init(), animated: true);
        
//         =cellData[indexPath.section];
        
    }
}
