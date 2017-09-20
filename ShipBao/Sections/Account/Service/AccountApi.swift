//
//  AccountApi.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/9/16.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation

import SwiftyJSON

extension XZRNetWorkTool {
    
    
    
    func register(email:String ,firstName:String,lastName:String,phoneAreaCode:String,phone:String,taobaoName:String,referralCode:String,passWorld:String,comfirmPassworld:String,agree:String,finished:@escaping (_ homData: JSON)->()) -> () {
        let params =  [ "email" : email,"first_name":firstName,"last_name":lastName,"phone_area_code":phoneAreaCode,"phone":phone,"taobao_name":taobaoName,"referral_code":referralCode,"password":passWorld,"confirm_password":comfirmPassworld,"agree":agree];
        
        XZRNetWorkTool.shared.postRequest(methodName:"member_register", params: params) { (response, error) in
            finished(response!);
        }
        
    }
    
    
    func forgetPassWorld(email:String ,finished:@escaping (_ homData: JSON)->()) -> () {
        let params =  [ "email" : email];
        XZRNetWorkTool.shared.postRequest(methodName:"member_forgot_password", params: params) { (response, error) in
            finished(response!);
        }
        
    }
}
