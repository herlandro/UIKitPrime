//
//  Logger.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 02/07/2018.
//

import Foundation
import SystemConfiguration

open class HttpHelper {

	@available(*, deprecated, renamed: "HTTP_CODE")
	public struct Codes {

	}

	public struct HTTP_CODE {
		public static let NETWORK_NOT_FOUND = -1
		public static let OK = 200
		public static let CREATED = 201
		public static let ACCEPTED = 202
		public static let NOT_AUTHORITATIVE = 203
		public static let NO_CONTENT = 204
		public static let RESET = 205
		public static let PARTIAL = 206
		public static let MULT_CHOICE = 300
		public static let MOVED_PERM = 301
		public static let MOVED_TEMP = 302
		public static let SEE_OTHER = 303
		public static let NOT_MODIFIED = 304
		public static let USE_PROXY = 305
		public static let BAD_REQUEST = 400
		public static let UNAUTHORIZED = 401
		public static let PAYMENT_REQUIRED = 402
		public static let FORBIDDEN = 403
		public static let NOT_FOUND = 404
		public static let BAD_METHOD = 405
		public static let NOT_ACCEPTABLE = 406
		public static let PROXY_AUTH = 407
		public static let CLIENT_TIMEOUT = 408
		public static let CONFLICT = 409
		public static let GONE = 410
		public static let LENGTH_REQUIRED = 411
		public static let PRECON_FAILED = 412
		public static let ENTITY_TOO_LARGE = 413
		public static let REQ_TOO_LONG = 414
		public static let UNSUPPORTED_TYPE = 415
		public static let INTERNAL_ERROR = 500
		public static let NOT_IMPLEMENTED = 501
		public static let BAD_GATEWAY = 502
		public static let UNAVAILABLE = 503
		public static let GATEWAY_TIMEOUT = 504
		public static let VERSION = 505

	}



	public static let shared = HttpHelper()

	public static var hasConnectivity: Bool {

		var zeroAddress = sockaddr_in()
		zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
		zeroAddress.sin_family = sa_family_t(AF_INET)

		let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
			$0.withMemoryRebound(to: sockaddr.self, capacity: 1) { zeroSockAddress in
				SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
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

	public init() { }


}
