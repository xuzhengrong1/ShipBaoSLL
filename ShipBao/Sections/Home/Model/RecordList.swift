//
//	RecordList.swift
//
//	Create by 正荣 许 on 21/9/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class RecordList : NSObject, NSCoding, Mappable{

	var autoShipout : String?
	var canCancel : Int?
	var cdate : String?
	var code : String?
	var express : String?
	var id : String?
	var parcels : [Parcel]?
	var paymentMethod : String?
	var price : Double?
	var qty : String?
	var scene : Int?
	var trackingMsg : String?
	var trackingNo : String?
	var trackingTime : String?
	var type : String?
	var weight : Int?


	class func newInstance(map: Map) -> Mappable?{
		return RecordList()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
        
//        let transform = TransformOf<Double, String>(fromJSON: { (value: String?) -> Double? in
//            // transform value from String? to Int?
//            return Double(value!)
//        }, toJSON: { (value: Double?) -> String? in
//            // transform value from Int? to String?
//            if let value = value {
//                return String(value)
//            }
//            return nil
//        })
        
		autoShipout <- map["auto_shipout"]
		canCancel <- map["can_cancel"]
		cdate <- map["cdate"]
		code <- map["code"]
		express <- map["express"]
		id <- map["id"]
		parcels <- map["parcels"]
		paymentMethod <- map["payment_method"]
		price <- map["price"]
		qty <- map["qty"]
		scene <- map["scene"]
		trackingMsg <- map["tracking_msg"]
		trackingNo <- map["tracking_no"]
		trackingTime <- map["tracking_time"]
		type <- map["type"]
		weight <- map["weight"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         autoShipout = aDecoder.decodeObject(forKey: "auto_shipout") as? String
         canCancel = aDecoder.decodeObject(forKey: "can_cancel") as? Int
         cdate = aDecoder.decodeObject(forKey: "cdate") as? String
         code = aDecoder.decodeObject(forKey: "code") as? String
         express = aDecoder.decodeObject(forKey: "express") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         parcels = aDecoder.decodeObject(forKey: "parcels") as? [Parcel]
         paymentMethod = aDecoder.decodeObject(forKey: "payment_method") as? String
         price = aDecoder.decodeObject(forKey: "price") as? Double
         qty = aDecoder.decodeObject(forKey: "qty") as? String
         scene = aDecoder.decodeObject(forKey: "scene") as? Int
         trackingMsg = aDecoder.decodeObject(forKey: "tracking_msg") as? String
         trackingNo = aDecoder.decodeObject(forKey: "tracking_no") as? String
         trackingTime = aDecoder.decodeObject(forKey: "tracking_time") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String
         weight = aDecoder.decodeObject(forKey: "weight") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if autoShipout != nil{
			aCoder.encode(autoShipout, forKey: "auto_shipout")
		}
		if canCancel != nil{
			aCoder.encode(canCancel, forKey: "can_cancel")
		}
		if cdate != nil{
			aCoder.encode(cdate, forKey: "cdate")
		}
		if code != nil{
			aCoder.encode(code, forKey: "code")
		}
		if express != nil{
			aCoder.encode(express, forKey: "express")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if parcels != nil{
			aCoder.encode(parcels, forKey: "parcels")
		}
		if paymentMethod != nil{
			aCoder.encode(paymentMethod, forKey: "payment_method")
		}
		if price != nil{
			aCoder.encode(price, forKey: "price")
		}
		if qty != nil{
			aCoder.encode(qty, forKey: "qty")
		}
		if scene != nil{
			aCoder.encode(scene, forKey: "scene")
		}
		if trackingMsg != nil{
			aCoder.encode(trackingMsg, forKey: "tracking_msg")
		}
		if trackingNo != nil{
			aCoder.encode(trackingNo, forKey: "tracking_no")
		}
		if trackingTime != nil{
			aCoder.encode(trackingTime, forKey: "tracking_time")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if weight != nil{
			aCoder.encode(weight, forKey: "weight")
		}

	}

}
