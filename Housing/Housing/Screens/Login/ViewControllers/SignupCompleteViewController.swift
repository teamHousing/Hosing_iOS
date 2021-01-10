//
//  SignupCompleteViewController.swift
//  Housing
//
//  Created by 곽기곤's Mac on 2021/01/07.
//

import UIKit

class SignupCompleteViewController: UIViewController {
	//MARK:- Component(Outlet)
	@IBOutlet weak var completeView: UIButton!
	
	//MARK:- Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		initLayout()
	}
	
	//MARK:- Helper
	func initLayout() {
		completeView.backgroundColor = UIColor.primaryBlack
		completeView.layer.cornerRadius = 0.5 * completeView.bounds.size.height
	}
	
	//MARK:- Component(Action)
	@IBAction func toAddressViewButton(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
	@IBAction func completeButton(_ sender: Any) {
		let viewcontroller = TabBarViewController()
		viewcontroller.modalPresentationStyle = .fullScreen
		present(viewcontroller, animated: true)
	}
}
