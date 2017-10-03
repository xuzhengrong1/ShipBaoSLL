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
    

    @IBOutlet weak var orderNumber: UILabel!
    
    @IBOutlet weak var transferMethodValueLable: UILabel!
    
    @IBOutlet weak var pagekageInfoValueLable: UILabel!
    
    @IBOutlet weak var orderStatusValueLabel: UILabel!
    @IBOutlet weak var packegeWeightValueLable: UILabel!
    
    @IBOutlet weak var statusTimeValueLable: UILabel!
    
   
    @IBOutlet weak var priceLable: UILabel!
    
    var record:RecordList!{
        didSet{
            self.orderNumber.text = "訂單號:\(record.code!)"
            self.transferMethodValueLable.text = record.type;
           var pagekageInfo = "";
            for parcel in (record.parcels?.first?.parcelInfo)! {
               pagekageInfo = pagekageInfo + parcel.name!+"*\(parcel.qty!)";
            }
            self.pagekageInfoValueLable.text = pagekageInfo;
            self.orderStatusValueLabel.text = record.trackingMsg
            if  record.weight != nil{
                self.packegeWeightValueLable.text = "\(record.weight!)磅"
            }
            
            self.statusTimeValueLable.text = record.trackingTime
        }
    }
    
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
