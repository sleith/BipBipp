//
//  MenuDefaultPresenter.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation

class MenuDefaultPresenter : MenuPresenter{
    var router: MenuRouter?
    
    var interactor: MenuInteractor?
    
    var view: MenuView?
    
    let category:CategoryModel
    
    init(category:CategoryModel) {
        self.category = category
    }
}
