//
//  AddNoticeViewController.swift
//  Housing
//
//  Created by 김태훈 on 2021/01/08.
//

import UIKit
import RxSwift
import RxCocoa
class AddNoticeViewController: UIViewController{
	var requestData = RequestDataModel.shared
	let disposeBag = DisposeBag()
	private let noticeScroll = UIScrollView()
	private let contentView = UIView()
	private let backgroundLabel = UILabel().then{
		$0.text = "공지를 작성해주세요"
		$0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 26)
		$0.textColor = .black
		$0.textAlignment = .left
	}
	private let lineImage = UIView().then {
		$0.backgroundColor = UIColor.primaryBlack
		$0.tintColor = UIColor.primaryBlack
	}
	private var noticeTitle = UITextField().then{
		$0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 21)
		$0.borderStyle = .none
		$0.placeholder("제목을 작성해주세요")
		$0.textColor = .black
	}
	private let underBar = UIView().then {
		$0.backgroundColor = .gray01
	}
	private var noticeDescription = UITextView().then{
		$0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
		$0.setRounded(radius: 16)
		$0.setBorder(borderColor: .gray01, borderWidth: 1)
		$0.text = "내용을 작성해주세요"
		$0.backgroundColor = .white
		$0.textColor = .gray01
		$0.textContainerInset = UIEdgeInsets(top: 24, left: 16, bottom: 24, right: 16)
	}
	private let smallball = UIView().then {
		$0.backgroundColor = .primaryOrange
		$0.setRounded(radius: 6)
	}
	private let calenderRecommendLabel = UILabel().then{
		$0.text = "캘린더에 일정으로 추가하시겠어요?"
		$0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
		$0.textColor = .black
		$0.textAlignment = .left
	}
	private let calenderDescriptionLabel = UILabel().then{
		$0.text = "세입자와의 약속을 잡아야 한다면! 일정을 바로 등록하세요."
		$0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 14)
		$0.textColor = .black
		$0.textAlignment = .left
	}
	
	
	private let pickDateLabel = UILabel().then{
		$0.text = "일자를 선택해주세요"
		$0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
		$0.textColor = .black
	}
	
	private let datePickerLabel = UILabel().then {
		$0.textColor = .textGrayBlank
		$0.text = "YYYY.MM.DD"
		$0.isUserInteractionEnabled = true
		$0.isMultipleTouchEnabled = true
		
		$0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 21)
	}
	private let pickDateunderBar = UIView().then{
		$0.backgroundColor = .textGrayBlank
	}
	private let timeSelectLabel = UILabel().then{
		$0.text = "시간을 선택해 주세요!"
		$0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
		$0.textColor = .black
	}
	private let startHour = UILabel().then {
		$0.textColor = .textGrayBlank
		$0.text = "07시"
		$0.isUserInteractionEnabled = true
		$0.isMultipleTouchEnabled = true
		$0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 21)
	}
	private let startHourUnderBar = UIView().then{
		$0.backgroundColor = .textGrayBlank
	}
	
	private let endHour = UILabel().then {
		$0.textColor = .textGrayBlank
		$0.text = "17시"
		$0.isUserInteractionEnabled = true
		$0.isMultipleTouchEnabled = true
		$0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 21)
	}
	private let endHourUnderBar = UIView().then{
		$0.backgroundColor = .textGrayBlank
	}
	private let registerButton = UIButton().then {
		$0.backgroundColor = .gray01
		$0.setTitle("등록하기", for: .normal)
		$0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 13)
		$0.setTitleColor(.white, for: .normal)
		$0.setRounded(radius: 25)
	}
	
	private func widthConstraintAmount(value : CGFloat) -> CGFloat {
		let superViewWidth = self.view.frame.width
		
		return (value / 375) * superViewWidth
	}
	private func heightConstraintAmount(value : CGFloat) -> CGFloat {
		let superViewHeight = self.view.frame.height
		
		return (value / 1110) * superViewHeight
	}
	
	private func layout() {
		self.navigationController?.navigationBar.backgroundColor = .white
		self.view.backgroundColor = .white
		self.view.addSubview(noticeScroll)
		noticeScroll.snp.makeConstraints{
			$0.edges.equalToSuperview()
		}
	  noticeScroll.addSubview(contentView)
		contentView.snp.makeConstraints{
			$0.width.equalToSuperview()
			$0.centerX.top.bottom.equalTo(noticeScroll)
		}
		
		contentView.adds([
			backgroundLabel,
			lineImage,
			noticeTitle,
			noticeDescription,
			underBar,
			pickDateLabel,
			calenderRecommendLabel,
			smallball,
			calenderDescriptionLabel,
			datePickerLabel,
			pickDateunderBar,
			timeSelectLabel,
			startHour,
			startHourUnderBar,
			endHour,
			endHourUnderBar,
			registerButton
		])
		backgroundLabel.snp.makeConstraints{
			$0.top.equalToSuperview().offset(0)
			$0.leading.equalTo(view).offset(20)
		}
		lineImage.snp.makeConstraints{
			$0.top.equalToSuperview().offset(22)
			$0.trailing.equalTo(view.safeAreaLayoutGuide).offset(0)
			$0.leading.equalTo(backgroundLabel.snp.trailing).offset(8)
			$0.height.equalTo(1)
		}
		
		noticeTitle.snp.makeConstraints{
			$0.top.equalTo(backgroundLabel.snp.bottom).offset(60)
			$0.centerX.equalTo(view)
			$0.leading.equalTo(view).offset(20)
			$0.trailing.equalTo(view).offset(-20)
		}

		underBar.snp.makeConstraints{
			$0.top.equalTo(lineImage.snp.bottom).offset(100)
			$0.width.equalTo(noticeTitle)
			$0.height.equalTo(1)
			$0.centerX.equalTo(view)
		}
		noticeDescription.snp.makeConstraints{
			$0.top.equalTo(underBar.snp.bottom).offset(36)
			$0.centerX.equalTo(view)
			$0.width.equalTo(noticeTitle)
			$0.height.equalTo(noticeDescription.snp.width).multipliedBy(1 / 2.09)
			
		}
		smallball.snp.makeConstraints{
			$0.top.equalTo(underBar.snp.bottom).offset(265)
			$0.leading.equalTo(view).offset(20)
			$0.width.height.equalTo(12)
		}
		calenderRecommendLabel.snp.makeConstraints{
			$0.centerY.equalTo(smallball)
			$0.leading.equalTo(smallball.snp.trailing).offset(12)
		}
		calenderDescriptionLabel.snp.makeConstraints{
			$0.top.equalTo(calenderRecommendLabel.snp.bottom).offset(12)
			$0.leading.equalTo(view).offset(20)
		}
		pickDateLabel.snp.makeConstraints{
			$0.top.equalTo(calenderDescriptionLabel.snp.bottom).offset(44)
			$0.leading.equalTo(view).offset(20)
		}
		datePickerLabel.snp.makeConstraints{
			$0.top.equalTo(pickDateLabel.snp.bottom).offset(28)
			$0.leading.equalTo(view).offset(20)
			$0.trailing.equalTo(view).offset(-20)
		}
		pickDateunderBar.snp.makeConstraints{
			$0.top.equalTo(smallball.snp.bottom).offset(156)
			$0.width.equalTo(datePickerLabel)
			$0.height.equalTo(1)
			$0.centerX.equalTo(view)
		}
		timeSelectLabel.snp.makeConstraints{
			$0.top.equalTo(pickDateunderBar.snp.bottom).offset(64)
			$0.leading.equalTo(view).offset(20)
			
		}
		startHour.snp.makeConstraints{
			$0.top.equalTo(timeSelectLabel.snp.bottom).offset(28)
			$0.leading.equalTo(view).offset(20)
			$0.trailing.equalTo(endHour.snp.leading).offset(-24)
		}
		startHourUnderBar.snp.makeConstraints{
			$0.top.equalTo(pickDateunderBar.snp.bottom).offset(142)
			$0.centerX.equalTo(startHour)
			$0.width.equalTo(startHour)
			$0.height.equalTo(1)
			
		}
		endHour.snp.makeConstraints{
			$0.top.equalTo(timeSelectLabel.snp.bottom).offset(28)
			$0.leading.equalTo(startHour.snp.trailing).offset(24)
			$0.width.equalTo(startHour)
			$0.trailing.equalTo(view).offset(-20)
		}
		endHourUnderBar.snp.makeConstraints{
			$0.top.equalTo(startHour.snp.bottom).offset(7)
			$0.centerX.equalTo(endHour)
			$0.width.equalTo(endHour)
			$0.height.equalTo(1)
		}
		registerButton.snp.makeConstraints{
			$0.top.equalTo(startHourUnderBar.snp.bottom).offset(72)
			$0.centerX.equalTo(view)
			$0.width.equalTo(255)
			$0.height.equalTo(48)
			$0.bottom.equalToSuperview().offset(-80)
		}
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		bindUI()
		tabGestureInitializer() 
		layout()
		textInputConfig()
		// Do any additional setup after loading the view.
	let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
	self.contentView.addGestureRecognizer(tap)
 }

	
	private func textInputConfig(){
		noticeDescription.delegate = self
		noticeTitle.delegate = self
	}
	private func bindUI() {
		let inputOb : Observable<Bool> = noticeTitle.rx.text.map{$0 == ""}.asObservable()
		let desInputOb : Observable<Bool> = noticeDescription.rx.text.orEmpty.map{$0 == "내용을 작성해주세요"}.asObservable()
		inputOb.subscribe{b in
			self.noticeTitle.font = b.element! ? UIFont(name: "AppleSDGothicNeo-Regular", size: 21) : UIFont(name: "AppleSDGothicNeo-Bold", size: 21)

			self.underBar.backgroundColor = b.element! ? .gray01 : .black
			self.underBar.snp.updateConstraints{
				$0.height.equalTo(b.element! ? 1 : 2)
			}
		}.disposed(by: disposeBag)
		desInputOb.subscribe{ b in
			if !b.element! {
				self.noticeDescription.layer.applyShadow()
			}
		}.disposed(by: disposeBag)
		Observable.combineLatest(inputOb, desInputOb, resultSelector: { !$0 && !$1})
			.subscribe{ b in
				self.registerButton.isEnabled = b.element!
				self.registerButton.backgroundColor = b.element! ? .black : .gray01
			}
			.disposed(by: disposeBag)
		
		
		self.requestData.date.observeOn(MainScheduler.instance).filter{!$0.isEmpty}.subscribe(onNext : { str in
		 print(str)
		 self.datePickerLabel.textColor = .black
		 self.pickDateunderBar.backgroundColor = .black
		 self.datePickerLabel.text = str
		}).disposed(by: disposeBag)
		self.requestData.startTime.observeOn(MainScheduler.instance).filter{!$0.isEmpty}.subscribe(onNext : { str in
			print(str)
			self.startHour.textColor = .black
			self.startHourUnderBar.backgroundColor = .black
			self.startHour.text = str
		}).disposed(by: disposeBag)
		self.requestData.endTime.observeOn(MainScheduler.instance).filter{!$0.isEmpty}.subscribe(onNext : { str in
			print(str)
			self.endHour.textColor = .black
			self.endHourUnderBar.backgroundColor = .black
			self.endHour.text = str
		}).disposed(by: disposeBag)
	}
	
	private func tabGestureInitializer() {
		let callDatePicker = UITapGestureRecognizer(target: self, action: #selector(callDatePickerView))
		let callStartTimePicker = UITapGestureRecognizer(target: self, action: #selector(callStartTimePickerView))
		let callEndTimePicker = UITapGestureRecognizer(target: self, action: #selector(callEndTimePickerView))
		self.datePickerLabel.addGestureRecognizer(callDatePicker)
		self.startHour.addGestureRecognizer(callStartTimePicker)
		self.endHour.addGestureRecognizer(callEndTimePicker)
	}
	
	@objc func handleTap(recognizer: UITapGestureRecognizer){
		self.view.endEditing(true)
	}
	@objc func callDatePickerView(recognizer : UITapGestureRecognizer) {
		let pickerView = DatePickerViewController()
		pickerView.pickerMode = 0
		pickerView.grayImage.image = self.view.window?.asImage()
		pickerView.modalPresentationStyle = .fullScreen
		self.present(pickerView, animated: false, completion: nil)
	}
	@objc func callStartTimePickerView(recognizer : UITapGestureRecognizer) {
		let pickerView = DatePickerViewController()
		pickerView.grayImage.image = self.view.window?.asImage()
		pickerView.modalPresentationStyle = .fullScreen
		
		pickerView.pickerMode = 1
		self.present(pickerView, animated: false, completion: nil)
	}
	@objc func callEndTimePickerView(recognizer : UITapGestureRecognizer) {
		let pickerView = DatePickerViewController()
		pickerView.pickerMode = 2
		pickerView.grayImage.image = self.view.window?.asImage()
		pickerView.modalPresentationStyle = .fullScreen
		self.present(pickerView, animated: false, completion: nil)
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


extension AddNoticeViewController : UITextViewDelegate {
	func textViewDidBeginEditing(_ textView: UITextView) {
		if textView.textColor == UIColor.gray01 {
			textView.text = nil
			textView.textColor = UIColor.black
		}
	}
	func textViewDidEndEditing(_ textView: UITextView) {
		if textView.text.isEmpty {
			textView.text = "내용을 작성해주세요"
			textView.textColor = UIColor.gray01
			requestData.discription = ""
		}
		else {
			requestData.discription = textView.text
		}
	}
}
extension AddNoticeViewController : UITextFieldDelegate{
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	func textFieldDidEndEditing(_ textField: UITextField) {
		requestData.title = textField.text ?? ""
	}
}