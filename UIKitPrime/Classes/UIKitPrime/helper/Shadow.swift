//
//  Shadow.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 19/08/2018.
//

import Foundation
import os.log

public func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {

	let output = items.map { "\($0)" }.joined(separator: separator)
	if CompilerHelper.isDebugging {

		Swift.print(output, terminator: terminator)
	}
}
