//
//  AppDelegate.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 29/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?

   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
      let articlesViewController = ArticlesModuleBuilder.assembleModule()
      let navigationController = UINavigationController(rootViewController: articlesViewController)
      window = UIWindow(frame: UIScreen.main.bounds)
      window?.rootViewController = navigationController
      window?.makeKeyAndVisible()
      
      return true
   }
}

