//
//  LoginViewController.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/8/23.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
import Material
import FTIndicator
class LoginViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    fileprivate var accoutField: ErrorTextField!
    fileprivate var passwordField: ErrorTextField!
    
    @IBOutlet weak var headImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad();
        
        prepareAccoutField()
        preparePasswordField()
        view.backgroundColor = COLORLIKEGREEN
        accoutField.text = "test3@test.com"
        passwordField.text = "111111"
//        headImageView.image =  //Icon.cm.photoCamera
        
    }
    
    @IBAction func registerAction(_ sender: Any) {
    }
    

    @IBAction func forgetPassWorld(_ sender: Any) {
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        if let accoutStr = accoutField.text, accoutStr.characters.count <= 0   {
            FTIndicator.showToastMessage("賬號不能為空！")
            return;
        }
        
        if let accoutStr = passwordField.text, accoutStr.characters.count <= 0   {
            FTIndicator.showToastMessage("密碼不能為空！")
            return;
        }
        
        XZRNetWorkTool.shared.userlogin(username: accoutField.text!, passworld: passwordField.text!) { (respose) in
            FTIndicator.showSuccess(withMessage: "登陆成功")
            
//            let homeDataList = respose;
        
            let tabbar =  getControllerFromStoryBoard("Main", identity: "RAMAnimatedTabBarController")
            self.view.window?.rootViewController = tabbar
            
            
            
            
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true);
    }
}


extension LoginViewController {
    fileprivate func prepareAccoutField() {
        accoutField = ErrorTextField()
        accoutField.placeholder = "賬號:"
//        accoutField.detail = "Error, incorrect email"
        accoutField.isClearIconButtonEnabled = true
        accoutField.delegate = self
        
        accoutField.configErrorTextField()
        containerView.layout(accoutField).top(30).left(20).right(20)
    }
    
    fileprivate func preparePasswordField() {
        passwordField = ErrorTextField()
        passwordField.placeholder = "密碼:"
//        passwordField.detail = "At least 8 characters"
        passwordField.clearButtonMode = .whileEditing
        passwordField.isVisibilityIconButtonEnabled = true
        passwordField.configErrorTextField()
        containerView.layout(passwordField).center(offsetY: -accoutField.height + 15).left(20).right(20)
    }
    
    
}


extension LoginViewController: TextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = true
        
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
}
