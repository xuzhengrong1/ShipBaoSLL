//
//  ForgetPassworldViewController.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/9/16.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
import Material
import FTIndicator

class ForgetPassworldViewController: XZRBaseUIViewController {
    
    fileprivate var emailField: ErrorTextField!
//    struct Raised {
//        static let width: CGFloat = 150
//        static let height: CGFloat = 44
//        static let offsetY: CGFloat = -75
//    }
     fileprivate var verifyField: ErrorTextField!
    fileprivate var tipLable: UILabel!
    fileprivate var comfirmButton: RaisedButton!
    fileprivate var tipImageView: UIImageView!
    var verifyView:VerifyView = VerifyView();
    override func viewDidLoad() {
        prepareemailField();
        prepareverifyField();
        prepareRaisedButton();
        prepareImageView()
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true);
    }
}


extension ForgetPassworldViewController {
    
    fileprivate func prepareRaisedButton() {
        comfirmButton = RaisedButton(title: "確定", titleColor: .white)
        comfirmButton.pulseColor = .white;
        comfirmButton.backgroundColor = COLORLIKEGREEN
        view.layout(comfirmButton).left(kDdefaultMargin).right(kDdefaultMargin).top(kForgetPassworldTop + kDefaultCellSpace * 5 + 10)
        comfirmButton.addTarget(self, action: #selector(ForgetPassworldViewController.comfirmButttonAction), for: .touchUpInside)
        

    }
    @objc fileprivate func comfirmButttonAction()
    {
        if let email = emailField.text ,email.characters.count <= 0{
            FTIndicator.showToastMessage("請輸入郵箱")
            return;
        }
        if let verfiy = verifyField.text ,verfiy.characters.count <= 0{
    
            FTIndicator.showToastMessage("請輸入驗證碼")
            return;
        }
        
      
        
        XZRNetWorkTool.shared.forgetPassWorld(email: emailField.text!) { (json) in
            
            
        }
        
        
        
    }
    
    fileprivate func prepareImageView()
    {
        tipImageView = UIImageView();
        tipImageView.frame = CGRect(x:kDdefaultMargin , y:kForgetPassworldTop + kDefaultCellSpace * 5 + 70  , width: 20, height: 20  )
        tipImageView.image = UIImage(named: "ic_suggestion");
        view.addSubview(tipImageView);
        
        tipLable = UILabel();
        tipLable.text = "提交信息后，我們會把新的密碼電郵給您";
        tipLable.textColor = COLORLIKEGRAY
        tipLable.font = UIFont.systemFont(ofSize: 13)
        tipLable.frame = CGRect(x: tipImageView.frame.maxX, y:kForgetPassworldTop + kDefaultCellSpace * 5 + 60  , width: 300, height: 40)
        view.addSubview(tipLable);
    }

    
    fileprivate func prepareemailField() {
        emailField = ErrorTextField()
        emailField.placeholder = "輸入註冊電子郵箱"
        emailField.detail = "會員電郵格式不正確"
        emailField.isClearIconButtonEnabled = true
        emailField.delegate = self
        emailField.configErrorTextField()
        view.layout(emailField).top(kForgetPassworldTop).left(kDdefaultMargin).right(kDdefaultMargin)
    }
    
    fileprivate func prepareverifyField() {
        verifyField = ErrorTextField()
        verifyField.placeholder = "輸入驗證碼"
        verifyField.detail = "驗證碼輸入有誤"
         verifyField.delegate = self
        verifyField.clearButtonMode = .whileEditing
//        verifyField.isVisibilityIconButtonEnabled = true
        verifyField.configErrorTextField()
        view.layout(verifyField).top(kForgetPassworldTop + kDefaultCellSpace * 3  ).left(kDdefaultMargin).right(120)
        
        verifyView.frame = CGRect(x:view.width - 100, y: kForgetPassworldTop + kDefaultCellSpace * 3, width: 80, height: 40)
        view.addSubview(verifyView);
        
        
        
        
    }
    

    
    
}


extension ForgetPassworldViewController: TextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        let emil  = textField as? ErrorTextField;
        if emil == emailField {
            emailField?.isErrorRevealed = !isValidEmail(testStr: emailField.text!);
        }
        if emil == verifyField {
           
         let isVerified =  ( verifyField.text?.lowercased()  ==  verifyView.verifyStr!.lowercased() )
            verifyField?.isErrorRevealed = !isVerified;
        }
        
        
        

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
