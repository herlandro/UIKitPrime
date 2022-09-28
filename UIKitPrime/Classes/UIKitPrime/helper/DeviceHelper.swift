//
//  DeviceHelper.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 15/04/2018.
//

import UIKit
import CoreTelephony
import LocalAuthentication

public struct DeviceHelper {

    public static var deviceName: String = UIDevice.current.name
    public static var modelName: String = UIDevice.modelName

    public static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    public static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    public static func wasInstalledFromTestFlight() -> Bool {
        if isRunningInSimulator() {
            return false
        } else {
            if isAppStoreReceiptSandbox() && !hasEmbeddedMobileProvision() {
                return true
            } else {
                return false
            }
        }
    }

    public static func wasInstalledFromAppStore() -> Bool {
        if isRunningInSimulator() {
            return false
        } else {
            if isAppStoreReceiptSandbox() || hasEmbeddedMobileProvision() {
                return false
            } else {
                return true
            }
        }
    }

    private static func hasEmbeddedMobileProvision() -> Bool {
        if let _ = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") { return true }
        return false
    }

    private static func isAppStoreReceiptSandbox() -> Bool {
        if isRunningInSimulator() {
            return false
        } else {
            if let appStoreReceiptURL = Bundle.main.appStoreReceiptURL {
                if appStoreReceiptURL.lastPathComponent == "sandboxReceipt" {
                    return true
                }
            }
            return false
        }
    }

    public static func isRunningInSimulator() -> Bool {
        #if arch(i386) || arch(x86_64)
            return true
        #else
            return false
        #endif
    }

    public static var osVersion: String {
        return UIDevice.current.systemVersion
    }

    public static var biometricType: LAContext.BiometricTypeEnum {
        return LAContext().biometricType
    }

    public static var deviceLanguage: String? {
        return Locale.current.languageCode
    }

    public static var deviceIdentifier: String {
        return UIDevice.current.identifierForVendor!.uuidString
    }

    /// Returns the 1st carrier name
    public static var carrierName: String? {
        var carrier: CTCarrier?
        if #available(iOS 12, *) {
            let carriers = CTTelephonyNetworkInfo().serviceSubscriberCellularProviders
            carrier = carriers?.values.first
        }
        else {
            carrier = CTTelephonyNetworkInfo().subscriberCellularProvider
        }
        let carrierName = carrier?.carrierName
        return carrierName
    }

    public static var modelVersion: String? {
        var result: String? = nil
        if let key = "hw.machine".cString(using: String.Encoding.utf8) {
            var size: Int = 0
            sysctlbyname(key, nil, &size, nil, 0)
            var machine = [CChar](repeating: 0, count: Int(size))
            sysctlbyname(key, &machine, &size, nil, 0)

            result = String(cString: machine)
        }
        return result
    }

    @available(*, deprecated, renamed: "LocalizationHelper.locationCode")
    public static var locationCode: String? {
        return LocalizationHelper.locationCode
    }
}
