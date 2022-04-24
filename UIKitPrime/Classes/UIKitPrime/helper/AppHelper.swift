//
//  AppHelper.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 27/06/2018.
//

import Foundation

public struct AppHelper {


	static public var appName: String {
		return Bundle.main.infoDictionary!["CFBundleName"] as? String ?? ""
	}

	static public var appVersion: String {
		return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String ?? ""
	}

	static public var appIdentifier: String {
		return Bundle.main.bundleIdentifier ?? ""
	}

	static public var appBuild: String {
		return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
	}
}
