//
//  CollectionCellPrototypeBase.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 21/03/2023.
//

import UIKit

public protocol CollectionCellPrototypeBase: UICollectionViewCell {
    static var identifier: String { get }
    func setup(with any: Any)
}
