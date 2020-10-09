//
//  HomeRouter.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import UIKit

protocol HomeRouter {
    var presenter : HomePresenter? { get set }
    var viewController : UIViewController? { get set }
    
    func getViewController() -> UIViewController
}
