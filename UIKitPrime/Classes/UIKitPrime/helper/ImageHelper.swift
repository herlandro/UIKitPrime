//
//  Logger.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 02/07/2018.
//

import Foundation
import UIKit

open class ImageHelper {

	public static let shared = ImageHelper()

	fileprivate init() {
	}

	open func getOptimalImgeSize(_ imagePath: String!, isThumbnail: Bool?) -> String? {
		guard imagePath != "" else { return nil }
		let IMAGES_1080P = "/1080p/"
		let IMAGES_720P = "/720p/"
		let IMAGES_480P = "/480p/"
		let IMAGES_240P = "/240p/"
		let _ = "/100p/"
		let IMAGES_THUMBNAIL = "/thumbnail/"

		let SIZE_480P_LOWER_THRESHOLD: CGFloat = 600 // (720 + 480) /2
		let SIZE_720P_LOWER_THRESHOLD: CGFloat = 900 // (1080 + 720) /2
		let _: CGFloat = 1080

		var result: String?
		let screen = UIScreen.main.bounds.size
		let smallestDimension = min(screen.height, screen.width);
		if let thumbNail = isThumbnail {

			if !thumbNail {

				if (smallestDimension < SIZE_480P_LOWER_THRESHOLD) {

					if UIScreen.main.responds(to: #selector(NSDecimalNumberBehaviors.scale)) && UIScreen.main.scale >= 2.0 {

						result = imagePath.replacingCharacters(in: imagePath.range(of: "/", options: NSString.CompareOptions.backwards, range: nil, locale: nil)!, with: IMAGES_480P)
					}
					else {

						result = imagePath.replacingCharacters(in: imagePath.range(of: "/", options: NSString.CompareOptions.backwards, range: nil, locale: nil)!, with: IMAGES_240P)
					}
				}
				else if (smallestDimension < SIZE_720P_LOWER_THRESHOLD) {

					// code executed only on Retina device
					if UIScreen.main.responds(to: #selector(NSDecimalNumberBehaviors.scale)) && UIScreen.main.scale >= 2.0 {

						result = imagePath.replacingCharacters(in: imagePath.range(of: "/", options: NSString.CompareOptions.backwards, range: nil, locale: nil)!, with: IMAGES_720P)
					}
					else {

						result = imagePath.replacingCharacters(in: imagePath.range(of: "/", options: NSString.CompareOptions.backwards, range: nil, locale: nil)!, with: IMAGES_480P)
					}
				}
				else {

					result = imagePath.replacingCharacters(in: imagePath.range(of: "/", options: NSString.CompareOptions.backwards, range: nil, locale: nil)!, with: IMAGES_1080P)
				}
			}
			else {

				result = imagePath.replacingCharacters(in: imagePath.range(of: "/", options: NSString.CompareOptions.backwards, range: nil, locale: nil)!, with: IMAGES_THUMBNAIL)
			}
		}
		return result;
	}

	@available(*, deprecated, message: "This method will be deprecated with AppBase release for iOS 13. Please use the method myImage.crop(width: height:) -> UIImage")
	public static func resize(image: UIImage, target targetSize: CGSize) -> UIImage {

		let width = Double(targetSize.width)
		let height = Double(targetSize.height)

		return image.crop(width: width, height: height)
	}
}
