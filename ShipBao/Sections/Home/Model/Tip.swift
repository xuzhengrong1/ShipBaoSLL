//
//	Tip.swift
//
//	Create by 正荣 许 on 9/9/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Tip : NSObject, NSCoding, Mappable{

	var content : String?
	var time : String?
	var timestamp : String?


	class func newInstance(map: Map) -> Mappable?{
		return Tip()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		content <- map["content"]
		time <- map["time"]
		timestamp <- map["timestamp"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         content = aDecoder.decodeObject(forKey: "content") as? String
         time = aDecoder.decodeObject(forKey: "time") as? String
         timestamp = aDecoder.decodeObject(forKey: "timestamp") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if content != nil{
			aCoder.encode(content, forKey: "content")
		}
		if time != nil{
			aCoder.encode(time, forKey: "time")
		}
		if timestamp != nil{
			aCoder.encode(timestamp, forKey: "timestamp")
		}

	}

}