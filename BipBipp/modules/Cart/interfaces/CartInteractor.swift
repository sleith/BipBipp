//
//  CartInteractor.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation

protocol CartInteractor{
    var presenter : CartPresenter? { get set }
    
    func load()->[CartModel]
    func removeCart(cart:CartModel)->[CartModel]
    func getTotalPrice()->Double
}
