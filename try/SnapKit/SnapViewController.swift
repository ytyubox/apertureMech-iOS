//
//  SnapViewController.swift
//  try
//
//  Created by 游宗諭 on 2019/12/22.
//  Copyright © 2019 游宗諭. All rights reserved.
//

import UIKit

final class SnapViewController:UIViewController {
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		fatalError("\(#function) has not been implemented")
		
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		tabBarItem.title = "SnapKit"
		let image = UIImage(imageLiteralResourceName: "SnapKitIcon")
			.resizeImage(to: CGSize(width: 30, height: 30))
			.withRenderingMode(.alwaysOriginal)
		tabBarItem.image = image
		
		
	}
	lazy var theView = MyView()+
		.translatesAutoresizingMaskIntoConstraints(false)
		.clipsToBounds(true)
		.backgroundColor(.red)-
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.addSubview(theView)
		let slider = UISlider()+
			.value(theView.persentage)
			.maximumValue(1)
			.minimumValue(0)-
		view.addSubview(slider)
		slider.snp.makeConstraints { (make) in
			make.centerX.equalTo(view.snp.centerX)
			make.top.equalTo(view.snp.top).inset(200)
			make.width.equalTo(240)
		}
		slider.addTarget(self, action: #selector(didChangeSliderValue(sender:)), for: .valueChanged)
		theView.snp.makeConstraints { (make) in
			make.center.equalTo(self.view.center)
			make.height.width.equalTo(240)
		}
	}
	@objc private func didChangeSliderValue(sender: UISlider) {
		theView.persentage = sender.value
		theView.setNeedsUpdateConstraints()
	}
}


extension UIImage {
	func resizeImage(to targetSize: CGSize) -> UIImage {
		let size = self.size
		let widthRatio  = targetSize.width  / size.width
		let heightRatio = targetSize.height / size.height
		let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
		let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
		
		UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
		self.draw(in: rect)
		let newImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		return newImage!
	}
}
