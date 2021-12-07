//
//  GradientViewHelper.swift.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 07/12/2022.
//


import UIKit

enum Direction: Int {
	case leftRight = 0
	case rightLeft = 1
	case topBottom = 2
	case bottomTop = 3
	case topLeftBottomRight = 4
	case bottomRightTopLeft = 5
	case topRightBottomLeft = 6
	case bottomLeftTopRight = 7
}

/// Subclass of UIView with a gradient background
@IBDesignable
open class GradientViewHelper: UIView {
	@IBInspectable var startColor: UIColor = UIColor.clear
	@IBInspectable var endColor: UIColor = UIColor.clear
	@IBInspectable var direction: Int = Direction.leftRight.rawValue

	typealias GradientType = (x: CGPoint, y: CGPoint)

	func gradientType() -> GradientType {
		switch direction {
		case Direction.leftRight.rawValue:
			return (x: CGPoint(x: 0, y: 0.5), y: CGPoint(x: 1, y: 0.5))

		case Direction.rightLeft.rawValue:
			return (x: CGPoint(x: 1, y: 0.5), y: CGPoint(x: 0, y: 0.5))

		case Direction.topBottom.rawValue:
			return (x: CGPoint(x: 0.5, y: 0), y: CGPoint(x: 0.5, y: 1))

		case Direction.bottomTop.rawValue:
			return (x: CGPoint(x: 0.5, y: 1), y: CGPoint(x: 0.5, y: 0))

		case Direction.topLeftBottomRight.rawValue:
			return (x: CGPoint(x: 0, y: 0), y: CGPoint(x: 1, y: 1))

		case Direction.bottomRightTopLeft.rawValue:
			return (x: CGPoint(x: 1, y: 1), y: CGPoint(x: 0, y: 0))

		case Direction.topRightBottomLeft.rawValue:
			return (x: CGPoint(x: 1, y: 0), y: CGPoint(x: 0, y: 1))

		case Direction.bottomLeftTopRight.rawValue:
			return (x: CGPoint(x: 0, y: 1), y: CGPoint(x: 1, y: 0))

		default:
			return (x: CGPoint(x: 0, y: 0.5), y: CGPoint(x: 1, y: 0.5))
		}
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	override open func draw(_ rect: CGRect) {
		let gradient: CAGradientLayer = CAGradientLayer()
		gradient.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: superview!.frame.size.width, height: superview!.frame.size.height)
		gradient.colors = [startColor.cgColor, endColor.cgColor]
		gradient.startPoint = gradientType().x
		gradient.endPoint = gradientType().y
		gradient.zPosition = -1
		layer.addSublayer(gradient)
	}
}
