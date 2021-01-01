//
//  CameraWorkViewController.swift
//  Housing
//
//  Created by 김태훈 on 2021/01/01.
//

import UIKit
import Photos
import AVFoundation
import AssetsPickerViewController

class CameraWorkViewController: UIViewController{
	
	let sessionn = AVCaptureSession()
	var camera : AVCaptureDevice?
	var cameraPreViewLayer : AVCaptureVideoPreviewLayer?
	var cameraCaptureOutput : AVCapturePhotoOutput?
	
	
	let imagePickerController = UIImagePickerController()
	let picker = AssetsPickerViewController()
	
	var thumbnailPictures : [UIImage] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		
		imagePickerController.delegate = self
		picker.pickerDelegate = self
		print(thumbnailPictures)
		// Do any additional setup after loading the view.
	}
  @IBAction func addPictureFromCamera(_ sender: Any) {
		switch PHPhotoLibrary.authorizationStatus() {
		case .denied:
			break
		case .restricted:
			break
		case .authorized:
			self.imagePickerController.sourceType = .camera
			self.present(self.imagePickerController, animated: true, completion: nil)
		case .notDetermined:
			PHPhotoLibrary.requestAuthorization{
				state in
				if state == .authorized {
					self.imagePickerController.sourceType = .camera
					self.present(self.imagePickerController, animated: true, completion: nil)
				}
				else {
					self.dismiss(animated: true, completion: nil)
				}
			}
		default:
			break
		}
  }
  @IBAction func addPictureFromLibrary(_ sender: Any) {
		switch PHPhotoLibrary.authorizationStatus() {
		case .denied:
			break
		case .restricted:
			break
		case .authorized:
			self.present(self.picker, animated: true, completion: nil)
		case .notDetermined:
			PHPhotoLibrary.requestAuthorization{
				state in
				if state == .authorized {
					self.present(self.picker, animated: true, completion: nil)
				}
				else {
					self.dismiss(animated: true, completion: nil)
				}
			}
		default:
			break
		}
  }
	
}
extension CameraWorkViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		//사진 정보
    print(picker.sourceType)
		if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
			var thumbnail = UIImage()
			image.
			thumbnailPictures.append(image)
		}
		dismiss(animated: true, completion: nil)
	}
}
extension CameraWorkViewController : AssetsPickerViewControllerDelegate {
	func assetsPicker(controller: AssetsPickerViewController, selected assets: [PHAsset]) {
		for items in assets {
			thumbnailPictures.append(items.image(targetSize: CGSize(width: 40, height: 40), contentMode: .aspectFill, options: .none))
		}
		
		dismiss(animated: true, completion: nil)
	}
}
extension PHAsset {
		func image(targetSize: CGSize, contentMode: PHImageContentMode, options: PHImageRequestOptions?) -> UIImage {
				var thumbnail = UIImage()
				let imageManager = PHCachingImageManager()
				imageManager.requestImage(for: self, targetSize: targetSize, contentMode: contentMode, options: options, resultHandler: { image, _ in
						thumbnail = image!
				})
				return thumbnail
		}
}
