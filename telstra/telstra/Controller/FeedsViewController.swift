//
//  FeedsViewController.swift
//  telstra
//
//  Created by Admin on 12/7/20.
//

import UIKit

class FeedsViewController: UIViewController {
	
	let tableView = UITableView()
	var safeArea: UILayoutGuide!
	private let refreshControl = UIRefreshControl()
	
	fileprivate var service : FeedsService! = FeedsService()
	let dataSource = FeedsDataSource()
	lazy var viewModel : FeedsViewModel = {
		let viewModel = FeedsViewModel(service: service, dataSource: dataSource)
		return viewModel
	}()
	
	
	override func loadView() {
		super.loadView()
		safeArea = view.layoutMarginsGuide
		prepareTableView()
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView.dataSource = self.dataSource
		self.dataSource.data.addAndNotify(observer: self) { [weak self] in
			self?.tableView.reloadData()
		}
		self.setupUI()
		self.setupUIRefreshControl()
		self.serviceCall()
	}
	
	func setupUIRefreshControl(){
		refreshControl.addTarget(self, action: #selector(serviceCall), for: .valueChanged)
		self.tableView.addSubview(refreshControl)
		
	}
	@objc func serviceCall() {
		DispatchQueue.main.async {
			self.viewModel.fetchServiceCall { result in
				switch result {
				case .success :
					self.title = self.viewModel.title
					break
				case .failure :
					break
				}
			}
		}
		refreshControl.endRefreshing()
	}
}

extension FeedsViewController {
	func setupUI() {
		self.tableView.backgroundColor = ThemeColor.white
		self.view.backgroundColor = ThemeColor.white
		self.tableView.tableFooterView = UIView(frame: .zero)
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(serviceCall))
	}
}

// MARK: - TableViewDelegate Setup

extension FeedsViewController : UITableViewDelegate{
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
	
}

//MARK: Prepare UI

extension FeedsViewController {
	func prepareTableView() {
		self.view.backgroundColor = .white
		self.tableView.delegate = self
		self.view.addSubview(self.tableView)
		self.tableView.register(LandscapeTableViewCell.self, forCellReuseIdentifier: "LandscapeTableViewCell")
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
		tableView.leftAnchor.constraint(equalTo: safeArea.leftAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
		tableView.rightAnchor.constraint(equalTo: safeArea.rightAnchor).isActive = true
	}
}
