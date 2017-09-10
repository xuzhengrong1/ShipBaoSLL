//
//  CalculateVolumeViewController.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/9/10.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
import Material
import FTIndicator
//import JKCategories

class CalculateVolumeController: XZRBaseUIViewController {
    @IBOutlet weak var houseLable: UILabel!
    
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var longTextField: UITextField!
    var nameArray:[String] = [];
    override func viewDidLoad() {
        super.viewDidLoad();
        let tapGestrue = UITapGestureRecognizer(target: self, action: #selector(CalculateVolumeController.showMemu))
        houseLable.isUserInteractionEnabled = true;
        houseLable.addGestureRecognizer(tapGestrue)
    
    }
    
    
    
    @IBAction func comfirmAction(_ sender: UIButton) {
        if let width = longTextField.text,width.characters.count <= 0 {
            FTIndicator.showInfo(withMessage: "長度輸入不能為空")
            return;
        }
        if let  width = widthTextField.text,width.characters.count <= 0 {
            FTIndicator.showInfo(withMessage: "寬度輸入不能為空")
            return
        }
        if let  height = heightField.text, height.characters.count <= 0 {
            FTIndicator.showInfo(withMessage: "高度輸入不能為空")
            return
        }
        
        XZRNetWorkTool.shared.calculateVolume(warehouseId:"", long:longTextField.text! , width: widthTextField.text!, height: heightField.text!) { (respose) in
            
        }
        
    }
    
    
    func createMenuTable()  {
        let sspop =  SSPopup();
        self.view.addSubview(sspop)
        sspop.createTableview(nameArray, withSender: self.houseLable, withTitle: "選擇倉庫地址") { ( index) in
            
        }
    }

    func showMemu()  {
        
//        FTIndicator.showProgress(withMessage: "", userInteractionEnable: false)
        if nameArray.count > 0 {
        
            self.createMenuTable();
            
        }else
        {
            XZRNetWorkTool.shared.loadWarehouses { (respose) in
                let warehouseslists = respose?.warehouseslists
                 self.nameArray =  (warehouseslists?.map{ $0.name! })!
                self.createMenuTable()
            }

        }
        
    }
    
}


            
