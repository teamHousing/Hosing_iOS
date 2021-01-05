//
//  DetailViewController.swift
//  Housing
//
//  Created by 노한솔 on 2021/01/01.
//

import UIKit

import SegementSlide
import Then
import SnapKit

class DetailViewController: SegementSlideDefaultViewController {
	
	var category : String = "고장/수리"
	var status : String = "확인 전"
	var viewTitle : String = "수도꼭지가 고장났어요ㅠ 집이 물바다"
	var context : String = "저희 집 화장실 세면대에 수도꼭지가 고장나서 물이 계속 새고 있는데 이러다 수도세가 너무 많이 나올 것 같아요ㅠ \n\n글 확인하시면 최대한 빠르게 수리 부탁드립니다..!!\n\n저희 집 화장실 세면대에 수도꼭지가 고장나서 물이 계속 새고 있는데 이러다 수도세가 너무 많이 나올 것 같아요ㅠ \n\n글 확인하시면 최대한 빠르게 수리 부탁드립니다..!!\n"
	
	let detailHeaderView = UIView().then{
		$0.isUserInteractionEnabled = true
		$0.contentMode = .scaleAspectFill
		
	}
	let categoryLabel = UILabel()
	let statusLabel = UILabel()
	let titleLabel = UILabel()
	let categoryContainerView = UIView()
	let contextLabel = UILabel()
	
	var heightWithSafeArea: CGFloat {
		return 243+self.contextLabel.frame.size.height
	}
	
	
	
	func headerViewLayout() {
		self.detailHeaderView.add(self.categoryContainerView) {
			$0.backgroundColor = .primaryBlack
			$0.layer.cornerRadius = 13
		}
		self.detailHeaderView.add(categoryLabel) {
			$0.text = self.category
			$0.backgroundColor = UIColor.primaryBlack
			$0.textColor = UIColor.primaryWhite
			$0.textAlignment = .center
			$0.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
			$0.snp.makeConstraints{
				$0.top.equalTo(self.detailHeaderView).offset(16)
				$0.leading.equalTo(self.detailHeaderView).offset(20)
			}
		}
		self.categoryContainerView.snp.makeConstraints{
			$0.top.equalTo(self.categoryLabel.snp.top).offset(-6)
			$0.bottom.equalTo(self.categoryLabel.snp.bottom).offset(6)
			$0.leading.equalTo(self.categoryLabel.snp.leading).offset(-10)
			$0.trailing.equalTo(self.categoryLabel.snp.trailing).offset(10)
		}
		self.detailHeaderView.add(self.statusLabel) {
			$0.text = self.status
			$0.textColor = .primaryOrange
			$0.textAlignment = .left
			$0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
			$0.snp.makeConstraints{
				$0.centerY.equalTo(self.categoryLabel.snp.centerY)
				$0.trailing.equalTo(self.detailHeaderView.snp.trailing).offset(-20)
				$0.height.equalTo(17)
			}
		}
		self.detailHeaderView.add(self.titleLabel) {
			$0.text = self.viewTitle
			$0.textAlignment = .left
			$0.font = UIFont.systemFont(ofSize: 21, weight: .bold)
			$0.snp.makeConstraints{
				$0.top.equalTo(self.categoryLabel.snp.bottom).offset(20)
				$0.leading.equalTo(self.detailHeaderView.snp.leading).offset(20)
				$0.trailing.equalTo(self.detailHeaderView.snp.trailing).offset(-20)
				$0.height.equalTo(25)
			}
		}
		self.detailHeaderView.add(self.contextLabel) {
			$0.text = self.context
			$0.textAlignment = .left
			$0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
			$0.numberOfLines = 0
			$0.snp.makeConstraints{
				$0.leading.equalTo(self.detailHeaderView.snp.leading).offset(20)
				$0.trailing.equalTo(self.detailHeaderView.snp.trailing).offset(-20)
				$0.top.equalTo(self.titleLabel.snp.bottom).offset(40)
			}
		}
	}
	
	override func segementSlideHeaderView() -> UIView? {
		self.headerViewLayout()
		self.detailHeaderView.snp.makeConstraints{
			$0.height.equalTo(243+self.contextLabel.frame.size.height)
		}
		return self.detailHeaderView
	}
	
	override var titlesInSwitcher: [String] {
		return ["상세 정보","하우징 쪽지"]
	}
	
	override var switcherConfig: SegementSlideDefaultSwitcherConfig {
		var config = super.switcherConfig
		config.type = .tab
		config.indicatorColor = .primaryOrange
		config.indicatorWidth = (self.view.frame.width/2)-40
		config.indicatorHeight = 2
		return config
	}
	
	let viewController = ContentViewController()
	
	override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
		return viewController
	}

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		if (scrollView.contentOffset.y == (scrollView.contentSize.height
																				- scrollView.bounds.size.height)) {
			viewController.detailView.isScrollEnabled = false
		}
	}
	
	
	
	// MARK : - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		defaultSelectedIndex = 0
		reloadData()
	}
}


