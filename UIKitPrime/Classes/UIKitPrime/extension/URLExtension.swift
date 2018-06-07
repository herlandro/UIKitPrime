//
//  URLExtension.swift
//  Best Mobile Prod
//
//  Created by Joao Pires on 04/07/2019.
//  Copyright © 2019 Joao Pires. All rights reserved.
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
