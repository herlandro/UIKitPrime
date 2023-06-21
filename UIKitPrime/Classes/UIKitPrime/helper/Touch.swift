//
//  Touch.swift.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 07/12/2022.
//

import Foundation
import UIKit

public class Touch {

    private static var instances: [Touch] = []

    private var view: UIView
    private var action: () -> Void

    public static func on(view: UIView..., action: @escaping () -> ()) {
        view.forEach {

            let touch = Touch(view: $0, action: action)
            instances.append(touch)
        }
    }

    private init(view: UIView, action: @escaping () -> Void) {
        self.view = view
        self.action = action

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTouch(_:)))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func onTouch(_ gesture: UIGestureRecognizer) {
        if (gesture.state == .ended) {

            onTouchAction()
        }
    }

    private func onTouchAction() {
        action()
    }
}
