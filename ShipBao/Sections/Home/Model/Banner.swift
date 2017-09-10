//
//	Banner.swift
//
//	Create by 正荣 许 on 9/9/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Banner : NSObject, NSCoding, Mappable{

	var file : String?
	var height : String?
	var url : String?
	var width : String?


	class func newInstance(map: Map) -> Mappable?{
		return Banner()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		file <- map["file"]
		height <- map["height"]
		url <- map["url"]
		width <- map["width"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         file = aDecoder.decodeObject(forKey: "file") as? String
         height = aDecoder.decodeObject(forKey: "height") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String
         width = aDecoder.decodeObject(forKey: "width") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if file != nil{
			aCoder.encode(file, forKey: "file")
		}
		if height != nil{
			aCoder.encode(height, forKey: "height")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}
		if width != nil{
			aCoder.encode(width, forKey: "width")
		}

	}

}