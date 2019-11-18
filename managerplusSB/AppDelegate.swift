//
//  AppDelegate.swift
//  managerplusSB
//
//  Created by Dylan DeCoursey on 11/9/19.
//  Copyright © 2019 UNCC Team 9. All rights reserved.
//

import UIKit
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
