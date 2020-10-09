//
//  CartPresenter.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation

protocol CartPresenter : class{
    var router : CartRouter? { get set}
    var interactor : CartInteractor? { get set}
    var view : CartView? { get set }
}
