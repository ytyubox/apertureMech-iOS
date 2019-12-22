//
//  FluentInterface.swift
//  try
//
//  Created by 游宗諭 on 2019/12/22.
//  Copyright © 2019 游宗諭. All rights reserved.
//

import Foundation


@dynamicMemberLookup
/// Fluntly set up property
/// ```swift
///	UIView()+ // 把 UIView 實體包進 FluentInterface 結構體
///.frame(CGRect(x: 0, y: 0, width: 100, height: 100))
///.backgroundColor(.white)
///.alpha(0.5)- // 從 FluentInterface 結構體中取出 UIView 實體
/// ```
struct FluentInterface<Subject> {
	let subject: Subject
	
	// 因為要動到 subject 的屬性，所以 keyPath 的型別必須是 WritableKeyPath
	// 回傳值是一個 Setter 方法
	subscript<Value>(dynamicMember keyPath: WritableKeyPath<Subject, Value>) -> ((Value) -> FluentInterface<Subject>) {
		
		// 因為在要回傳的 Setter 方法裡不能更改 self，所以要把 subject 從 self 取出來用
		var subject = self.subject
		
		// subject 實體的 Setter 方法
		return { value in
			
			// 把 value 指派給 subject 的屬性
			subject[keyPath: keyPath] = value
			
			// 回傳的型別是 FluentInterface<Subject> 而不是 Subject
			// 因為現在的流暢界面是用 FluentInterface 型別來串，而不是 Subject 本身
			return FluentInterface(subject: subject)
		}
	}
}

// 原本 + 只被用在 infix，所以需要另外宣告為 postfix 運算子
postfix operator +

// 把任何實體用 FluentInterface 包裝起來的函數
postfix func + <T>(lhs: T) -> FluentInterface<T> {
	return FluentInterface(subject: lhs)
}

// 同上
postfix operator -

// 把 FluentInterface 的內容取出的函數
// 也可以宣告成 FluentInterface 的 static 方法
postfix func - <T>(lhs: FluentInterface<T>) -> T {
	return lhs.subject
}
