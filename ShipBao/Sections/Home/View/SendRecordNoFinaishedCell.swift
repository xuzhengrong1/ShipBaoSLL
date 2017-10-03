//
//  SendRecordNoFinaishedCell.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/9/24.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
class SendRecordNoFinaishedCell: XZRBaseTableviewCell {
    @IBOutlet weak var statusTime: UILabel!
    @IBOutlet weak var packageWeight: UILabel!
    @IBOutlet weak var packegeInfoLable: UILabel!
    
    
    @IBOutlet weak var orderNumber: UILabel!
    
    
    @IBOutlet weak var pagekageInfoValueLable: UILabel!
    
    @IBOutlet weak var packegeWeightValueLable: UILabel!
    
    @IBOutlet weak var statusTimeValueLable: UILabel!
    
    var record:RecordList!{
        didSet{
            self.orderNumber.text = "訂單號:\(record.code!)"
            var pagekageInfo = "";
            for parcel in (record.parcels?.first?.parcelInfo)! {
                pagekageInfo = pagekageInfo + parcel.name!+"*\(parcel.qty!)";
            }
            self.pagekageInfoValueLable.text = pagekageInfo;
            if  record.weight != nil{
                self.packegeWeightValueLable.text = "\(record.weight!)磅"
            }
            
            self.statusTimeValueLable.text = record.trackingTime
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib();
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        self.contentView.layoutIfNeeded();
        packegeInfoLable.sizeToFit()
        packageWeight.sizeToFit();
        statusTime.sizeToFit();
    }

}
