//
//  Logger.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 02/07/2018.
//

import Foundation
import SystemConfiguration

open class ConnectionHelper {

	static public let shared = ConnectionHelper()

	/// Checks if there is a network connection
	public static var isConnectedToNetWork: Bool {

		var zeroAddress = sockaddr_in()
		zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
		zeroAddress.sin_family = sa_family_t(AF_INET)
		let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {

			$0.withMemoryRebound(to: sockaddr.self, capacity: 1) {

				SCNetworkReachabilityCreateWithAddress(nil, $0)
			}
		}
		var flags = SCNetworkReachabilityFlags.connectionAutomatic
		if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {

			return false
		}
		let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
		let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
		return (isReachable && !needsConnection)
	}
}
