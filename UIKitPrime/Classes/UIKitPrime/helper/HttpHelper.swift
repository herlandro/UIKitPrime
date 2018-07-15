//
//  Logger.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 02/07/2018.
//

import Foundation
import SystemConfiguration
import Alamofire
import SwiftyJSON

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

	open var alamofireManager: SessionManager!

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

	public init() {

		let configuration = URLSessionConfiguration.default
		alamofireManager = Alamofire.SessionManager(configuration: configuration)
	}

	open func setTimeOut(timeout: Int) {

		let configuration = URLSessionConfiguration.default
		configuration.timeoutIntervalForRequest = TimeInterval(timeout) // seconds
		configuration.timeoutIntervalForResource = TimeInterval(timeout)
		alamofireManager = Alamofire.SessionManager(configuration: configuration)
	}

	open func makeRequest(url: String, method: HTTPMethod, headers: HTTPHeaders) -> DataResponse<Any> {

		if CompilerHelper.isDebugging {

			let performanceHelper = PerformanceHelper()
			performanceHelper.logTime(.start)
			let response = alamofireManager.request(url, headers: headers).responseJSON()
			performanceHelper.logTime(.stop)
			let timeStamp = performanceHelper.printElapsedTime(forDescription: url, in: .milliseconds)
			PerformanceLogger.shared.httpLogger.append(timeStamp)

			return response
		} else {

			let performanceHelper = PerformanceHelper()
			performanceHelper.logTime(.start)
			let response = alamofireManager.request(url, headers: headers).responseJSON()
			performanceHelper.logTime(.stop)
			let timeElapsed = String(performanceHelper.getElapsedTime(in: .milliseconds))
			let startTimeStamp = performanceHelper.getStartTimeStamp()
			let endTimeStamp = performanceHelper.getEndTimeStamp()

			let timeStamp = ("Time Performance for: ' |\(url)' | StartTime: \(startTimeStamp) | EndTime: \(endTimeStamp) | TimeElapsed: \(timeElapsed) \(TimeUnit.milliseconds.description)")
			PerformanceLogger.shared.httpLogger.append(timeStamp)

			return response
		}
	}

	open func makeRequest(url: String, parameter: [String: String], encoding: ParameterEncoding) -> DataResponse<Any> {

		if CompilerHelper.isDebugging {

			let performanceHelper = PerformanceHelper()
			performanceHelper.logTime(.start)
			let response = alamofireManager.request(url, parameters: parameter, encoding: encoding).responseJSON()
			performanceHelper.logTime(.stop)
			let timeStamp = performanceHelper.printElapsedTime(forDescription: url, in: .milliseconds)
			PerformanceLogger.shared.httpLogger.append(timeStamp)

			return response
		} else {

			let performanceHelper = PerformanceHelper()
			performanceHelper.logTime(.start)
			let response = alamofireManager.request(url, parameters: parameter, encoding: encoding).responseJSON()
			performanceHelper.logTime(.stop)
			let timeElapsed = String(performanceHelper.getElapsedTime(in: .milliseconds))
			let startTimeStamp = performanceHelper.getStartTimeStamp()
			let endTimeStamp = performanceHelper.getEndTimeStamp()

			let timeStamp = ("Time Performance for: ' |\(url)' | StartTime: \(startTimeStamp) | EndTime: \(endTimeStamp) | TimeElapsed: \(timeElapsed) \(TimeUnit.milliseconds.description)")
			PerformanceLogger.shared.httpLogger.append(timeStamp)

			return response
		}
	}

	open func makeRequest(url: String, parameter: [String: Any], method: HTTPMethod, header: HTTPHeaders) -> DataResponse<Any> {

		if CompilerHelper.isDebugging {

			let performanceHelper = PerformanceHelper()
			performanceHelper.logTime(.start)
			let response = alamofireManager.request(url, method: method, parameters: parameter, headers: header).responseJSON()
			performanceHelper.logTime(.stop)
			let timeStamp = performanceHelper.printElapsedTime(forDescription: url, in: .milliseconds)
			PerformanceLogger.shared.httpLogger.append(timeStamp)

			return response
		} else {

			let performanceHelper = PerformanceHelper()
			performanceHelper.logTime(.start)
			let response = alamofireManager.request(url, method: method, parameters: parameter, headers: header).responseJSON()
			performanceHelper.logTime(.stop)
			let timeElapsed = String(performanceHelper.getElapsedTime(in: .milliseconds))
			let startTimeStamp = performanceHelper.getStartTimeStamp()
			let endTimeStamp = performanceHelper.getEndTimeStamp()
			let timeStamp = ("Time Performance for: ' |\(url)' | StartTime: \(startTimeStamp) | EndTime: \(endTimeStamp) | TimeElapsed: \(timeElapsed) \(TimeUnit.milliseconds.description)")
			PerformanceLogger.shared.httpLogger.append(timeStamp)

			return response
		}
	}

	open func makeRequest(url: String, body: String, method: HTTPMethod, headers: HTTPHeaders) -> DataResponse<Any> {

		var request = URLRequest(url: URL(string: url)!)
		request.httpMethod = method.rawValue
		if !body.isEmpty {

			request.httpBody = body.data(using: .utf8, allowLossyConversion: false)
		}
		for (field, value) in headers {

			request.setValue(value, forHTTPHeaderField: field)
		}
		let performanceHelper = PerformanceHelper()

		if CompilerHelper.isDebugging {

			performanceHelper.logTime(.start)
			let response = alamofireManager.request(request).responseJSON()
			performanceHelper.logTime(.stop)
			let timeStamp = performanceHelper.printElapsedTime(forDescription: url, in: .milliseconds)
			PerformanceLogger.shared.httpLogger.append(timeStamp)

			return response
		} else {

			let performanceHelper = PerformanceHelper()
			performanceHelper.logTime(.start)
			let response = alamofireManager.request(request).responseJSON()
			performanceHelper.logTime(.stop)
			let timeElapsed = String(performanceHelper.getElapsedTime(in: .milliseconds))
			let startTimeStamp = performanceHelper.getStartTimeStamp()
			let endTimeStamp = performanceHelper.getEndTimeStamp()

			let timeStamp = ("Time Performance for: ' |\(url)' | StartTime: \(startTimeStamp) | EndTime: \(endTimeStamp) | TimeElapsed: \(timeElapsed) \(TimeUnit.milliseconds.description)")
			PerformanceLogger.shared.httpLogger.append(timeStamp)

			return response
		}
	}

	open func getDataIfSuccessful(response: DataResponse<Any>) -> JSON? {

		var result: JSON? = nil
		if let json = response.result.value {

			result = JSON(json)
		}
		return result
	}

	open func unsecureSessionManager(urlSessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default) -> SessionManager {
		let trustPolicies = UnsecureTrustPolicyManager(policies: [:])

		return Alamofire.SessionManager(configuration: urlSessionConfiguration, delegate: SessionDelegate(), serverTrustPolicyManager: trustPolicies)
	}

	class UnsecureTrustPolicyManager: ServerTrustPolicyManager {

		// Override this function in order to trust any self-signed https
		open override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {

			return ServerTrustPolicy.disableEvaluation
		}
	}
}
