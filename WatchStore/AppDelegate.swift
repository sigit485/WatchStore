//
//  AppDelegate.swift
//  WatchStore
//
//  Created by Sigit on 28/07/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController(rootViewController: ViewController())
        window.rootViewController = nav // Your initial view controller.
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }


}

