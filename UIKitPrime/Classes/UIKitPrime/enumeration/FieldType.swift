//
//  Logger.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 12/03/2019.
//

public enum FieldType: Int, CustomStringConvertible {

	case text = 1
	case numeric = 2
	case trueOrFalse = 3
	case date = 4

	public var description: String {
		get {
			switch self {
			case .text:
				return "Text"

			case .numeric:
				return "Numeric"

			case .trueOrFalse:
				return "TrueOrFalse"

			case .date:
				return "Date"
			}
		}
	}

	public static func parseFromString(_ value: String?) -> FieldType? {

		if let value = value {
			switch value {
			case "Text":
				return text

			case "Numeric":
				return numeric

			case "TrueOrFalse":
				return trueOrFalse

			case "Date":
				return date

			default:
				return nil
			}
		}

		return nil
	}
}
