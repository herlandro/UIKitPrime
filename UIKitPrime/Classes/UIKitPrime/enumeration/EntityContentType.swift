//
//  Logger.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 25/11/2018.
//

public enum EntityContentType: Int, CustomStringConvertible {

	case field = 1
	case entityReference = 2
	case mediaContentReference = 3
	case appReference = 4
	case inAppPurchase = 5

	public var description: String {
		get {
			switch self {
			case .field:
				return "Field"

			case .entityReference:
				return "EntityReference"

			case .mediaContentReference:
				return "MediaContentReference"

			case .appReference:
				return "AppReference"

			case .inAppPurchase:
				return "InAppPurchase"
			}
		}
	}

	public static func parseFromString(_ value: String?) -> EntityContentType? {

		if let value = value {
			switch value {
			case "Field":
				return field

			case "EntityReference":
				return entityReference

			case "MediaContentReference":
				return mediaContentReference

			case "AppReference":
				return appReference

			case "InAppPurchase":
				return inAppPurchase

			default:
				return nil
			}
		}

		return nil
	}
}
