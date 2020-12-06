//
//  ErrorResult.swift
//  telstra
//
//  Created by Admin on 12/7/20.
//

import Foundation

enum ErrorResult: Error {
	case network(string: String)
	case parser(string: String)
	case custom(string: String)
}
