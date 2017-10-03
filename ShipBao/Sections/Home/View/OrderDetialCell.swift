//
//  OrderDetialCell.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/10/3.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
class OrderDetialCell: XZRBaseTableviewCell {
    @IBOutlet weak var amountLable: UILabel!
    @IBOutlet weak var weightLable: UILabel!
    @IBOutlet weak var packgeInfoLable: UILabel!
    @IBOutlet weak var transferOrderNumberLable: UILabel!
    var data: Parcel! {
        didSet{
            self.transferOrderNumberLable.text = "訂單號:\(data.trackingNo!)"
            //self.transferMethodValueLable.text = record.type;
           
            var pagekageInfo = "";
            var  totalAmount = 0.00;
            for parcel in (data.parcelInfo)!{
                pagekageInfo = pagekageInfo + parcel.name!+"*\(parcel.qty!)";
                totalAmount += Double(parcel.price!)!
            }
            self.packgeInfoLable.text = pagekageInfo;
            //self.orderStatusValueLabel.text = record.trackingMsg
            if  data.weight != nil{
                self.weightLable.text = "\(data.weight!)\(data.weightUnit)"
            }
            
             self.amountLable.text = "\(data.currency)\(totalAmount)"
            
            //self.statusTimeValueLable.text = record.trackingTime
        }
    }
}
