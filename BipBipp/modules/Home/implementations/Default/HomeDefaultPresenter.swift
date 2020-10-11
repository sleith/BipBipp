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

}
//Interaction with Interactor
extension HomeDefaultPresenter{

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
    
    func addItem(item: ItemModel) {
        interactor?.addItem(item: item)
    }
}
//Interaction with Router
extension HomeDefaultPresenter{
    func routeToCartScreen() {
        router?.showCartView()
    }
}
