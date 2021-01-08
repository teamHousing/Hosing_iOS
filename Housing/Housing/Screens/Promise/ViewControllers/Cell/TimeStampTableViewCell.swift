//
//  TimeStampTableViewCell.swift
//  Housing
//
//  Created by 김태훈 on 2021/01/08.
//

import UIKit
import SnapKit
import Then

class TimeStampTableViewCell: UITableViewCell {
	static let registterId = "\(TimeStampTableViewCell.self)"
	let containerView = UIView().then {
		$0.backgroundColor = .primaryGray
		$0.setRounded(radius: 12)
		
	}
	let dateLabel = UILabel().then{
		$0.textColor = .primaryBlack
		$0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
		$0.textAlignment = .center
	}
	let timeLabel = UILabel().then {
		$0.textColor = .primaryBlack
		$0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
		$0.textAlignment = .center
	}
	let methodLabel = UILabel().then {
		$0.textColor = .primaryBlack
		$0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
		$0.textAlignment = .center
	}
	
	let circleView = UIView().then() {
		$0.backgroundColor = .primaryBlack
		$0.layer.cornerRadius = 6
	}
	let deleteButton = UIButton().then{
		$0.backgroundColor = .primaryOrange
		$0.layer.cornerRadius = 6
	}
	let firstSeperatorView = UIView().then {
		$0.backgroundColor = .gray01
	}
	let secondSeperatorView = UIView().then {
		$0.backgroundColor = .gray01
	}
	
	static func estimatedRowHeight() -> CGFloat {
		return 57
	}
	func layout() {
		self.contentView.adds([containerView,circleView,deleteButton])
		containerView.snp.makeConstraints{
			$0.top.equalTo(self.contentView.snp.top).offset(6)
			$0.bottom.equalTo(self.contentView.snp.bottom).offset(-6)
			$0.leading.equalTo(self.contentView.snp.leading).offset(48)
			$0.trailing.equalTo(self.contentView.snp.trailing).offset(-55)
			$0.width.equalTo(272)
			$0.centerY.equalTo(self.contentView.snp.centerY)
			$0.height.equalTo(self.containerView.snp.width).multipliedBy(4.77)
		}
		circleView.snp.makeConstraints {
			$0.width.height.equalTo(12)
			$0.leading.equalTo(self.contentView.snp.leading).offset(20)
			$0.centerY.equalTo(self.containerView.snp.centerY)
			
		}
		deleteButton.snp.makeConstraints{
			$0.width.height.equalTo(12)
			$0.trailing.equalTo(self.contentView.snp.trailing).offset(-20)
			$0.centerY.equalTo(self.containerView.snp.centerY)
		}
		containerView.adds([timeLabel,dateLabel,methodLabel,firstSeperatorView,secondSeperatorView])
		timeLabel.snp.makeConstraints {
			$0.top.equalTo(containerView.snp.top).offset(20)
			$0.leading.equalTo(containerView.snp.leading).offset(20)
			$0.centerX.equalTo(containerView.snp.centerX)
		}
		
		dateLabel.snp.makeConstraints {
			$0.centerY.equalTo(self.containerView.snp.centerY)
			$0.centerX.equalTo(self.timeLabel.snp.centerX).offset(-109)
		}
		methodLabel.snp.makeConstraints {
			$0.centerY.equalTo(self.containerView.snp.centerY)
			$0.centerX.equalTo(self.timeLabel.snp.centerX).offset(93)
			
		}
		firstSeperatorView.snp.makeConstraints {
			$0.height.equalTo(self.methodLabel)
			$0.width.equalTo(2)
			$0.centerX.equalTo(self.timeLabel.snp.centerX).offset(-49)
			$0.centerY.equalTo(self.containerView.snp.centerY)
		}
		
		secondSeperatorView.snp.makeConstraints {
			$0.height.equalTo(self.methodLabel)
			$0.width.equalTo(2)
			$0.centerX.equalTo(self.timeLabel.snp.centerX).offset(52)
			$0.centerY.equalTo(self.containerView.snp.centerY)
			
		}
	}
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		layout()
		dump(self.contentView.subviews)
	}
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .default, reuseIdentifier: "TimeStampTableViewCell")
		layout()
	}
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		layout()
		
	}
	
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}