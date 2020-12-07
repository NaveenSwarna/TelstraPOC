//
//  LandscapeTableViewCell.swift
//  telstra
//
//  Created by Admin on 12/7/20.
//

import UIKit
import Foundation

class LandscapeTableViewCell: UITableViewCell {
	
	var thumbnailImage = UIImageView()
	var titleLabel = UILabel()
	var descriptionLabel = UILabel()
	
	var feedsValue : ListModel? {
		didSet {
			guard let feeds = feedsValue else {
				return
			}
			titleLabel.text = feeds.title
			descriptionLabel.text = feeds.description
		}
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		// Add the UI components
		addThumbnailImage()
		addTitleLabel()
		addDescriptionLabel()
		contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
	
	func addThumbnailImage() {
		thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(thumbnailImage)
		thumbnailImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
		thumbnailImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
		thumbnailImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
		thumbnailImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
		self.thumbnailImage.contentMode =  .scaleAspectFit
	}
	
	func addTitleLabel() {
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.numberOfLines = 0
		titleLabel.font = UIFont.boldSystemFont(ofSize: 13)
		
		contentView.addSubview(titleLabel)
		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: thumbnailImage.trailingAnchor, constant: 10),
			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
		])
	}
	
	func addDescriptionLabel() {
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		descriptionLabel.numberOfLines = 0
		descriptionLabel.font = UIFont.systemFont(ofSize: 13)
		contentView.addSubview(descriptionLabel)
		NSLayoutConstraint.activate([
			descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
		])
	}
}
