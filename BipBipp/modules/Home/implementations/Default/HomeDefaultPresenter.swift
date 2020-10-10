//
//  HomeDefaultPresenter.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import RxSwift

class HomeDefaultPresenter : HomePresenter{
    
    var router: HomeRouter?
    
    var interactor: HomeInteractor?
    
    var view: HomeView?
    
    private let diseposeBag = DisposeBag()

    func fetchCategories() {
        interactor?.fetchCategories()
            .subscribeOn(SerialDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (result: [CategoryModel]) in
                    self.view?.displayCategories(categories: result)
                    
                }, onError: { (Error) in
                    
                }, onCompleted: {

                }, onDisposed: {
                    
                }
            ).disposed(by: diseposeBag)
    }
    
    func fetchItems(categoryId: Int) {
        interactor?.fetchItems(categoryId: categoryId)
            .subscribeOn(SerialDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (result: [
                           ItemModel]) in
                    self.view?.displayItems(items: result, categoryId: categoryId)
                    
                }, onError: { (Error) in
                    
                }, onCompleted: {

                }, onDisposed: {
                    
                }
            ).disposed(by: diseposeBag)
    }
    
}
