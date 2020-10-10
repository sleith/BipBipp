//
//  CartStorage.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import ObjectMapper

class CartStorage{
    
    static let instance: CartStorage = CartStorage()
    let preferences = UserDefaults.standard
    let KEY_NAME = "cartList"

    var cartList : [CartModel] = []
    
    init() {
        if let raw = preferences.string(forKey: KEY_NAME){
            if(raw.count > 0){
                cartList = Mapper<CartModel>().mapArray(JSONString: raw) ?? []
            }
        }
    }
    
    func addItem(item:ItemModel){
        synchronized(self) {
            //get existing item if exist
            var cartModel : CartModel? = nil
            for curr in cartList{
                if(curr.item?.id == item.id){
                    cartModel = curr
                    break
                }
            }
            
            //create new when not existed yet
            if(cartModel == nil){
                let newCart = CartModel(item: item)
                cartModel = newCart
                cartList.append(newCart)
            }
            
            //increment qty
            cartModel?.incrementQty()
            
            save()
        }
    }
    
    func deleteCart(cart:CartModel){
        synchronized(self) {
            var index = 0
            for curr in cartList{
                if(curr === cart){
                    cartList.remove(at: index)
                    break
                }
                index += 1
            }
            
            save()
        }
    }
    
    private func save(){
        preferences.set(cartList.toJSONString(), forKey: KEY_NAME)
        preferences.synchronize()
    }
    
    /**
    Makes sure no other thread reenters the closure before the one running has not returned
    */
    @discardableResult
    public func synchronized<T>(_ lock: AnyObject, closure:() -> T) -> T {
        objc_sync_enter(lock)
        defer { objc_sync_exit(lock) }

        return closure()
    }
}
