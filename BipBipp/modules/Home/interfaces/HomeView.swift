//
//  HomeView.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import Foundation
import UIKit

protocol HomeView : class {
    var presenter : HomePresenter? { get set }

    func displayCategories(categories:[CategoryModel])
    func displayItems(items:[ItemModel], categoryId:Int)
    func displayBanners(banners:[BannerModel])
}
