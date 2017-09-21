//
//	Parcel.swift
//
//	Create by 正荣 许 on 21/9/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Parcel : NSObject, NSCoding, Mappable{

	var currency : String?
	var express : String?
	var fee : [AnyObject]?
	var icon : String?
	var id : String?
	var parcelInfo : [ParcelInfo]?
	var trackingNo : String?
	var weight : Int?
	var weightUnit : String?


	class func newInstance(map: Map) -> Mappable?{
		return Parcel()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		currency <- map["currency"]
		express <- map["express"]
		fee <- map["fee"]
		icon <- map["icon"]
		id <- map["id"]
		parcelInfo <- map["parcel_info"]
		trackingNo <- map["tracking_no"]
		weight <- map["weight"]
		weightUnit <- map["weight_unit"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         currency = aDecoder.decodeObject(forKey: "currency") as? String
         express = aDecoder.decodeObject(forKey: "express") as? String
         fee = aDecoder.decodeObject(forKey: "fee") as? [AnyObject]
         icon = aDecoder.decodeObject(forKey: "icon") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         parcelInfo = aDecoder.decodeObject(forKey: "parcel_info") as? [ParcelInfo]
         trackingNo = aDecoder.decodeObject(forKey: "tracking_no") as? String
         weight = aDecoder.decodeObject(forKey: "weight") as? Int
         weightUnit = aDecoder.decodeObject(forKey: "weight_unit") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if currency != nil{
			aCoder.encode(currency, forKey: "currency")
		}
		if express != nil{
			aCoder.encode(express, forKey: "express")
		}
		if fee != nil{
			aCoder.encode(fee, forKey: "fee")
		}
		if icon != nil{
			aCoder.encode(icon, forKey: "icon")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if parcelInfo != nil{
			aCoder.encode(parcelInfo, forKey: "parcel_info")
		}
		if trackingNo != nil{
			aCoder.encode(trackingNo, forKey: "tracking_no")
		}
		if weight != nil{
			aCoder.encode(weight, forKey: "weight")
		}
		if weightUnit != nil{
			aCoder.encode(weightUnit, forKey: "weight_unit")
		}

	}

}