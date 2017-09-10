//
//	HomeDataList.swift
//
//	Create by 正荣 许 on 9/9/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomeDataList : NSObject, NSCoding, Mappable{

	var banners : [Banner]?
	var orderIntegralLimit : String?
	var safetyBase : Float?
	var tips : [Tip]?


	class func newInstance(map: Map) -> Mappable?{
		return HomeDataList()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		banners <- map["banners"]
		orderIntegralLimit <- map["order_integral_limit"]
		safetyBase <- map["safety_base"]
		tips <- map["tips"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         banners = aDecoder.decodeObject(forKey: "banners") as? [Banner]
         orderIntegralLimit = aDecoder.decodeObject(forKey: "order_integral_limit") as? String
         safetyBase = aDecoder.decodeObject(forKey: "safety_base") as? Float
         tips = aDecoder.decodeObject(forKey: "tips") as? [Tip]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if banners != nil{
			aCoder.encode(banners, forKey: "banners")
		}
		if orderIntegralLimit != nil{
			aCoder.encode(orderIntegralLimit, forKey: "order_integral_limit")
		}
		if safetyBase != nil{
			aCoder.encode(safetyBase, forKey: "safety_base")
		}
		if tips != nil{
			aCoder.encode(tips, forKey: "tips")
		}

	}

}