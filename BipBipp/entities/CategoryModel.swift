//
//  CategoryModel.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import ObjectMapper

class CategoryModel: Mappable{
    
    var id : Int?
    var title : String?
    
    required init?(map:Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map){
        id <- map["id"]
        title <- map["title"]
    }
}
