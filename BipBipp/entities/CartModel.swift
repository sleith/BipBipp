//
//  CartModel.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import ObjectMapper

class CartModel: Mappable{
    
    var item : ItemModel?
    var qty : Int?
    
    init(item:ItemModel) {
        self.item = item
        self.qty = 0
    }
    
    required init?(map:Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map){
        item <- map["item"]
        qty <- map["qty"]
    }
    
    func incrementQty(){
        self.qty = (self.qty ?? 0) + 1
    }
    
    func totalPrice()->Double{
        return Double((qty ?? 0)) * (item?.price ?? 0)
    }
}
