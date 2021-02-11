//
//  Logger.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 11/02/2022.
//

import Foundation

public enum PlatformType: Int, CustomStringConvertible {

	case android = 1
	case ios = 2
	case windowsPhone = 3
	case windows = 4

	public var description: String {
		get {
			switch self {
			case .android:
				return "Android"

			case .ios:
				return "IOS"

			case .windowsPhone:
				return "WindowsPhone"

			case .windows:
				return "Windows"
			}
		}
	}

	public static func parseFromString(_ value: String?) -> PlatformType? {

		if let value = value {
			switch value {
			case "Android":
				return android

			case "IOS":
				return ios

			case "WindowsPhone":
				return windowsPhone

			case "Windows":
				return windows

			default:
				return nil
			}
		}

		return nil
	}
}
