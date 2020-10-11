//
//  HomeDefaultInteractor.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import Moya
import RxSwift
import ObjectMapper

class HomeDefaultInteractor : HomeInteractor{
    var presenter: HomePresenter?
    
    fileprivate let providerCategory = MoyaProvider<CategoryService>(stubClosure: MoyaProvider.immediatelyStub, plugins: [NetworkLoggerPlugin()])
    
    fileprivate let providerItem = MoyaProvider<ItemService>(stubClosure: MoyaProvider.immediatelyStub, plugins: [NetworkLoggerPlugin()])
    
    func fetchCategories() -> Observable<[CategoryModel]> {
        return Observable.create { observer->Disposable in
            self.providerCategory.rx.request(.getCategories(())).subscribe { event in
                switch event {
                case let .success(response):
                    let categoryList = Mapper<CategoryModel>().mapArray(JSONString: response.data.toString) ?? []
                    
                    observer.onNext(categoryList)
                    
                case let .error(error):
                    //in this sample, it will always success
                    print(error)
                }
                observer.onCompleted()
            }
        }
    }
    
    func fetchItems(categoryId: Int) -> Observable<[ItemModel]> {
        return Observable.create { observer->Disposable in
            self.providerItem.rx.request(.getItemsByCategoryId(categoryId: categoryId)).subscribe { event in
                switch event {
                case let .success(response):
                    let itemList = Mapper<ItemModel>().mapArray(JSONString: response.data.toString) ?? []
                    
                    observer.onNext(itemList)
                    
                case let .error(error):
                    //in this sample, it will always success
                    print(error)
                }
                observer.onCompleted()
            }
        }
    }
    
    func addItem(item: ItemModel) {
        CartStorage.instance.addItem(item: item)
    }
}
