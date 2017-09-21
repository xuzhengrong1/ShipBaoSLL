//
//	CategoryCount.swift
//
//	Create by 正荣 许 on 21/9/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class CategoryCount : NSObject, NSCoding, Mappable{

	var count : String?
	var id : Int?
	var name : String?


	class func newInstance(map: Map) -> Mappable?{
		return CategoryCount()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		count <- map["count"]
		id <- map["id"]
		name <- map["name"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         count = aDecoder.decodeObject(forKey: "count") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if count != nil{
			aCoder.encode(count, forKey: "count")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}

	}

}