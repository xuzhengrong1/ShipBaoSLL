//
//	OrderType.swift
//
//	Create by 正荣 许 on 10/9/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class OrderType : NSObject, NSCoding, Mappable{

	var list : [List]?
	var name : String?


	class func newInstance(map: Map) -> Mappable?{
		return OrderType()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		list <- map["list"]
		name <- map["name"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         list = aDecoder.decodeObject(forKey: "list") as? [List]
         name = aDecoder.decodeObject(forKey: "name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if list != nil{
			aCoder.encode(list, forKey: "list")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}

	}

}