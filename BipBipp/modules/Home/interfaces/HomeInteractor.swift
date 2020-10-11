//
//  HomeInteractor.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import RxSwift
import Moya

protocol HomeInteractor{
    var presenter : HomePresenter? { get set }
    
    func fetchCategories()->Observable<[CategoryModel]>
    func fetchItems(categoryId:Int)->Observable<[ItemModel]>
    func addItem(item:ItemModel)
}
