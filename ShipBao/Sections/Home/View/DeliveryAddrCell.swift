//
//  DeliveryAddrCell.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/10/5.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
import M13Checkbox
import PopupDialog

protocol DeliveryAddrCellDelegate{
    func deliveryAddrCellValueChage(_ changeId:String);
    func deliveryAddrCellDelAddr(_ deliverAddrList:DeliverAddressList);
}

class DeliveryAddrCell : XZRBaseTableviewCell{
    
    @IBOutlet weak var transferTypeLabel: UILabel!
    @IBOutlet weak var detailAddrLabel: UILabel!
    
    @IBOutlet weak var telphoneLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var delButton: UIButton!
    
    @IBOutlet weak var editButton: UIButton!
    
    var delegate: DeliveryAddrCellDelegate?
//    UIImage(named: "ic_delete_grey")
    @IBAction func valueChangeAction(_ sender: M13Checkbox) {
        if data.defaultField == "1" {
            self.defaultCheckbox.setCheckState(.checked, animated: true)
        }else
        {
            self.defaultCheckbox.setCheckState(.unchecked, animated: true)
        }
        if let changeId = data.id,data.defaultField == "0" {
            
            let popup = PopupDialog(title: "設置默認地址", message: "確定設置該地址為默認地址?", image: nil)
            
            let buttonOne = CancelButton(title: "取消") {
            }
            let buttonTwo = DefaultButton(title: "確定") {
                self.delegate?.deliveryAddrCellValueChage(changeId);
            }
            buttonTwo.titleColor = COLORLIKEGREEN
            popup.buttonAlignment = .horizontal
            
            popup.addButtons([buttonOne, buttonTwo])
            
            self.parentViewController?.present(popup, animated: true, completion: nil)
            
        }
    }
    
    @IBOutlet weak var defaultCheckbox: M13Checkbox!
    override func awakeFromNib() {
        super.awakeFromNib();
        defaultCheckbox.boxType = .square
        defaultCheckbox.boxLineWidth = 2
//        defaultCheckbox.isUserInteractionEnabled = false;
        defaultCheckbox.checkmarkLineWidth = 2
        defaultCheckbox.stateChangeAnimation = .fill
        defaultCheckbox.tintColor = COLORLIKEGREEN
        defaultCheckbox.secondaryCheckmarkTintColor = UIColor.white
    }
    var data: DeliverAddressList! {
        didSet{
            self.transferTypeLabel.text = data.orderType;
            self.detailAddrLabel.text = data.customerAddress;
            self.telphoneLabel.text = data.customerPhone;
            self.nameLabel.text = data.customerName;
            if data.defaultField == "1" {
                self.defaultCheckbox.setCheckState(.checked, animated: true)
            }else
            {
                self.defaultCheckbox.setCheckState(.unchecked, animated: true)
            }
            
        }
    }

    @IBAction func delAddress(_ sender: UIButton) {
        if let delId = data.id{
            
            let popup = PopupDialog(title: "刪除地址", message: "確定刪除該地址?", image: nil)
            
            let buttonOne = CancelButton(title: "取消") {
            }
            let buttonTwo = DefaultButton(title: "確定") {
                self.delegate?.deliveryAddrCellDelAddr(self.data);
            }
            buttonTwo.titleColor = COLORLIKEGREEN
            popup.buttonAlignment = .horizontal
            
            popup.addButtons([buttonOne, buttonTwo])
            
            self.parentViewController?.present(popup, animated: true, completion: nil)
            
        }

    }
}
