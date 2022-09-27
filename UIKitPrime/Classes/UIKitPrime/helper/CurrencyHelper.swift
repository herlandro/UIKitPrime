//
//  CurrencyHelper.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 02/07/2018.
//

import UIKit

open class CurrencyHelper {

	public static func formatValue(_ value: String, locale: Locale, fractionDigits: Int = 2) -> String {
		if let doubleValue = Double(value) {

			return formatValue(doubleValue, locale: locale, fractionDigits: fractionDigits)
		}
		return String()
	}

	public static func formatValue(_ value: Double, locale: Locale, fractionDigits: Int = 2) -> String {
		let numberFormatter = NumberFormatter()
		var result: String = String()
		numberFormatter.locale = locale
		numberFormatter.currencySymbol = String()
		numberFormatter.numberStyle = NumberFormatter.Style.currency
		numberFormatter.minimumFractionDigits = fractionDigits
		numberFormatter.maximumFractionDigits = fractionDigits
		if let formatted = numberFormatter.string(from: NSNumber(value: value)) {

			result = formatted.trimmingCharacters(in: .whitespacesAndNewlines)
		}

		return result
	}
}
