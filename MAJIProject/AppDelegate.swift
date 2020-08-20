//
//  AppDelegate.swift
//  MAJIProject
//
//  Created by Mac on 2020/8/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FMDBManager.manager.openDB(DBName: DBName)
        return true
    }
}

