//
//  UIScrollView.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 05/05/2018.
//

import UIKit

public extension UIStackView {
    
	/// Removes all arranged subviews from the stack and superview.
	func removeAllArrangedSubviews() {
		for subview in self.arrangedSubviews {

			self.removeArrangedSubview(subview)
			subview.removeFromSuperview()
		}
	}

	/// Removes the arranged subview and superview.
	func removeAndDiscardArrangedSubview(_ view: UIView) {
		self.removeArrangedSubview(view)
		view.removeFromSuperview()
	}
}
