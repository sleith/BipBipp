//
//  HomeDefaultRouter.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import UIKit

class HomeDefaultRouter : HomeRouter{
    
    var presenter: HomePresenter?
    var viewController: UIViewController?
    
    func showCartView() {
        viewController?.navigationController?.pushViewController(CartModule().buildDefault(), animated: true)
    }
}
