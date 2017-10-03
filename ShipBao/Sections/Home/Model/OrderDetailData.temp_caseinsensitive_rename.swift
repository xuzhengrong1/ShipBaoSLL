//
//	orderDetailData.swift
//
//	Create by 正荣 许 on 3/10/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class OrderDetailData : NSObject, NSCoding, Mappable{

	var code : String?
	var customerAddress : String?
	var customerName : String?
	var customerPhone : String?
	var express : String?
	var id : String?
	var parcels : [Parcel]?
	var paymentMethod : String?
	var price : Int?
	var qty : String?
	var trackingMsg : String?
	var trackingNo : String?
	var trackingTime : String?
	var type : String?
	var weight : String?


	class func newInstance(map: Map) -> Mappable?{
		return orderDetailData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		code <- map["code"]
		customerAddress <- map["customer_address"]
		customerName <- map["customer_name"]
		customerPhone <- map["customer_phone"]
		express <- map["express"]
		id <- map["id"]
		parcels <- map["parcels"]
		paymentMethod <- map["payment_method"]
		price <- map["price"]
		qty <- map["qty"]
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
         code = aDecoder.decodeObject(forKey: "code") as? String
         customerAddress = aDecoder.decodeObject(forKey: "customer_address") as? String
         customerName = aDecoder.decodeObject(forKey: "customer_name") as? String
         customerPhone = aDecoder.decodeObject(forKey: "customer_phone") as? String
         express = aDecoder.decodeObject(forKey: "express") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         parcels = aDecoder.decodeObject(forKey: "parcels") as? [Parcel]
         paymentMethod = aDecoder.decodeObject(forKey: "payment_method") as? String
         price = aDecoder.decodeObject(forKey: "price") as? Int
         qty = aDecoder.decodeObject(forKey: "qty") as? String
         trackingMsg = aDecoder.decodeObject(forKey: "tracking_msg") as? String
         trackingNo = aDecoder.decodeObject(forKey: "tracking_no") as? String
         trackingTime = aDecoder.decodeObject(forKey: "tracking_time") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String
         weight = aDecoder.decodeObject(forKey: "weight") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if code != nil{
			aCoder.encode(code, forKey: "code")
		}
		if customerAddress != nil{
			aCoder.encode(customerAddress, forKey: "customer_address")
		}
		if customerName != nil{
			aCoder.encode(customerName, forKey: "customer_name")
		}
		if customerPhone != nil{
			aCoder.encode(customerPhone, forKey: "customer_phone")
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
