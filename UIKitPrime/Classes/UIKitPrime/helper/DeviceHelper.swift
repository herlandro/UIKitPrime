//
//  Character.swift
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
}
