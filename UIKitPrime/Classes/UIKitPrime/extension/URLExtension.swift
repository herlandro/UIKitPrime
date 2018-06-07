//
//  Character.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 07/05/2018.
//

import Foundation

public extension URL {

    static func encode(string: String) -> String {
        let allowedCharacterSet = (CharacterSet(charactersIn: "^!*'();:@&=+$,/?%#[] ").inverted)
        if let escapedString = string.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) {
            return escapedString
        }
        return string
    }
}
