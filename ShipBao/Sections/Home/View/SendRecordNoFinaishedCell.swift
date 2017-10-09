//
//  SendRecordNoFinaishedCell.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/9/24.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
import PopupDialog
import FTIndicator

protocol SendRecordNoFinaishedCellDelegate{
    func sendRecordNoFinaishedCellClick(_ record:RecordList)
}

class SendRecordNoFinaishedCell: XZRBaseTableviewCell {
    
    @IBOutlet weak var statusTime: UILabel!
    @IBOutlet weak var packageWeight: UILabel!
    @IBOutlet weak var packegeInfoLable: UILabel!
    var delegate: SendRecordNoFinaishedCellDelegate?
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
    
    @IBAction func continutAction(_ sender: UIButton) {
        
        
        
    }
    @IBAction func cancel(_ sender: UIButton) {
        
        
        let popup = PopupDialog(title: "取消訂單", message: "確定取消該訂單?", image: nil)
        //        popup.layout
        let buttonOne = CancelButton(title: "取消") {
        }
        
        
        let buttonTwo = DefaultButton(title: "確定") {
            XZRNetWorkTool.shared.cancelOrder(orderId:Int(self.record.id!)! , finished: { (status) in
                if(status == 1)
                {
                    self.delegate?.sendRecordNoFinaishedCellClick(self.record)
                    FTIndicator.showSuccess(withMessage: "取消成功")
                }else{
                    FTIndicator.showError(withMessage: "取消失敗")
                }
                
                
            })
        }
        buttonTwo.titleColor = COLORLIKEGREEN
        popup.buttonAlignment = .horizontal
        
        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne, buttonTwo])
        // Present dialog
        self.parentViewController?.present(popup, animated: true, completion: nil)
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews();
        self.contentView.layoutIfNeeded();
        packegeInfoLable.sizeToFit()
        packageWeight.sizeToFit();
        statusTime.sizeToFit();
    }

}
