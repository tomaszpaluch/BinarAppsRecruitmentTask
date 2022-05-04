//
//  AppDelegate.swift
//  BinarAppRecruitmentTask
//
//  Created by Tomasz Paluch on 01/05/2022.
//  Copyright © 2022 Tomasz Paluch. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = UINavigationController(
            rootViewController: CalculatorViewController()
        )
        window?.makeKeyAndVisible()
    
        return true
    }
}

