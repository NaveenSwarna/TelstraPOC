//
//  AppDelegate.swift
//  telstra
//
//  Created by Admin on 12/5/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	var rootViewManager: RootViewManager!


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		rootViewManager = RootViewManager()
		let controller = rootViewManager.rootView()
		self.window?.rootViewController = controller
		self.window?.makeKeyAndVisible()
		return true
	}

}

