//
//  Logger.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 02/07/2018.
//

import Foundation
import UIKit

private var logHelper = LogHelper.shared

public func setLogHelper(_ log: LogHelper) {
	logHelper = log
}

public func logVerbose(_ message: @autoclosure () -> Any, _ path: String = #file, _ function: String = #function, _ line: Int = #line) {

	logHelper.verbose(message(), path, function, line: line)
}

public func logDebug(_ message: @autoclosure () -> Any, _ path: String = #file, _ function: String = #function, _ line: Int = #line) {

	logHelper.debug(message(), path, function, line: line)
}

public func logInfo(_ message: @autoclosure () -> Any, _ path: String = #file, _ function: String = #function, _ line: Int = #line) {

	logHelper.info(message(), path, function, line: line)
}

public func logWarning(_ message: @autoclosure () -> Any, _ path: String = #file, _ function: String = #function, _ line: Int = #line) {

	logHelper.warning(message(), path, function, line: line)
}

public func logError(_ message: @autoclosure () -> Any, _ path: String = #file, _ function: String = #function, _ line: Int = #line) {

	logHelper.error(message(), path, function, line: line)
}

open class LogHelper {

	public static let shared = LogHelper()

	public init() {
	}

	open func verbose(_ message: @autoclosure () -> Any, _
		path: String = #file, _ function: String = #function, line: Int = #line) {

		NSLog("\(message()) \(path) \(function) \(line)")
	}

	open func debug(_ message: @autoclosure () -> Any, _
		path: String = #file, _ function: String = #function, line: Int = #line) {

		NSLog("[DEBUG]: \(message()) \(path) \(function) \(line)")
	}

	open func info(_ message: @autoclosure () -> Any, _
		path: String = #file, _ function: String = #function, line: Int = #line) {

		NSLog("[INFO]: \(message()) \(path) \(function) \(line)")
	}

	open func warning(_ message: @autoclosure () -> Any, _
		path: String = #file, _ function: String = #function, line: Int = #line) {

		NSLog("[WARNING]: \(message()) \(path) \(function) \(line)")
	}

	open func error(_ message: @autoclosure () -> Any, _
		path: String = #file, _ function: String = #function, line: Int = #line) {

		NSLog("[ERROR]: \(message()) \(path) \(function) \(line)")
	}
}
