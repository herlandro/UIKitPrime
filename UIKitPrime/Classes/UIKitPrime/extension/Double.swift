//
//  Double.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 12/04/2018.
//

import Foundation

public extension Double {

	func roundDecimalPlaces(toPlaces places: Int) -> Double {
		let divisor = pow(10.0, Double(places))
		return (self * divisor).rounded() / divisor
	}
}
