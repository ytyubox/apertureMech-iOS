//
//  View.swift
//  try
//
//  Created by 游宗諭 on 2019/12/22.
//  Copyright © 2019 游宗諭. All rights reserved.
//

import UIKit
import SnapKit

class MyView: UIView {
	convenience init() {
		self.init(frame: CGRect.zero)
		apply()
		
	}
	private lazy var baseView = makeView(color: .white)
	private func apply() {
		baseView.snp.makeConstraints { (make) in
			make.center.equalTo(self)
			make.height.width.equalToSuperview().multipliedBy(persentage)
		}
		
		let v1 = makeView(color: .orange)
		v1.snp.makeConstraints { (make) in
			make.bottom.equalTo(baseView.snp.top)
			make.top.equalToSuperview()
			make.left.equalToSuperview()
			make.right.equalTo(baseView.snp.right)
		}
		let v2 = makeView(color: .yellow)
		v2.snp.makeConstraints{ (make) in
			make.top.equalToSuperview()
			make.right.equalToSuperview()
			make.bottom.equalTo(baseView.snp.bottom)
			make.left.equalTo(baseView.snp.right)
		}
		let v3 = makeView(color: .green)
		v3.snp.makeConstraints{ (make) in
			make.top.equalTo(baseView.snp.bottom)
			make.right.equalToSuperview()
			make.bottom.equalToSuperview()
			make.left.equalTo(baseView.snp.left)
		}
	}
	private func makeView(color: UIColor) -> UIView {
		let v = UIView()+
			.backgroundColor(color)
			.translatesAutoresizingMaskIntoConstraints(false)-
		addSubview(v)
		return v
	}
	internal var persentage:Float = 1/3
	override func updateConstraints() {
		self.baseView.snp.removeConstraints()
		apply()
		super.updateConstraints()
	}
}
