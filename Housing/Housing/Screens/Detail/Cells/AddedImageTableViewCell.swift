//
//  AddedImageTableViewCell.swift
//  Housing
//
//  Created by 노한솔 on 2021/01/05.
//

import UIKit

import Kingfisher
import SnapKit
import Then

class AddedImageTableViewCell: UITableViewCell {
	
	let imageURL = ["https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FImage&psig=AOvVaw2rzOfnBix5dppfSHfK7HD0&ust=1610001119996000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDR-9jXhu4CFQAAAAAdAAAAABAD","https://www.google.com/url?sa=i&url=https%3A%2F%2Fdeveloper.mozilla.org%2Fko%2Fdocs%2FWeb%2FHTML%2FElement%2Fimg&psig=AOvVaw2rzOfnBix5dppfSHfK7HD0&ust=1610001119996000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDR-9jXhu4CFQAAAAAdAAAAABAI","https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Fpremium-photo%2Fimage-human-brain_5013322.htm&psig=AOvVaw2rzOfnBix5dppfSHfK7HD0&ust=1610001119996000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDR-9jXhu4CFQAAAAAdAAAAABAO"]
	
	
//	let addedImageCollectionView =
//		UICollectionView(frame: CGRect(x: 0, y: 0, width: 500, height: 127),
//										 collectionViewLayout: UICollectionViewLayout.init()).then() {
//		$0.backgroundColor = .primaryWhite
//		$0.isPagingEnabled = true
//	}
	
	let addedImageCollectionView: UICollectionView = {
		
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.minimumInteritemSpacing = 6
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.isScrollEnabled = true
		collectionView.isPagingEnabled = true
		collectionView.isUserInteractionEnabled = true
		
		return collectionView
	}()
	
	let titleLabel = UILabel().then() {
		$0.text = "첨부파일"
		$0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
		$0.textColor = .primaryBlack
		$0.textAlignment = .left
	}
	
	static func estimatedRowHeight() -> CGFloat {
		return 190
	}
	
	func layout() {
		self.contentView.add(self.titleLabel) {
			$0.snp.makeConstraints {
				$0.top.equalTo(self.contentView.snp.top).offset(56)
				$0.leading.equalTo(self.contentView.snp.leading).offset(20)
			}
		}
		self.contentView.add(self.addedImageCollectionView) {
			$0.snp.makeConstraints {
				$0.top.equalTo(self.titleLabel.snp.bottom).offset(16)
				$0.leading.equalTo(self.titleLabel.snp.leading)
				$0.bottom.equalTo(self.contentView.snp.bottom).offset(-100)
				$0.height.equalTo(127)
				$0.width.equalTo(self.imageURL.count*135)
			}
		}
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		self.addedImageCollectionView.collectionViewLayout = layout
	}
	
	func registerCell() {
		addedImageCollectionView.register(AddedImageCollectionViewCell.self,
																			forCellWithReuseIdentifier:
																				AddedImageCollectionViewCell.reuseIdentifier)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		print(#file, #function)
		layout()
		registerCell()
		self.addedImageCollectionView.delegate = self
		self.addedImageCollectionView.dataSource = self
		self.addedImageCollectionView.reloadData()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: false)
		
		// Configure the view for the selected state
	}
	
}

extension AddedImageTableViewCell: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
												UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 127, height: 127)
	}
	func collectionView(_ collectionView: UICollectionView,
											layout collectionViewLayout: UICollectionViewLayout,
											minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	func collectionView(_ collectionView: UICollectionView,
											layout collectionViewLayout: UICollectionViewLayout,
											minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 8
	}
	func collectionView(_ collectionView: UICollectionView,
											layout collectionViewLayout: UICollectionViewLayout,
											insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
}

extension AddedImageTableViewCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView,
											numberOfItemsInSection section: Int) -> Int {
		return self.imageURL.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell: AddedImageCollectionViewCell = collectionView.dequeueCell(forIndexPath: indexPath)
		cell.awakeFromNib()
		cell.addedImageView.image = UIImage(named: "btnBack")
		return cell
	}
}



