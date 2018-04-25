//
//  UIButton.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 24/04/2018.
//

import UIKit

public extension UIButton {

	@IBInspectable var localize: String {
		set (key) {

			setTitle(LocalizationHelper.shared.getLocalizedString(key), for: UIControl.State())
		}
		get {
			return title(for: UIControl.State())!
		}
	}

	@IBInspectable var localizedForHighlighted: String {
		set (key) {
			setTitle(LocalizationHelper.shared.getLocalizedString(key), for: .highlighted)
		}
		get {
			return title(for: .highlighted)!
		}
	}

	func enable() {
		isEnabled = true
		alpha = 1
		isUserInteractionEnabled = true
	}

	func disable() {
		isEnabled = false
		alpha = 0.2
		isUserInteractionEnabled = false
	}
}
