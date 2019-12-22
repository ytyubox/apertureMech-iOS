//
//  ViewController.swift
//  try
//
//  Created by 游宗諭 on 2019/12/19.
//  Copyright © 2019 游宗諭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var baseView: UIView!
	
	@IBOutlet weak var widthConstraint: NSLayoutConstraint!
	
	@IBAction func didChangeSliderValue(_ sender: UISlider) {
		widthConstraint.constant = CGFloat(sender.value) * baseView.frame.width
	}
}

