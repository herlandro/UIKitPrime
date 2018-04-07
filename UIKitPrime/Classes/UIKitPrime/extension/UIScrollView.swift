//
//  UIScrollView.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 07/04/2018.
//

import UIKit

public extension UIScrollView {

    /// Returns true if the scrollView is bouncing at the top
    var isBouncingAtTop: Bool {
        return self.contentOffset.y <= 0
    }

    /// Returns true if the scrollView is bouncing at the bottom
    var isBouncingAtBottom: Bool {
        return self.contentOffset.y >= (self.contentSize.height - self.frame.size.height)
    }

    /// Returns true if the scrollView is bouncing (at the top or bottom)
    var isBouncing: Bool {
        return self.isBouncingAtTop || self.isBouncingAtBottom
    }
}
