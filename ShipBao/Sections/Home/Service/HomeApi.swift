//
//  HomeApi.swift
//  ShipBao
//
//  Created by Xuzhengrong on 2017/9/10.
//  Copyright © 2017年 COE. All rights reserved.
//

import Foundation
import SwiftyUserDefaults
import SwiftyJSON
extension XZRNetWorkTool{
    
    
    func getOrderDetailData(orderId:Int,finished:@escaping (_ orderData: OrderDetailData?)->()) -> () {
        let params =  [ "id" : orderId];
        
        XZRNetWorkTool.shared.postRequest(methodName:"order_detail", params: params) { (response, error) in
            if let responseStr = response?["data"].rawString()  {
                
                let orderDetailData =   OrderDetailData(JSONString: responseStr);
                finished(orderDetailData);
            }
        }
    }
    
    func getOrderList(scene:Int,page:Int,pageSize:Int,finished:@escaping (_ homData: RecordDataList?)->()) -> () {
        let params =  [ "scene" : scene,"page": page,"page_size":pageSize];
        
        XZRNetWorkTool.shared.postRequest(methodName:"order_list", params: params) { (response, error) in
            if let responseStr = response?.rawString()  {
                
              let recordData =   RecordDataList(JSONString: responseStr);
                finished(recordData);
                
//                let wareHouse =  Warehousesdata(JSONString:responseStr );
//                finished(wareHouse);
            }
        }
        
    }
    
    
    func loadWarehouses(finished:@escaping (_ homData: Warehousesdata?)->()) -> () {
        let params =  [ "scene" : "" ];
        XZRNetWorkTool.shared.postRequest(methodName:"parcel_warehouses_list", params: params) { (response, error) in
            if let responseStr = response?["data"].rawString()  {
               let wareHouse =  Warehousesdata(JSONString:responseStr );
                finished(wareHouse);
            }
        }
        
    }
    
    
    
    
    
    func calculateVolume(warehouseId:String,long:String,width:String,height:String,finished:@escaping (_ json: JSON?)->()) -> () {
        let params =  [ "warehouse_id" : warehouseId,"long" : long,"width" : width,"height" : height];
    
    XZRNetWorkTool.shared.postRequest(methodName:"other_calc_dimension_weight", params: params) { (response, error) in
        finished(response)
        }
        
    }
    
    
    
    
}
