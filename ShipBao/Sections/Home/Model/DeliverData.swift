//
//	deliverData.swift
//
//	Create by 正荣 许 on 6/10/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class DeliverData : NSObject, NSCoding, Mappable{

	var deliverAddressList : [DeliverAddressList]?


	class func newInstance(map: Map) -> Mappable?{
		return DeliverData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		deliverAddressList <- map["list"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         deliverAddressList = aDecoder.decodeObject(forKey: "list") as? [DeliverAddressList]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if deliverAddressList != nil{
			aCoder.encode(deliverAddressList, forKey: "list")
		}

	}

}
