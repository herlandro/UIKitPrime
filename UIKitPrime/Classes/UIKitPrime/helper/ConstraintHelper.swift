//
//  ConstraintHelper.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 02/07/2018.
//

import UIKit

open class ConstraintHelper: NSLayoutConstraint {

	var byDefaultValue: CGFloat = 0.0
	var byDefaultDistance: CGFloat = 8.0

	@available(*, deprecated, message: "This method will be deprecated with AppBase release for iOS 13")
	public convenience init(item: Any, attribute: NSLayoutConstraint.Attribute, relatedBy: NSLayoutConstraint.Relation, constant: CGFloat) {
		self.init(
			item: item,
			attribute: attribute,
			relatedBy: relatedBy,
			toItem: nil,
			attribute: .notAnAttribute,
			multiplier: 1.0,
			constant: constant
		)
	}

	@available(*, deprecated, message: "This method will be deprecated with AppBase release for iOS 13")
	public convenience init(item: Any, attribute: NSLayoutConstraint.Attribute, relatedBy: NSLayoutConstraint.Relation, toItem: Any?, attribute relatedAttribute: NSLayoutConstraint.Attribute, constant: CGFloat) {
		self.init(
			item: item,
			attribute: attribute,
			relatedBy: relatedBy,
			toItem: toItem,
			attribute: relatedAttribute,
			multiplier: 1.0,
			constant: constant
		)
	}

	@available(*, deprecated, renamed: "constraint(subView:toSuper:)")
	public static func add(subview: UIView, toSuper superView: UIView) {

		self.constraint(subView: subview, toSuper: superView)
	}

	/// Adds a view to another within the same rect/constraints
	///
	/// - Parameters:
	///   - subView: View to be added
	///   - view: View to receive the subview
	public static func constraint(subView: UIView, toSuper view: UIView) {

		subView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(subView)
		subView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		subView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		subView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		subView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
	}
}
