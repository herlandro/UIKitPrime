//
//  UIButton.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 19/04/2018.
//

import UIKit

extension UICollectionView {

	/// Register UICollectionViewCell
	/// Parameter cellName: cellName should be the same for Identifier and XIB Name
	open func registerForCell(_ cellName: String) {

		let cell = UINib(nibName: cellName, bundle: nil)
		self.register(cell, forCellWithReuseIdentifier: cellName)
	}

}
