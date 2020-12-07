//
//  FeedsDataSource.swift
//  telstra
//
//  Created by Admin on 12/7/20.
//

import Foundation
import UIKit
import SDWebImage

class GenericDataSource<T> : NSObject {
	var data: DynamicValue<[T]> = DynamicValue([])
	fileprivate let landscapeReuseIdentifier = "LandscapeTableViewCell"
}

class FeedsDataSource : GenericDataSource<ListModel>, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.value.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: landscapeReuseIdentifier, for: indexPath) as! LandscapeTableViewCell
		let feedsValue = self.data.value[indexPath.row]
		cell.feedsValue = feedsValue
		cell.selectionStyle = .none
		if let imageRef = feedsValue.imageHref {
			cell.thumbnailImage.sd_setImage(with: URL(string: imageRef), placeholderImage: UIImage(named: "placeholder"))
		}else{
			cell.thumbnailImage.image = UIImage(named: "placeholder")
		}
		return cell
	}
}
