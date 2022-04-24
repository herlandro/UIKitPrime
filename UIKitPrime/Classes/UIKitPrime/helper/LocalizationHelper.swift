//
//  LocalizationHelper.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 16/04/2018.
//

import Foundation
import UIKit

open class LocalizationHelper {

	fileprivate var bundle: Bundle? = nil

	/**
     Just gets the current setted up language.
     
     @return "es","fr",...
     */
	public var language: String {
		return (UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray)[0] as! String
	}

	//MARK: Singleton & Constructors
	public static let shared = LocalizationHelper()

	public init() {

		if self.bundle == nil {

			self.bundle = Bundle.main
		}

	}

	open func getLocalizedString(_ key: String) -> String {

		return NSLocalizedString(key, comment: "")
	}

	open func StringFromPList(_ key: String) -> String {

		if let str = self.bundle!.infoDictionary![key] as? String {
			return str
		}
		return ""
	}

	open func localizedFromTable(_ key: String, file: String) -> String {

		return NSLocalizedString(key, tableName: file, bundle: Bundle.main, value: "", comment: "")
	}

	open func NSLocalizedStringInternal(_ key: String, comment: String) -> String {

		return LocalizationHelper.shared.localizedStringForKey(key, comment: comment)
	}

	open func LocalizationSetLanguage(_ language: String) {

		LocalizationHelper.shared.setLanguage(language)
	}

	open func LocalizationGetLanguage() -> String {

		return LocalizationHelper.shared.language
	}

	open func LocalizationReset() {

		LocalizationHelper.shared.resetLocalization()
	}

	/**
     Gets the current localized string as in NSLocalizedString.
     */
	open func localizedStringForKey(_ key: String, comment: String) -> String {
		return self.bundle!.localizedString(forKey: key, value: comment, table: nil)
	}

	/**
     Sets the desired language of the ones you have.
     If this function is not called it will use the default OS language.
     If the language does not exists it returns the default OS language.
     */
	open func setLanguage(_ language: String) {
		if let path = Bundle.main.path(forResource: language, ofType: "lproj") {
			self.bundle = Bundle(path: path)
			UserDefaults.standard.set(Array(arrayLiteral: language), forKey: "AppleLanguages")
			UserDefaults.standard.synchronize()

		} else {
			self.resetLocalization()
		}
	}

	/**
     Resets the localization system, so it uses the OS default language.
     */
	open func resetLocalization() {
		self.bundle = Bundle.main
	}

	public static var locationCode: String? {
		var regionLanguage: String?
		let localCurrent = Locale.current
		let languageCode = localCurrent.languageCode
		let regionCode = localCurrent.regionCode
		if let languageCode = languageCode {

			if let regionCode = regionCode {

				regionLanguage = "\(languageCode)_\(regionCode)"
			}
		}
		return regionLanguage
	}

}
