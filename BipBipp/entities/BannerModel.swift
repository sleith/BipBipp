//
//  BannerModel.swift
//  BipBipp
//
//  Created by Raymond on 11/10/20.
//

import Foundation
import ObjectMapper

class BannerModel: Mappable{
    
    var id : Int?
    var title : String?
    var description : String?
    var imageUrl : String?
    
    required init?(map:Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map){
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
        imageUrl <- map["imageUrl"]
    }
}
