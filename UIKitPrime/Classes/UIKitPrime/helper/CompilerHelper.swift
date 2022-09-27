//
//  CompilerHelper.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 06/07/2018.
//

import Foundation

public struct CompilerHelper {

	@available(*, deprecated, renamed: "isDebugging")
	public static var isDebug: Bool {
		return _isDebugAssertConfiguration()
	}

	public static var isDebugging: Bool {
		return _isDebugAssertConfiguration()
	}


	/// Prints a value only in debugging mode
	public static func debug(print text: String) {
		if CompilerHelper.isDebugging {

			print("Debug Console: \(text)")
		}
	}
}
