//
//  MockData.swift
//  telstraTests
//
//  Created by Admin on 12/7/20.
//

import XCTest
@testable import telstra

class MockData {
	func getFactsData() -> Data {
		guard let data = self.readJson(forResource: "facts") else {
			XCTAssert(false, "Can't get data from facts.json")
			return Data()
		}
		return data
	}
	
	func getFeeds() -> FeedsModel {
		var responseResults: FeedsModel!
		guard let data = self.readJson(forResource: "facts") else {
			XCTAssert(false, "Can't get data from facts.json")
			return FeedsModel(title: "test Title", rows: nil)
		}
		let completion: ((Result<FeedsModel, ErrorResult>) -> Void) = { result in
			switch result {
			case .failure:
				XCTAssert(false, "Expected valid converter")
			case let .success(result):
				responseResults = result
			}
		}
		ParserHelper.parse(data: data, completion: completion)
		return responseResults
	}
	
	func getFeedslist() -> [ListModel] {
		guard let list = getFeeds().rows else {
			return [ListModel(title: "title", description: "description", imageHref: "imageHref")]
		}
		return list
	}
}

extension MockData {
	func readJson(forResource fileName: String) -> Data? {
		let bundle = Bundle(for: type(of: self))
		guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
			XCTFail("Missing file: \(fileName).json")
			return nil
		}
		
		do {
			let data = try Data(contentsOf: url)
			return data
		} catch {
			XCTFail("unable to read json")
			return nil
		}
	}
}
