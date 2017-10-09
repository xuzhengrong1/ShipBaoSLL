//
//  DeliveryAddrViewController.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/10/5.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
import FTIndicator
class DeliveryAddrViewController : XZRBaseTableViewVC{
    var greenView:UIView? = nil
    var deliveryData : DeliverData? = nil;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerCell(String(describing: DeliveryAddrCell.self))
//        self.automaticallyAdjustsScrollViewInsets = false
        self.automaticallyAdjustsScrollViewInsets = false;
        XZRNetWorkTool.shared.getAddressList { (deliveryData) in
            self.deliveryData = deliveryData;
            self.tableView.reloadData();
        }
//       self.navigationController?.navigationBar.isTranslucent = false
       let frame = CGRect(x: self.view.width - 60, y: self.view.height - 60 - 64 , width: 40, height: 40);
        greenView = UIView(frame: frame)
        greenView?.cornerRadius = frame.width/2;
        greenView?.backgroundColor = COLORLIKEGREEN
        
         let imageView = UIButton(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.setImage(UIImage(named:"ic_add_white"), for: .normal)
        greenView?.addSubview(imageView);
        self.tableView.addSubview(greenView!);
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        greenView?.frame = CGRect(x: (greenView?.frame.origin.x)!, y: self.tableView.height - 60 + self.tableView.contentOffset.y , width: 40, height: 40)

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let deliveryList = deliveryData?.deliverAddressList {
            return deliveryList.count;
        }
        return 0;
    }

//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews();
//
//    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect.zero);
        view.backgroundColor = .clear;
        return view;
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueCelllForReuse(DeliveryAddrCell.self, indexPath: indexPath) as! DeliveryAddrCell;
        cell.data = deliveryData?.deliverAddressList?[indexPath.section]
        cell.delegate = self;
        return cell;
    }
    
    
}

extension DeliveryAddrViewController: DeliveryAddrCellDelegate
{
    func deliveryAddrCellValueChage(_ changeId:String){
            XZRNetWorkTool.shared.changeDefaultAddr(changeId: changeId) { (msg) in
                FTIndicator.showInfo(withMessage: msg);
                XZRNetWorkTool.shared.getAddressList { (deliveryData) in
                    self.deliveryData = deliveryData;
                    self.tableView.reloadData();
                }
        }
    }
    
    func deliveryAddrCellDelAddr(_ deliverAddrList: DeliverAddressList) {
        XZRNetWorkTool.shared.delAddr(delId: deliverAddrList.id!) { (msg) in
            
            if let index = self.deliveryData?.deliverAddressList?.index(of: deliverAddrList) {
                
                self.tableView.beginUpdates()
                self.deliveryData?.deliverAddressList?.remove(at: index)
                let indexSet = IndexSet(arrayLiteral: index)
                self.tableView.deleteSections(indexSet, with: .bottom)
                self.tableView.endUpdates()
            }
            FTIndicator.showInfo(withMessage: msg);
        }

    }
}
