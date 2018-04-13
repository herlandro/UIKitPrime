//
//  Dictionary.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 13/04/2018.
//

import Foundation

import LocalAuthentication

public extension LAContext {

	enum BiometricTypeEnum: String {
		case none
		case touchID
		case faceID
	}
}
