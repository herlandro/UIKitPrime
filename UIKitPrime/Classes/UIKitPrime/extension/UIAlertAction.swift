//
//  Character.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 21/04/2018.
//

import UIKit

public extension UIAlertAction {

    convenience init(title: String?, handler: ((UIAlertAction) -> Void)? = nil) {
        self.init(title: title, style: .default, handler: handler)
    }
}
