//
//  Logger.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 12/05/2018.
//

import MapKit

open class AlertHelper {
    
    public typealias Completion = (() -> Void)?
    
    /// Build the UIAlertController so you can present as you wish
    /// - Parameters:
    ///   - title: title to display
    ///   - message: message to display
    ///   - actions: actions to execute
    ///   - style: style .alert or .actionSheet
    ///   - color: color action
    /// - Returns: UIAlertController
    public static func buildAlert(title: String? = String(), message: String? = String(), actions: [UIAlertAction]? = nil, style: UIAlertController.Style? = .alert, color: UIColor? = UIColor.black) -> UIAlertController {
        
        let alertViewController = UIAlertController(title: NSLocalizedString(title!, comment: String()), message: NSLocalizedString(message!, comment: String()), preferredStyle: style!)
        alertViewController.view.tintColor = color
        if actions.isNilOrEmpty {
            
            let buttonAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertViewController.addAction(buttonAction)
            
        } else {
            
            actions.whenNotNilOrEmpty {
                
                for action in $0 {
                    
                    alertViewController.addAction(action)
                }
            }
        }
        
        return alertViewController
    }
    
    /// Show Alert with default "Ok" title and action
    /// - Parameters:
    ///   - presenter: presenter description
    ///   - completion: completion description
    public static func showAlert(presenter: UIViewController, completion: Completion? = nil) {
        
        let alertController: UIAlertController = buildAlert(title: nil, message: nil, actions: nil, style: nil, color: nil)
        
        presenter.present(alertController, animated: true, completion: completion ?? nil)
    }
    
    /// Show Alert with custom title
    /// - Parameters:
    ///   - title: title to display
    ///   - presenter: presenter is the viewController responsible to present this alert
    ///   - completion: completion after display the
    public static func showAlert(title: String? = String(), presenter: UIViewController, completion: Completion? = nil) {
        
        let alertController: UIAlertController = buildAlert(title: title, message: nil, actions: nil, style: nil, color: nil)
        
        presenter.present(alertController, animated: true, completion: completion ?? nil)
    }
    
    /// Show Alert with custom title, message
    /// - Parameters:
    ///   - title: title to display
    ///   - message: message to display
    ///   - presenter: presenter is the viewController responsible to present this alert
    ///   - completion: completion after display the
    public static func showAlert(title: String? = String(), message: String? = String(), presenter: UIViewController, completion: Completion? = nil) {
        
        let alertController: UIAlertController = buildAlert(title: title, message: message, actions: nil, style: nil, color: nil)
        
        presenter.present(alertController, animated: true, completion: completion ?? nil)
    }
    
    /// Show Alert with custom title, message and actions
    /// - Parameters:
    ///   - title: title to display
    ///   - message: message to display
    ///   - actions: actions to execute
    ///   - presenter: presenter is the viewController responsible to present this alert
    ///   - completion: completion after display the
    public static func showAlert(title: String? = String(), message: String? = String(), actions: [UIAlertAction]? = nil, presenter: UIViewController, completion: Completion? = nil) {
        
        let alertController: UIAlertController = buildAlert(title: title, message: message, actions: actions, style: nil, color: nil)
        
        presenter.present(alertController, animated: true, completion: completion ?? nil)
    }
    
    /// Show Alert with custom title, message, actions and style
    /// - Parameters:
    ///   - title: title to display
    ///   - message: message to display
    ///   - actions: actions to execute
    ///   - style: style .alert or .actionSheet
    ///   - presenter: presenter is the viewController responsible to present this alert
    ///   - completion: completion after display the
    public static func showAlert(title: String? = String(), message: String? = String(), actions: [UIAlertAction]? = nil, style: UIAlertController.Style? = .alert, presenter: UIViewController, completion: Completion? = nil) {
        
        let alertController: UIAlertController = buildAlert(title: title, message: message, actions: actions, style: style, color: nil)
        
        presenter.present(alertController, animated: true, completion: completion ?? nil)
    }
    
    /// Show Alert with custom title, message, actions, style and color
    /// - Parameters:
    ///   - title: title to display
    ///   - message: message to display
    ///   - actions: actions to execute
    ///   - style: style .alert or .actionSheet
    ///   - color: color action
    ///   - presenter: presenter is the viewController responsible to present this alert
    ///   - completion: completion after display the
    public static func showAlert(title: String? = String(), message: String? = String(), actions: [UIAlertAction]? = nil, style: UIAlertController.Style? = .alert, color: UIColor? = UIColor.black, presenter: UIViewController, completion: Completion? = nil) {
        
        let alertController: UIAlertController = buildAlert(title: title, message: message, actions: actions, style: style, color: color)
        
        presenter.present(alertController, animated: true, completion: completion ?? nil)
    }
    
    /// Show Alert with custom title, message, actions, style, color and is animated or not
    /// - Parameters:
    ///   - title: title to display
    ///   - message: message to display
    ///   - actions: actions to execute
    ///   - style: style .alert or .actionSheet
    ///   - color: color action
    ///   - animated: present with animation (true or false)
    ///   - presenter: presenter is the viewController responsible to present this alert
    ///   - completion: completion after display the
    public static func showAlert(title: String? = String(), message: String? = String(), actions: [UIAlertAction]? = nil, style: UIAlertController.Style? = .alert, color: UIColor? = UIColor.black, animated: Bool? = true, presenter: UIViewController, completion: Completion? = nil) {
        
        let alertController: UIAlertController = buildAlert(title: title, message: message, actions: actions, style: style, color: color)
        
        presenter.present(alertController, animated: animated!, completion: completion ?? nil)
    }
}

