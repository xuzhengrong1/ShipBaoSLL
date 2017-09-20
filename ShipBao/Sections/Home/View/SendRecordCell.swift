//
//  SendRecordCell.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/9/20.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation

class SendRecordCell: XZRBaseTableviewCell {
    @IBOutlet weak var transferMethod: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib();
    }
    @IBOutlet weak var statusTime: UILabel!
    @IBOutlet weak var orderStatus: UILabel!
    @IBOutlet weak var packageWeight: UILabel!
    @IBOutlet weak var packegeInfoLable: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews();
        self.contentView.layoutIfNeeded();
        packegeInfoLable.sizeToFit()
        packageWeight.sizeToFit();
        orderStatus.sizeToFit();
        statusTime.sizeToFit();
        transferMethod.sizeToFit();
        
        
        
    }
    
    
}
