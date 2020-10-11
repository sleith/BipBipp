//
//  CartDefaultInteractor.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation

class CartDefaultInteractor : CartInteractor{
    var presenter: CartPresenter?
    
    func removeCart(cart: CartModel)->[CartModel] {
        CartStorage.instance.deleteCart(cart: cart)
        return load()
    }
    
    func load() -> [CartModel] {
        return CartStorage.instance.cartList
    }
    
    func getTotalPrice() -> Double {
        return CartStorage.instance.totalPrice()
    }
}
