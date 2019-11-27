//
//  Logger.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 27/11/2019.
//

public enum ImageResolutionType: Int, CustomStringConvertible {

	case res1080p = 1
	case res720p = 2
	case res480p = 3
	case res240p = 4
	case res100p = 5
	case thumbnail = 6
	case thumbnail200 = 7
	case thumbnail300 = 8

	public var description: String {
		get {
			switch (self) {
			case .res1080p:
				return "Res1080p"
			case .res720p:
				return "Res720p"
			case .res480p:
				return "Res480p"
			case .res240p:
				return "Res240p"
			case .res100p:
				return "Res100p"
			case .thumbnail:
				return "Thumbnail"
			case .thumbnail200:
				return "Thumbnail200"
			case .thumbnail300:
				return "Thumbnail300"
			}
		}
	}

	public static func parseFromString(_ value: String?) -> ImageResolutionType? {
		if let value = value {
			switch value {
			case "Res1080p":
				return res1080p

			case "Res720p":
				return res720p

			case "Res480p":
				return res480p

			case "Res240p":
				return res240p

			case "Res100p":
				return res100p

			case "Thumbnail":
				return thumbnail

			case "Thumbnail200":
				return thumbnail200

			case "Thumbnail300":
				return thumbnail300

			default:
				return nil
			}
		}

		return nil
	}
}
