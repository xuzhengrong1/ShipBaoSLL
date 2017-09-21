//
//	DataList.swift
//
//	Create by 正荣 许 on 21/9/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class DataList : NSObject, NSCoding, Mappable{

	var categoryCount : [CategoryCount]?
	var page : Int?
	var pageSize : Int?
	var recordList : [RecordList]?
	var total : Int?


	class func newInstance(map: Map) -> Mappable?{
		return DataList()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		categoryCount <- map["category_count"]
		page <- map["page"]
		pageSize <- map["page_size"]
		recordList <- map["list"]
		total <- map["total"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         categoryCount = aDecoder.decodeObject(forKey: "category_count") as? [CategoryCount]
         page = aDecoder.decodeObject(forKey: "page") as? Int
         pageSize = aDecoder.decodeObject(forKey: "page_size") as? Int
         recordList = aDecoder.decodeObject(forKey: "list") as? [RecordList]
         total = aDecoder.decodeObject(forKey: "total") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if categoryCount != nil{
			aCoder.encode(categoryCount, forKey: "category_count")
		}
		if page != nil{
			aCoder.encode(page, forKey: "page")
		}
		if pageSize != nil{
			aCoder.encode(pageSize, forKey: "page_size")
		}
		if recordList != nil{
			aCoder.encode(recordList, forKey: "list")
		}
		if total != nil{
			aCoder.encode(total, forKey: "total")
		}

	}

}
