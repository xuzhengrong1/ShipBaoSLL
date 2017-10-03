//
//  OrderDetailsViewController.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/10/1.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
class OrderDetailsViewController: XZRBaseTableViewVC {
    var  orderList: RecordList? = nil;
    var  recordData: OrderDetailData? = nil;
    override func viewDidLoad() {
        super.viewDidLoad();
        self.tableView.registerCell(String(describing: OrderDetialCell.self))
        XZRNetWorkTool.shared.getOrderDetailData(orderId:Int((orderList?.id)!)!) { (recordData) in
            self.recordData = recordData
            self.transferTypeLable.text = recordData?.code
            self.orderNumberLable.text = recordData?.type;
            self.addressLable.text = recordData?.customerAddress
            self.telphoneLable.text = "聯繫電話:\((recordData?.customerPhone)!)"
            self.recevierLable.text = "收件人：\((recordData?.customerName)!)";
           // recordData.
            //self.transferTypeLable.text = "運單號：\(rec)"
            self.tableView.reloadData();
           // self.tableView.layoutIfNeeded();
            
        }
       
        //self.addressLable.text = orderList.
    }
    
    @IBOutlet weak var recevierLable: UILabel!
    @IBOutlet weak var telphoneLable: UILabel!
    @IBOutlet weak var addressLable: UILabel!
    @IBOutlet weak var transferTypeLable: UILabel!
    @IBOutlet weak var orderNumberLable: UILabel!
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            
           // let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OrderDetialCell.self),
                                                     //for: indexPath) as! OrderDetialCell
            let cell =  tableView.dequeueCelllForReuse(OrderDetialCell.self, indexPath: indexPath) as! OrderDetialCell;
            cell.data = self.recordData?.parcels?[indexPath.row]
            return cell;
            
        }else
        {
            return super.tableView(tableView, cellForRowAt: indexPath);
        }
    }
    override func tableView(_ tableView: UITableView,
                            indentationLevelForRowAt indexPath: IndexPath) -> Int {
        if indexPath.section == 1{
            //当执行到日期选择器所在的indexPath就创建一个indexPath然后强插
            let newIndexPath = IndexPath(row: 0, section: indexPath.section)
            return super.tableView(tableView, indentationLevelForRowAt: newIndexPath)
        }else{
            return super.tableView(tableView, indentationLevelForRowAt: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3;
            //return super.tableView.numberOfRows(inSection: section)
        }else
        {
           if let count = recordData?.parcels?.count
            {
                return count;
                
            }else
           {
            return  0;
            }
            
        }
    }
}
