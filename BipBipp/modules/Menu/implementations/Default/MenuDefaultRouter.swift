//
//  MenuDefaultRouter.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import UIKit

class MenuDefaultRouter : MenuRouter{
    var presenter: MenuPresenter?
    
    var viewController: UIViewController?
    
    func getViewWithCategory(category: CategoryModel) -> UIViewController {
        return MenuModule().buildDefault(with: category)
    }
    
    
}
