//
//  FeedsModel.swift
//  telstra
//
//  Created by Admin on 12/7/20.
//

import Foundation

struct FeedsModel: Decodable {
	let title: String?
	let rows: [ListModel]?
}

extension FeedsModel: Parceable {
	static func parseObject(data: Data) -> Result<FeedsModel, ErrorResult> {
		let decoder = JSONDecoder()
		if let result = try? decoder.decode(FeedsModel.self, from: data) {
			return Result.success(result)
		} else {
			return Result.failure(ErrorResult.parser(string: "Unable to parse FeedsModel results"))
		}
	}
}
