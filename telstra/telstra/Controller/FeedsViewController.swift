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
	
	override func loadView() {
		super.loadView()
		safeArea = view.layoutMarginsGuide
		prepareTableView()
	}
	

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: Prepare UI

extension FeedsViewController {
	func prepareTableView() {
		self.view.backgroundColor = .white
		self.tableView.separatorStyle   = .none
//		self.tableView.delegate = self
//		self.tableView.dataSource = self
		self.view.addSubview(self.tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
		tableView.leftAnchor.constraint(equalTo: safeArea.leftAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
		tableView.rightAnchor.constraint(equalTo: safeArea.rightAnchor).isActive = true
	}
}
