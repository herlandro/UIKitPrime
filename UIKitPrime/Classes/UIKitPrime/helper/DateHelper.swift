//
//  Character.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 14/04/2018.
//

import Foundation

public struct DateHelper {

    public static func isInSameTime(date1: Date, date2: Date, timeUnity: Calendar.Component) -> Bool {
        return Calendar.current.isDate(date1, equalTo: date2, toGranularity: timeUnity)
    }
}
