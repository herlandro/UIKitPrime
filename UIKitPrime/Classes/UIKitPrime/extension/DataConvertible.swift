//
//  DataConvertible.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 10/04/2018.
//  https://stackoverflow.com/a/38024025/9158311


import Foundation

/// Initializes a given type from Data, and adds a property to return the value as Data.
protocol DataConvertible {

	init?(data: Data)

	var data: Data { get }
}

extension DataConvertible where Self: ExpressibleByIntegerLiteral {

	init?(data: Data) {

		var value: Self = 0
		guard data.count == MemoryLayout.size(ofValue: value) else { return nil }
		_ = withUnsafeMutableBytes(of: &value, { data.copyBytes(to: $0) })
		self = value
	}

	var data: Data {

		return withUnsafeBytes(of: self) { Data($0) }
	}
}

/// The types below are convertible to/from Data trivially, as per the protocol implementation
extension Int: DataConvertible { }
extension Float: DataConvertible { }
extension Double: DataConvertible { }
extension Bool: DataConvertible {

	init?(data: Data) {

		var value: Bool = false
		guard data.count == MemoryLayout.size(ofValue: value) else { return nil }
		_ = withUnsafeMutableBytes(of: &value, { data.copyBytes(to: $0) })
		self = value
	}

	var data: Data {

		return withUnsafeBytes(of: self) { Data($0) }
	}

}
extension Date: DataConvertible {

	init?(data: Data) {

		var value: Date = Date()
		guard data.count == MemoryLayout.size(ofValue: value) else { return nil }
		_ = withUnsafeMutableBytes(of: &value, { data.copyBytes(to: $0) })
		self = value
	}

	var data: Data {

		return withUnsafeBytes(of: self) { Data($0) }
	}
}

/// Conversion to/from String is non-trivial
extension String: DataConvertible {

	init?(data: Data) {

		self.init(data: data, encoding: .utf8)
	}

	var data: Data {
		// Note: a conversion to UTF-8 cannot fail.
		return self.data(using: .utf8)!
	}
}

