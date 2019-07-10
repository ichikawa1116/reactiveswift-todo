//
//  AppDelegate.swift
//  reactiveswift-todo
//
//  Created by Manami Ichikawa on 2019/07/06.
//  Copyright © 2019 Manami Ichikawa. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // TODO: DI
        let toDoListVC = ToDoListViewController(viewModel: ToDoViewModel())
        let navigationController = UINavigationController(rootViewController: toDoListVC)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }
}

