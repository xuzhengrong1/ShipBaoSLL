//
//	ParcelInfo.swift
//
//	Create by 正荣 许 on 21/9/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class ParcelInfo : NSObject, NSCoding, Mappable{

	var name : String?
	var price : String?
	var qty : String?
	var unit : String?


	class func newInstance(map: Map) -> Mappable?{
		return ParcelInfo()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		name <- map["name"]
		price <- map["price"]
		qty <- map["qty"]
		unit <- map["unit"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         name = aDecoder.decodeObject(forKey: "name") as? String
         price = aDecoder.decodeObject(forKey: "price") as? String
         qty = aDecoder.decodeObject(forKey: "qty") as? String
         unit = aDecoder.decodeObject(forKey: "unit") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if price != nil{
			aCoder.encode(price, forKey: "price")
		}
		if qty != nil{
			aCoder.encode(qty, forKey: "qty")
		}
		if unit != nil{
			aCoder.encode(unit, forKey: "unit")
		}

	}

}