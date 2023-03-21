//
//  TableCellPrototypeBase.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 21/03/2023.
//

import UIKit

public protocol TableCellPrototypeBase: UITableViewCell {
	static var identifier: String { get }
	func setup(with any: Any)
}
