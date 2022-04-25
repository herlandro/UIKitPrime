//
//  ActiveStatus.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 05/09/2018.
//

import Foundation

public enum ActiveStatus: Int, CustomStringConvertible, Codable {

	case inactive = 0
	case test = 1
	case active = 2

	public var description: String {
		get {
			switch self {
			case .inactive:
				return "Inactive"

			case .test:
				return "Test"

			case .active:
				return "Active"
			}
		}
	}

	public static func parseFromString(_ value: String?) -> ActiveStatus? {

		if let value = value {
			switch value {
			case "Inactive":
				return inactive

			case "Test":
				return test

			case "Active":
				return active

			default:
				return nil
			}
		}

		return nil
	}
}
