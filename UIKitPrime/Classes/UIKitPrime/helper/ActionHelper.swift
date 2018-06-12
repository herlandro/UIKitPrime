//
//  Logger.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 12/05/2018.
//

import MapKit

public struct ActionHelper {

	/// Opens Apple Maps on a give coordinate and shows a nome for said location
	///
	/// - Parameters:
	///   - locationName: Name to be shown
	///   - phoneNumber: Phone number to be called from Apple Maps
	///   - url: URL to be used by Apple Maps
	///   - clLocationCoordinate2D: The coordinates object
	///   - launchOptions: Apple Maps Options
	public static func openInAppleMaps(locationName: String?, phoneNumber: String? = nil, url: URL? = nil, clLocationCoordinate2D: CLLocationCoordinate2D, launchOptions: [String: Any]?) {

		let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: clLocationCoordinate2D, addressDictionary: nil))
		if let locationName = locationName {

			mapItem.name = locationName
			mapItem.phoneNumber = phoneNumber
			mapItem.url = url
		}
		mapItem.openInMaps(launchOptions: launchOptions)
	}

	@available(*, deprecated, message: "This method will be deprecated with AppBase release for iOS 13")
	public static func shareUrl(url: URL, uiViewController: UIViewController, excludedActivityTypes: [UIActivity.ActivityType]?) {

		let sharedObjects: [AnyObject] = [url as AnyObject]
		let activityViewController = UIActivityViewController(activityItems: sharedObjects, applicationActivities: nil)
		activityViewController.popoverPresentationController?.sourceView = uiViewController.view
		activityViewController.excludedActivityTypes = excludedActivityTypes
		uiViewController.present(activityViewController, animated: true, completion: nil)
	}

	public static func openUrl(url: String, options: [UIApplication.OpenExternalURLOptionsKey: Any] = [:], completionHandler completion: ((Bool) -> Void)? = nil) {
		if let url = URL(string: url) {

			self.openUrl(url: url, options: options, completionHandler: completion)
		}
	}

	public static func openUrl(url: URL, options: [UIApplication.OpenExternalURLOptionsKey: Any] = [:], completionHandler completion: ((Bool) -> Void)? = nil) {

		UIApplication.shared.open(url, options: options, completionHandler: completion)
	}
}
