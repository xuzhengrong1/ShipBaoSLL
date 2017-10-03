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
    var cellData:[[[String : String]]] = [[[String : String]()]]
    override func viewDidLoad() {
    super.viewDidLoad()
        cellData = [[[kCellViewController:String(describing: SendRecordViewController.self)]],
                    [
            [kCellViewController:"SendRecordViewController"],[kCellViewController:String(describing: CalculateVolumeController.self)],
            [kCellViewController:"SendRecordViewController"],
                                                                        ],
                    [
                        [kCellViewController:"SendRecordViewController"]
                        ]
        
        ]
        headerView = HomeHeaderView.loadFromNibNamed() as! HomeHeaderView
        
        headerView.autoresizingMask = .flexibleWidth
        self.tableView.tableHeaderView = headerView;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.navigationBar.isHidden = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false;
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
let dic =  cellData[indexPath.section][indexPath.row];
        
        
        
//        let vc =   getControllerFromStoryBoard("Home", identity:String(describing: TestViewController.self))
//        navigationController?.pushViewController(vc, animated: true)
   let sendVc =      stringClassFromString(dic[kCellViewController]!) as! UIViewController.Type;
        navigationController?.pushViewController(sendVc.init(), animated: true)
        
    }
}
