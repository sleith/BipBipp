//
//  CartView.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import UIKit

protocol CartView : class {
    var presenter : CartPresenter? { get set }

    func showCart(cartList:[CartModel])
    func showTotalPrice(price:Double)
}
