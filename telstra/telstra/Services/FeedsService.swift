//
//  FeedsService.swift
//  telstra
//
//  Created by Admin on 12/7/20.
//

import Foundation

protocol FeedsServiceProtocol : class {
	func fetchConverter(_ completion: @escaping ((Result<FeedsModel, ErrorResult>) -> Void))
}

final class FeedsService : RequestHandler, FeedsServiceProtocol {
	let endpoint = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
	var task : URLSessionTask?
	func fetchConverter(_ completion: @escaping ((Result<FeedsModel, ErrorResult>) -> Void)) {
		self.cancelFetchCurrencies()
		task = RequestService().loadData(urlString: endpoint, completion: self.networkResult(completion: completion))
	}
	
	func cancelFetchCurrencies() {
		if let task = task {
			task.cancel()
		}
		task = nil
	}
}

