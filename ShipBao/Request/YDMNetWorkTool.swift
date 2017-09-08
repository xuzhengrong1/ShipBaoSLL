//
//  YDMNetWorkTool.swift
//  YDMShop
//
//  Created by Xuzhengrong on 2017/2/7.
//  Copyright © 2017年 elenjoy. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON
import YYModel


public class  YDMNetWorkTool : NSObject
{
    public var sessionManager: SessionManager;
    public var token : String? {
        let userToken  = UserDefaults().string(forKey: "user_token");
        return userToken
        
    }
    
    public static let shared = YDMNetWorkTool();
    
    
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
extension YDMNetWorkTool {
    /// 发送POST请求
    func request(urlString :  String,method: String, params : [String : Any]?, completionHandler : @escaping (_ responseObject : JSON?,_ error: NSError?)->() ) {
    
        let url = URL(string: BASE_URL)
        if url != nil{
            var urlRequest = URLRequest(url: url!)
            urlRequest.httpMethod = method
            do {
                
                let requestStr  = self.formartParameters(params: params, methodName: urlString ,userToken: true);
                if  requestStr.characters.count > 0 {
                    let data = requestStr.data(using: .utf8);
                    urlRequest.httpBody = data
                    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    sessionManager.request(urlRequest).responseJSON{
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
                }
            } catch {
                
            }
            
        }
        
    }
    
    func postRequest(urlString : String, params :  [String : Any]?, completionHandler : @escaping (_ responseObject : JSON?,_ error: NSError?)->() ) {
            self.request(urlString: urlString, method: "POST",params: params, completionHandler: completionHandler)
    }
    
    func getRequest(urlString : String, params : [String : [String : Any]],  completionHandler : @escaping (_ responseObject : JSON?,_ error: NSError?)->() ) {
        self.request(urlString: urlString, method: "GET",params: params,  completionHandler: completionHandler)
    }
    
    func formartParameters(params:[String: Any]? = nil ,methodName : String = "", userToken: Bool) -> String {
    
//        let cookieHeader = (params.flatMap({ (key, value) -> String in
//            return "\(key):\(value)"
//        }) as Array).joined(separator: ";")
        var  parasStr = JSON(params).rawString();
       parasStr = parasStr?.replacingOccurrences(of: "\"{", with: "{").replacingOccurrences(of:"}\"" , with: "}");
        let sigin = APP_ID + SUB_APP_ID + "{\n    \"password\" : \"111111\",\n    \"email\" : \"test3@test.com\"\n  },\n " + methodName  + VERSIONSTR + SHIPBAO_APP
        
        let siginStr  = sigin.md5String.uppercased();
        
        var fixedParameters :[String : Any]   = ["sign":siginStr,"method":methodName,"data":params,"v":VERSIONSTR];
        
        fixedParameters["token"] = "";
      let decodePara =  JSON(fixedParameters).rawString();
        return decodePara!;
    }
}


extension YDMNetWorkTool {
    func userlogin(username userName:String, passworld:String, finished:@escaping (_ loginMoel: JSON?)->()) {
      
        
        let params =  [ "mobile" : userName ,"passwd":passworld ];
        YDMNetWorkTool.shared.postRequest(urlString: "/user/login", params: params) { (response, error) in
            if error != nil {
               finished(nil)
            }else
            {
                finished(response)
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
