//
//  AppDelegate.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        let navigationController = UINavigationController.init(rootViewController: HomeModule().buildDefault())
        self.window?.rootViewController = navigationController
        
        return true
    }

}

