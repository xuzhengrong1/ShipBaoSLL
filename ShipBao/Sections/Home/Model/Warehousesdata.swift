//
//	Warehousesdata.swift
//
//	Create by 正荣 许 on 10/9/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Warehousesdata : NSObject, NSCoding, Mappable{

	var total : Int?
	var warehouseslists : [Warehouseslist]?


	class func newInstance(map: Map) -> Mappable?{
		return Warehousesdata()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		total <- map["total"]
		warehouseslists <- map["list"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         total = aDecoder.decodeObject(forKey: "total") as? Int
         warehouseslists = aDecoder.decodeObject(forKey: "list") as? [Warehouseslist]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if total != nil{
			aCoder.encode(total, forKey: "total")
		}
		if warehouseslists != nil{
			aCoder.encode(warehouseslists, forKey: "list")
		}

	}

}
