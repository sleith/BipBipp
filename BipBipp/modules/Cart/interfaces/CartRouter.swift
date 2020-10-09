//
//  CartRouter.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import UIKit

protocol CartRouter {
    var presenter : CartPresenter? { get set }
    var viewController : UIViewController? { get set }
}
