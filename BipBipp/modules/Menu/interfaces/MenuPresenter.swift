//
//  MenuPresenter.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation

protocol MenuPresenter : class{
    var router : MenuRouter? { get set}
    var interactor : MenuInteractor? { get set}
    var view : MenuView? { get set }
}
