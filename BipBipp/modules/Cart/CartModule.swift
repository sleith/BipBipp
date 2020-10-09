//
//  CartModule.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import UIKit

class CartModule{
    func buildDefault()->UIViewController{
        let view = CartDefaultView()
        let interactor = CartDefaultInteractor()
        let presenter = CartDefaultPresenter()
        let router = CartDefaultRouter()

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
