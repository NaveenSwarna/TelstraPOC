//
//  DynamicValue.swift
//  telstra
//
//  Created by Admin on 12/7/20.
//

import Foundation

typealias CompletionHandler = (() -> Void)
class DynamicValue<T> {
	var value: T {
		didSet {
			self.notify()
		}
	}
	
	private var observers = [String: CompletionHandler]()
	init(_ value: T) {
		self.value = value
	}
	
	public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
		observers[observer.description] = completionHandler
	}
	
	public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
		self.addObserver(observer, completionHandler: completionHandler)
		self.notify()
	}
	
	private func notify() {
		observers.forEach({ $0.value() })
	}
	
	deinit {
		observers.removeAll()
	}
}
