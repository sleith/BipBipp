//
//  MenuRouter.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import UIKit

protocol MenuRouter {
    var presenter : MenuPresenter? { get set }
    var viewController : UIViewController? { get set }
    
    func getViewWithCategory(category:CategoryModel) -> UIViewController
}
