//
//  XZRNetWorkTool.swift
//  YDMShop
//
//  Created by Xuzhengrong on 2017/2/7.
//  Copyright © 2017年 elenjoy. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON
//import YYModel
import FTIndicator
import SwiftyUserDefaults


public class  XZRNetWorkTool : NSObject
{
    public var sessionManager: SessionManager;
    public var token : String? {
        let userToken  = UserDefaults().string(forKey: "user_token");
        return userToken
        
    }
    
    public static let shared = XZRNetWorkTool();
    
    
    override init() {
      
           sessionManager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default);
//        sessionManager
        
    }
    
//    //加载证书
//    static func certificateWithFileName(_ fileName: String) -> SecCertificate {
//        class Locater {}
//        let filePath = Bundle(for: Locater.self).path(forResource: fileName, ofType: "cer")!
//        let data = try! Data(contentsOf: URL(fileURLWithPath: filePath))
//        let certificate = SecCertificateCreateWithData(nil, data as CFData)!
//        
//        return certificate
//    }
}


import Foundation
extension XZRNetWorkTool {
    /// 发送POST请求
    func request(urlString :  String,method: String, params : [String : String]?, completionHandler : @escaping (_ responseObject : JSON?,_ error: NSError?)->() ) {
    
        let url = URL(string: BASE_URL)
        if url != nil{
            var urlRequest = URLRequest(url: url!)
            urlRequest.httpMethod = method
            do {
                let paramst = "";
                let requestDic  = self.formartParameters(params: params, methodName: urlString ,userToken: true);
                Alamofire.request(BASE_URL, method: .post, parameters: requestDic , encoding: URLEncoding.default , headers: nil).responseJSON{
                    response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        print("JSON: \(json)")
                        completionHandler(json ,nil)
                    case .failure:
                        completionHandler(nil,response.result.error! as NSError)
                        print("网络加载失败")
                    }};
                
//                if  requestStr.characters.count > 0 {
//                let data = try? JSONSerialization.data(withJSONObject: requestStr, options: [])
////                     let data = requestStr.data(using: .utf8);
//                    urlRequest.httpBody = data
//                    urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//                
//                    Alamofire.request(urlRequest).responseJSON{
//                        response in
//                        switch response.result {
//                        case .success(let value):
//                            let json = JSON(value)
//                            print("JSON: \(json)")
//                            completionHandler(json ,nil)
//                        case .failure:
//                            completionHandler(nil,response.result.error! as NSError)
//                            print("网络加载失败")
//                        }};
//                }
            } catch {
                
            }
            
        }
        
    }
    
    func postRequest(methodName : String, params :  [String : String]?, completionHandler : @escaping (_ responseObject : JSON?,_ error: NSError?)->() ) {
        let requestDic  = self.formartParameters(params: params, methodName: methodName ,userToken: true);
        Alamofire.request(BASE_URL, method: .post, parameters: requestDic , encoding: URLEncoding.default , headers: nil).responseJSON{
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let status  = json["status"].int ;
                if status == 1{
                    completionHandler(json ,nil)
                }else{
                    let msg  = json["msg"].rawString()
                    FTIndicator.showToastMessage(msg);
                }
                print("JSON: \(json)")
                
            case .failure:
                completionHandler(nil,response.result.error! as NSError)
                print("网络加载失败")
            }};
    }
    
    func getRequest(urlString : String, params : [String :String],  completionHandler : @escaping (_ responseObject : JSON?,_ error: NSError?)->() ) {
        self.request(urlString: urlString, method: "GET",params: params,  completionHandler: completionHandler)
    }
    
    func formartParameters(params:[String: String]? = nil ,methodName : String = "", userToken: Bool) -> [String : Any] {
        let json = ELJJSON.jsonString(params);

        let sigin = APP_ID + SUB_APP_ID +  "\(json!)" + methodName  + VERSIONSTR + SHIPBAO_APP
        
        let siginStr  = sigin.md5String.uppercased();
        
        var fixedParameters :[String : Any]   = ["sign":siginStr,"method":methodName,"data":json!,"v":VERSIONSTR];
        if let token = Defaults[.usertoken],  token.characters.count > 0 {
            if methodName != "member_login" && methodName != "member_forgot_password"  {
                fixedParameters["token"] = token
            }
        }
        return fixedParameters;
        //return decodePara!;
    }
}


extension XZRNetWorkTool {
    func userlogin(username userName:String, passworld:String, finished:@escaping (_ homData: HomeDataList?)->()) {
        
        let params =  [ "email" : userName ,"password":passworld ];
        XZRNetWorkTool.shared.postRequest(methodName:"member_login", params: params) { (response, error) in
            if let responseStr = response?["data"].rawString()  {
                Defaults[.usertoken] = response?["token"].rawString()
                let  homeDataList  = HomeDataList(JSONString: responseStr);
                Defaults[.homeDataList] = homeDataList;
                
                finished(homeDataList);
            }
        }

    }
}

extension Dictionary {
    mutating func update(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}

extension String: ParameterEncoding {
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
    
}
