//
//  Optional.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 14/04/2018.
//

import Foundation

public extension Optional {

	/// Receives a closure to be executed if the wrapped value isn't nil
	func whenNotNil(_ closure: (Wrapped) -> Void) {
		guard let unwrapped = self else { return }
		closure(unwrapped)
	}
}

public extension Optional where Wrapped: Collection {

	var isNilOrEmpty: Bool {
		return self?.isEmpty ?? true
	}

	func whenNotNilOrEmpty(_ closure: (Wrapped) -> Void) {
		if !self.isNilOrEmpty {
			if let unwrapped = self {
				closure(unwrapped)
			}
		}
	}
}
