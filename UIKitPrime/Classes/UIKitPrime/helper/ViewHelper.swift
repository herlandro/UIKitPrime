//
//  Logger.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 19/08/2018.
//

import UIKit

public struct ViewHelper {

	public static func loadNibView(withName: String, owner: Any?) -> UIView? {

		return Bundle.main.loadNibNamed(withName, owner: owner, options: nil)?[0] as? UIView
	}

	public static func loadStoryboardViewController(withStoryboardName: String, withIdentifier: String) -> UIViewController? {

		return UIStoryboard(name: withStoryboardName, bundle: nil).instantiateViewController(withIdentifier: withIdentifier)

	}

	public static func topViewController() -> UIViewController? {
		var result: UIViewController?

		if var topController = UIApplication.shared.keyWindow?.rootViewController {

			while let presentedViewController = topController.presentedViewController {

				topController = presentedViewController
			}

			result = topController
		}

		return result
	}
}
