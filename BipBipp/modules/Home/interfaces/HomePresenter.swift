//
//  HomePresenter.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation

protocol HomePresenter : class{
    var router : HomeRouter? { get set}
    var interactor : HomeInteractor? { get set}
    var view : HomeView? { get set }
    
    func fetchCategories()
    func fetchItems(categoryId:Int)

}
