//
//  LAContext.swift
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

	var biometricType: BiometricTypeEnum {
		var error: NSError?

		guard self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
			// Capture these recoverable error thru Crashlytics
			return .none
		}

		if #available(iOS 11.0, *) {

			switch self.biometryType {
			case .none:
				return .none

			case .touchID:
				return .touchID

			case .faceID:
				return .faceID

			default:
				return .none
			}
		} else {

			return self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touchID : .none
		}
	}
}
