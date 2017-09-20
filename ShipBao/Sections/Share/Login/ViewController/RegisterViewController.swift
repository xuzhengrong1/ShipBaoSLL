//
//  RegisterViewController.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/9/16.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
import M13Checkbox
import FTIndicator
class RegisterViewController: XZRBaseTableViewVC {
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var telphoneTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var loginPassworldField: UITextField!
    
    @IBOutlet weak var comfirmPassworldField: UITextField!
    
    @IBOutlet weak var verifyTextField: UITextField!
    
    @IBOutlet weak var agreeCheckBox: M13Checkbox!
    @IBOutlet weak var verifyView: UIView!
    fileprivate var verifyCodeView:VerifyView!
    override func viewDidLoad() {
        verifyCodeView = VerifyView();
        agreeCheckBox.boxType = .square
        agreeCheckBox.boxLineWidth = 2
        agreeCheckBox.checkmarkLineWidth = 2
      agreeCheckBox.stateChangeAnimation = .fill
        agreeCheckBox.tintColor = COLORLIKEGREEN
        agreeCheckBox.secondaryCheckmarkTintColor = UIColor.white
        verifyCodeView.frame = CGRect(x: 0, y: 0, width: verifyView.width, height: verifyView.height);
        verifyView.addSubview(verifyCodeView)
    }
    
    

    
    @IBAction func comfirmRegister(_ sender: UIButton) {
        
        
        if verifyTextField.text?.lowercased()  !=  verifyCodeView.verifyStr!.lowercased(){
            FTIndicator.showToastMessage("驗證碼錯誤")
            return;
        
        }
        
        
//        XZRNetWorkTool.shared.register(email: "842841022@qq.com", firstName: "xu", lastName: "zhengrong", phoneAreaCode: "", phone: "17688823936", taobaoName: "", referralCode: "", passWorld: "123456", comfirmPassworld: "123456", agree: "1") { (json) in
//            
//        }
    
// TODO: JSON数据返回
        
//        JSON: {
//            "status" : 1,
//            "data" : null,
//            "token" : "xGi5aKa-xUdDqv9sucoMyqQZ9ZfasNBuXllfqTk0tGjDBx-Kt9CecY9Lov1KKRVXNgTh_t1PlcG0Oiuf6o2wzg",
//            "msg" : "你已成功登入"
//        }
        
        XZRNetWorkTool.shared.register(email: emailTextField.text!, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, phoneAreaCode: "852", phone: telphoneTextField.text!, taobaoName: "", referralCode: "", passWorld: loginPassworldField.text!, comfirmPassworld: comfirmPassworldField.text!, agree: agreeCheckBox.checkState.rawValue) { (json) in
            
        
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         view.endEditing(true);
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10
        }
        return tableView.sectionHeaderHeight
    }
    
   
}
