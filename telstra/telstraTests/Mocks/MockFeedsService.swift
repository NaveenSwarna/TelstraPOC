//
//  MockFeedsService.swift
//  telstraTests
//
//  Created by Admin on 12/7/20.
//

import Foundation
@testable import telstra

class MockFeedsService: FeedsServiceProtocol {
	var feedsData: FeedsModel?
	func fetchConverter(_ completion: @escaping ((Result<FeedsModel, ErrorResult>) -> Void)) {
		if let data = feedsData {
			completion(Result.success(data))
		} else {
			completion(Result.failure(ErrorResult.custom(string: "No converter")))
		}
	}
}
