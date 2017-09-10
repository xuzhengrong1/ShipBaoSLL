//
//	Warehouseslist.swift
//
//	Create by 正荣 许 on 10/9/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Warehouseslist : NSObject, NSCoding, Mappable{

	var country : String?
	var currency : String?
	var exchangeRate : String?
	var id : String?
	var name : String?
	var orderTypes : [OrderType]?


	class func newInstance(map: Map) -> Mappable?{
		return Warehouseslist()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		country <- map["country"]
		currency <- map["currency"]
		exchangeRate <- map["exchange_rate"]
		id <- map["id"]
		name <- map["name"]
		orderTypes <- map["order_types"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         country = aDecoder.decodeObject(forKey: "country") as? String
         currency = aDecoder.decodeObject(forKey: "currency") as? String
         exchangeRate = aDecoder.decodeObject(forKey: "exchange_rate") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         orderTypes = aDecoder.decodeObject(forKey: "order_types") as? [OrderType]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if country != nil{
			aCoder.encode(country, forKey: "country")
		}
		if currency != nil{
			aCoder.encode(currency, forKey: "currency")
		}
		if exchangeRate != nil{
			aCoder.encode(exchangeRate, forKey: "exchange_rate")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if orderTypes != nil{
			aCoder.encode(orderTypes, forKey: "order_types")
		}

	}

}