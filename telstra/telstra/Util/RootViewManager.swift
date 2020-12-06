//
//  RootViewManager.swift
//  telstra
//
//  Created by Admin on 12/7/20.
//

import Foundation
import UIKit

protocol ViewManagers {
	func rootView() -> UIViewController
}

class RootViewManager {}

extension RootViewManager: ViewManagers {
	func rootView() -> UIViewController {
		let controller = FeedsViewController()
		let navigationController = UINavigationController(rootViewController: controller)
		return navigationController
	}
}
