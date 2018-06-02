//
//  Character.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 03/05/2018.
//

import UIKit

extension UILabel {

	public func text(value: String?, defaultValue: String) {
		if value.isNilOrEmpty {
			self.text = defaultValue
		} else {
			self.text = value
		}
	}
}
