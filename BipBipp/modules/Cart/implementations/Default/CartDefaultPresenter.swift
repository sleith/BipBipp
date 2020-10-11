//
//  CartDefaultPresenter.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation

class CartDefaultPresenter : CartPresenter{
    var router: CartRouter?
    
    var interactor: CartInteractor?
    
    var view: CartView?
    
}
//to Interactor
extension CartDefaultPresenter{
    func loadData() {
        let cartList = interactor?.load() ?? []
        view?.showCart(cartList: cartList)
        view?.showTotalPrice(price: interactor?.getTotalPrice() ?? 0)
    }
    
    func removeCart(cart: CartModel) {
        let cartList = interactor?.removeCart(cart: cart) ?? []
        view?.showCart(cartList: cartList)
        view?.showTotalPrice(price: interactor?.getTotalPrice() ?? 0)
    }
}
