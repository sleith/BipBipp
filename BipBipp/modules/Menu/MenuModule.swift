//
//  MenuModule.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import UIKit

class MenuModule{
    func buildDefault(with category:CategoryModel)->UIViewController{
        let view = MenuDefaultView()
        let interactor = MenuDefaultInteractor()
        let presenter = MenuDefaultPresenter(category: category)
        let router = MenuDefaultRouter()

        view.presenter = presenter

        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        interactor.presenter = presenter

        router.presenter = presenter
        router.viewController = view
        return view
    }
}
