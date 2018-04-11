//
//  Dictionary.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 11/04/2018.
//

import Foundation

public extension Dictionary {

    func toNSMutableDictionary() -> NSMutableDictionary {
        return NSMutableDictionary(dictionary: self)
    }

    func toNSDictionary() -> NSDictionary {
        return NSDictionary(dictionary: self)
    }
}
