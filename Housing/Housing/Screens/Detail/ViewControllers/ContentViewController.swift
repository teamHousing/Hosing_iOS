//
//  ContentViewController.swift
//  Housing
//
//  Created by 노한솔 on 2021/01/04.
//

import UIKit

import SegementSlide
import Then
import SnapKit



class ContentViewController: UITableViewController, SegementSlideContentScrollViewDelegate {
	@objc var scrollView: UIScrollView {
		return tableView
	}

	func registerCell() {
		tableView.register(RequestTableViewCell.self, forCellReuseIdentifier: RequestTableViewCell.reuseIdentifier)
		tableView.register(CommunicateMethodTableViewCell.self, forCellReuseIdentifier: CommunicateMethodTableViewCell.reuseIdentifier)
		tableView.register(AddedImageTableViewCell.self, forCellReuseIdentifier: AddedImageTableViewCell.reuseIdentifier)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.isUserInteractionEnabled = true
		tableView.separatorStyle = .none
		tableView.showsVerticalScrollIndicator = false
		tableView.estimatedRowHeight = RequestTableViewCell.estimatedRowHeight() +
			CommunicateMethodTableViewCell.estimatedRowHeight() +
			AddedImageTableViewCell.estimatedRowHeight()
		tableView.rowHeight = UITableView.automaticDimension
		registerCell()
		tableView.reloadData()
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			let cell: RequestTableViewCell = tableView.dequeueCell(forIndexPath: indexPath)
			cell.awakeFromNib()
			cell.selectionStyle = .none
			return cell
		}
		else if indexPath.row == 1 {
			let cell: CommunicateMethodTableViewCell = tableView.dequeueCell(forIndexPath: indexPath)
			cell.awakeFromNib()
			cell.selectionStyle = .none
			return cell
		}
		else if indexPath.row == 2 {
			let cell: AddedImageTableViewCell = tableView.dequeueCell(forIndexPath: indexPath)
			cell.awakeFromNib()
			cell.selectionStyle = .none
			return cell
		}
		
		return UITableViewCell()

	}
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
}

