//
//  UIButton.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 28/04/2018.
//

import UIKit

public extension UIColor {

	var hexString: String {
		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 0
		getRed(&r, green: &g, blue: &b, alpha: &a)
		let rgb: Int32 = (Int32)(r * 255) << 16 | (Int32)(g * 255) << 8 | (Int32)(b * 255) << 0
		return String(format: "#%06x", rgb)
	}
}
