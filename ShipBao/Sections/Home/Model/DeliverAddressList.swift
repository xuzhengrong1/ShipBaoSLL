//
//	DeliverAddressList.swift
//
//	Create by 正荣 许 on 6/10/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class DeliverAddressList : NSObject, NSCoding, Mappable{

	var city : String?
	var customerAddress : String?
	var customerName : String?
	var customerPhone : String?
	var customerPhoneAreaCode : String?
	var customerZipcode : String?
	var defaultField : String?
	var district : String?
	var id : String?
	var orderType : String?
	var orderTypeId : String?
	var province : String?


	class func newInstance(map: Map) -> Mappable?{
		return DeliverAddressList()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		city <- map["city"]
		customerAddress <- map["customer_address"]
		customerName <- map["customer_name"]
		customerPhone <- map["customer_phone"]
		customerPhoneAreaCode <- map["customer_phone_area_code"]
		customerZipcode <- map["customer_zipcode"]
		defaultField <- map["default"]
		district <- map["district"]
		id <- map["id"]
		orderType <- map["order_type"]
		orderTypeId <- map["order_type_id"]
		province <- map["province"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         city = aDecoder.decodeObject(forKey: "city") as? String
         customerAddress = aDecoder.decodeObject(forKey: "customer_address") as? String
         customerName = aDecoder.decodeObject(forKey: "customer_name") as? String
         customerPhone = aDecoder.decodeObject(forKey: "customer_phone") as? String
         customerPhoneAreaCode = aDecoder.decodeObject(forKey: "customer_phone_area_code") as? String
         customerZipcode = aDecoder.decodeObject(forKey: "customer_zipcode") as? String
         defaultField = aDecoder.decodeObject(forKey: "default") as? String
         district = aDecoder.decodeObject(forKey: "district") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         orderType = aDecoder.decodeObject(forKey: "order_type") as? String
         orderTypeId = aDecoder.decodeObject(forKey: "order_type_id") as? String
         province = aDecoder.decodeObject(forKey: "province") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if city != nil{
			aCoder.encode(city, forKey: "city")
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
		if customerPhoneAreaCode != nil{
			aCoder.encode(customerPhoneAreaCode, forKey: "customer_phone_area_code")
		}
		if customerZipcode != nil{
			aCoder.encode(customerZipcode, forKey: "customer_zipcode")
		}
		if defaultField != nil{
			aCoder.encode(defaultField, forKey: "default")
		}
		if district != nil{
			aCoder.encode(district, forKey: "district")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if orderType != nil{
			aCoder.encode(orderType, forKey: "order_type")
		}
		if orderTypeId != nil{
			aCoder.encode(orderTypeId, forKey: "order_type_id")
		}
		if province != nil{
			aCoder.encode(province, forKey: "province")
		}

	}

}