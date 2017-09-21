//
//	RecordDataList.swift
//
//	Create by 正荣 许 on 21/9/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class RecordDataList : NSObject, NSCoding, Mappable{

	var dataList : DataList?
	var msg : String?
	var status : Int?
	var token : String?


	class func newInstance(map: Map) -> Mappable?{
		return RecordDataList()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		dataList <- map["data"]
		msg <- map["msg"]
		status <- map["status"]
		token <- map["token"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         dataList = aDecoder.decodeObject(forKey: "data") as? DataList
         msg = aDecoder.decodeObject(forKey: "msg") as? String
         status = aDecoder.decodeObject(forKey: "status") as? Int
         token = aDecoder.decodeObject(forKey: "token") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if dataList != nil{
			aCoder.encode(dataList, forKey: "data")
		}
		if msg != nil{
			aCoder.encode(msg, forKey: "msg")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if token != nil{
			aCoder.encode(token, forKey: "token")
		}

	}

}
