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

    convenience init(hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        if cString.count != 6 {
            preconditionFailure("The hex string size is != 6")
        }
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
