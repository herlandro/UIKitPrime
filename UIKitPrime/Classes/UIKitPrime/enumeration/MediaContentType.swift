//
//  MediaContentType.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 05/05/2020.
//

public enum MediaContentType: Int, CustomStringConvertible {

	case image = 1
	case video = 2
	case streaming = 3
	case document = 4
	case bundle = 5
	case rtBundle = 6
	case uiBundle = 7
	case webLocal = 8

	public var description: String {
		get {
			switch self {
			case .image:
				return "Image"

			case .video:
				return "Video"

			case .streaming:
				return "Streaming"

			case .document:
				return "Document"

			case .bundle:
				return "Bundle"

			case .rtBundle:
				return "RTBundle"

			case .uiBundle:
				return "UIBundle"

			case .webLocal:
				return "WebLocal"
			}
		}
	}

	public static func parseFromString(_ value: String?) -> MediaContentType? {

		if let value = value {
			switch value {
			case "Image":
				return image

			case "Video":
				return video

			case "Streaming":
				return streaming

			case "Document":
				return document

			case "Bundle":
				return bundle

			case "RTBundle":
				return rtBundle

			case "UIBundle":
				return uiBundle

			case "WebLocal":
				return webLocal

			default:
				return nil
			}
		}

		return nil
	}
}
