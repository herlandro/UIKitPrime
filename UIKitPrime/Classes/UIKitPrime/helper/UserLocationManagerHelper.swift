//
//  Logger.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 19/08/2018.
//

import UIKit
import CoreLocation

public protocol UserLocationManagerHelperDelegate {
	func userLocationFound(_ currentUserLocation: CLLocation?)
}

open class UserLocationManagerHelper: NSObject, CLLocationManagerDelegate {


	fileprivate var initialized: Bool = false
	fileprivate var userLocation: CLLocation?
	open var locationManager: CLLocationManager?
	open var delegate: UserLocationManagerHelperDelegate?

	//MARK: Singleton & Constructors
	public static let shared = UserLocationManagerHelper()

	override init() {
		super.init()
		locationManager = CLLocationManager()
		self.locationManager!.delegate = self;
		self.initialized = false
	}

	open func initialize() {
		if !isInitialized() {
			self.locationManager!.distanceFilter = kCLDistanceFilterNone;
			self.locationManager!.desiredAccuracy = kCLLocationAccuracyBest;

			if (self.locationManager!.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization))) {
				NSLog("MAPA")
				if #available(iOS 8.0, *) {
					self.locationManager!.requestWhenInUseAuthorization()
				} else {
					// Fallback on earlier versions
				}
			}

			self.initialized = true
		}
	}

	open func isInitialized() -> Bool {
		return self.initialized
	}

	open func getUserLocation() -> CLLocation? {
		return self.userLocation
	}

	open func callUserLocation() {
		self.delegate?.userLocationFound(self.userLocation)
	}

	open func startUpdatingUserLocation() {
		self.locationManager!.startUpdatingLocation()
	}

	open func stopUpdatingUserLocation() {
		self.locationManager!.stopUpdatingLocation()
	}

	open func getLastKnownLocation() -> CLLocation? {
		return self.locationManager!.location
	}

	// Edited by Tiago, Swift3.0
	open func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		let authorizationStatus = CLLocationManager.authorizationStatus()
		switch authorizationStatus {
		case .authorizedAlways:
			self.userLocation = self.locationManager!.location
			self.locationManager!.stopUpdatingLocation()
			callUserLocation()

		case .authorizedWhenInUse:
			self.userLocation = self.locationManager!.location
			self.locationManager!.stopUpdatingLocation()
			callUserLocation()

		case .denied: NSLog("Denied")
		case .notDetermined: NSLog("Not Determined")
		case .restricted: NSLog("Restricted")
		@unknown default: NSLog("Missing implementation for \(authorizationStatus)")
		}
	}
}
