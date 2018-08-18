//
//  Character.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 02/05/2018.
//

import UIKit

public extension UINavigationController {

    ///This method is used as a fail safe method as an alternative to popViewController(_:animated:), the declaration of the viewController is not needed. The name of the controller can be used directly in the parameters of the function
//    func popToViewControler<T:UIViewController>(type: T.Type? = nil, animated: Bool = true) -> [UIViewController]? {
//
//        let viewController = self.viewControllers.lazy.compactMap { $0 as? T }.first
//        viewController.whenNotNil {
//
//            return self.popToViewController($0, animated: animated)
//        }
//
//        return nil
//    }

    func findParentViewController<T:UIViewController>(of type: T.Type? = nil) -> T? {
        var currentParent = self.parent
        while currentParent != nil {

            if let viewController = currentParent as? T {

                return viewController
            }
            currentParent = currentParent?.parent
        }

        return nil
    }
}
