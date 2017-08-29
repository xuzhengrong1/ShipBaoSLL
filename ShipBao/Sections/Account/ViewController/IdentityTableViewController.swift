//
//  IdentityTableViewController.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/8/29.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
import YNExpandableCell
class IdentityTableViewController: UITableViewController,YNTableViewDelegate {
    
    @IBOutlet var ynTableView: YNTableView!
    override func viewDidLoad() {
        let cells = ["IdentityCell","identityPicCell"]
        self.ynTableView.registerCellsWith(nibNames: cells, and: cells)
        self.ynTableView.rowHeight =  UITableViewAutomaticDimension
        self.ynTableView.ynDelegate = self
        self.ynTableView.ynTableViewRowAnimation = .top
    }
    
    func tableView(_ tableView: YNTableView, expandCellWithHeightAt indexPath: IndexPath) -> YNTableViewCell? {
        let ynSliderCell = YNTableViewCell()
        ynSliderCell.cell = tableView.dequeueReusableCell(withIdentifier: "identityPicCell") as! identityPicCell
        ynSliderCell.height = 142
        
        
        
        return ynSliderCell
    }

    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        } else if section == 1 {
            return 5
        } else if section == 2 {
            return 5
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expandableCell = tableView.dequeueReusableCell(withIdentifier: "IdentityCell") as! IdentityCell
       
        return expandableCell
        
    }
    
    
}
