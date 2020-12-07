//
//  FeedsServiceTests.swift
//  telstraTests
//
//  Created by Admin on 12/7/20.
//

import XCTest
@testable import telstra

class FeedsServiceTests: XCTestCase {
	
	func testCancelRequest() {
		let service : FeedsService! = FeedsService()
		service.fetchConverter{ (_) in
		}
		service.cancelFetchCurrencies()
		XCTAssertNil(service.task, "Expected task nil")
	}
}
