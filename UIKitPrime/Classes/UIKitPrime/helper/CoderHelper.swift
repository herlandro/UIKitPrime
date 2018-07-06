//
//  Logger.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 06/07/2018.
//

import Foundation

open class CoderHelper {

	public static let shared = CoderHelper()

	fileprivate init() {

	}

	open func hasKeyInCoder(_ key: String, coder: NSCoder) -> Bool {
		return coder.containsValue(forKey: key)
	}

	open func parseObject(_ key: String, coder: NSCoder) -> Any {
		return self.parseNullableObject(key, coder: coder)!
	}

	open func parseNullableObject(_ key: String, coder: NSCoder) -> Any? {
		return coder.decodeObject(forKey: key)
	}

	open func parseString(_ key: String, coder: NSCoder) -> String {
		return self.parseNullableString(key, coder: coder)!
	}

	open func parseNullableString(_ key: String, coder: NSCoder) -> String? {
		return coder.decodeObject(forKey: key) as! String?
	}

	open func parseStringList(_ key: String, coder: NSCoder) -> Array<String> {
		return self.parseNullableStringList(key, coder: coder)!
	}

	open func parseNullableStringList(_ key: String, coder: NSCoder) -> Array<String>? {
		return coder.decodeObject(forKey: key) as! Array<String>?
	}

	open func parseDouble(_ key: String, coder: NSCoder) -> Double {
		return self.parseNullableDouble(key, coder: coder)!
	}

	open func parseNullableDouble(_ key: String, coder: NSCoder) -> Double? {
		return coder.decodeObject(forKey: key) as! Double?
	}

	open func parseFloat(_ key: String, coder: NSCoder) -> Float {
		return self.parseNullableFloat(key, coder: coder)!
	}

	open func parseNullableFloat(_ key: String, coder: NSCoder) -> Float? {
		return coder.decodeObject(forKey: key) as! Float?
	}

	open func parseBool(_ key: String, coder: NSCoder) -> Bool {
		return self.parseNullableBool(key, coder: coder)!
	}

	open func parseNullableBool(_ key: String, coder: NSCoder) -> Bool? {
		return coder.decodeObject(forKey: key) as! Bool?
	}

	open func parseInt(_ key: String, coder: NSCoder) -> Int {
		return self.parseNullableInt(key, coder: coder)!
	}

	open func parseNullableInt(_ key: String, coder: NSCoder) -> Int? {
		return coder.decodeObject(forKey: key) as! Int?
	}

	open func parseLong(_ key: String, coder: NSCoder) -> Int {
		return self.parseNullableLong(key, coder: coder)!
	}

	open func parseNullableLong(_ key: String, coder: NSCoder) -> Int? {
		return coder.decodeObject(forKey: key) as! Int?
	}

	open func parseDate(_ key: String, coder: NSCoder) -> Foundation.Date {
		return coder.decodeObject(forKey: key) as! Foundation.Date
	}

	open func parseNullableDate(_ key: String, coder: NSCoder) -> Foundation.Date {
		return coder.decodeObject(forKey: key) as! Foundation.Date
	}

	open func parseBinary(_ key: String, coder: NSCoder) -> Data {
		let value = coder.decodeObject(forKey: key) as! String
		let stringData: NSString = NSString(string: value)
		let data = stringData.data(using: String.Encoding.utf8.rawValue)
		return data!
	}

	open func parseChar(_ key: String, coder: NSCoder) -> Character {
		let value = coder.decodeObject(forKey: key) as! String
		let char = Character(value)
		return char
	}

	open func parseUUID(_ key: String, coder: NSCoder) -> UUID {
		let str: String = coder.decodeObject(forKey: key) as! String
		return UUID(uuidString: str)!
	}

	open func parseEnum<TEnum>(_ key: String, coder: NSCoder) -> TEnum {
		return coder.decodeObject(forKey: key) as! TEnum
	}
}
