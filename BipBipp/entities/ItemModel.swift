//
//  ItemModel.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import ObjectMapper

class ItemModel: Mappable{
    
    var id : Int?
    var name : String?
    var description : String?
    var dimension : String?
    var price : Double?
    var imageUrl : String?
    
    required init?(map:Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map){
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        dimension <- map["dimension"]
        price <- map["price"]
        imageUrl <- map["imageUrl"]
    }
    
    func priceString()->String{
        return "$" + (price?.description ?? "")
    }
}
