//
//  Result.swift
//  telstra
//
//  Created by Admin on 12/7/20.
//

import Foundation

enum Result<T, E: Error> {
	case success(T)
	case failure(E)
}
