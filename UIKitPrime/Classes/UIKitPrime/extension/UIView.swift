//
//  UIView.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 08/04/2018.
//

import UIKit

public extension UIView {

    var parentViewController: UIViewController? {

        var parentResponder: UIResponder? = self
        while parentResponder != nil {

            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {

                return viewController
            }
        }
        return nil
    }

    func setBackgroundGradient(colorArray: [CGColor]) {

        let f = self.frame // UIScreen.main.bounds
        let gradientFrame = CGRect(x: 0, y: 0, width: f.width, height: f.height)

        let view = UIView(frame: (gradientFrame))
        let gradient = CAGradientLayer()
        gradient.frame = gradientFrame
        gradient.colors = colorArray


        let x: Double! = 135 / 360.0
        let a = pow(sinf(Float(2.0 * Double.pi * ((x + 0.75) / 2.0))), 2.0)
        let b = pow(sinf(Float(2 * Double.pi * ((x + 0.0) / 2))), 2)
        let c = pow(sinf(Float(2 * Double.pi * ((x + 0.25) / 2))), 2)
        let d = pow(sinf(Float(2 * Double.pi * ((x + 0.5) / 2))), 2)

        gradient.endPoint = CGPoint(x: CGFloat(c), y: CGFloat(d))
        gradient.startPoint = CGPoint(x: CGFloat(a), y: CGFloat(b))

        view.layer.insertSublayer(gradient, at: 0)
        self.layer.insertSublayer(gradient, at: 0)
    }

    func setRound() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set(newValue) {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {

                return UIColor(cgColor: color)
            }
            return nil
        }
        set(newValue) {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    func hide() {
        self.isHidden = true
        self.layoutIfNeeded()
    }

    func show() {
        self.isHidden = false
        self.layoutIfNeeded()
    }

    private func addView(withIdentifier nibIdentifier: String, andTag tag: Int) {

        let newView = UINib(nibName: nibIdentifier, bundle: nil).instantiate(withOwner: nil, options: nil).first as! UIView
        newView.tag = tag
        newView.translatesAutoresizingMaskIntoConstraints = false
        self.superview?.addSubview(newView)
        newView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        newView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        newView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        newView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
