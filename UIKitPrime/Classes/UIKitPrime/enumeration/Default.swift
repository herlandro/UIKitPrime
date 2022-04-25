//
//  Default.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 20/10/2018.
//

import Foundation

open class Default {

	public static let shared = Default()

	private init() {
	}

    public let defaultBool: Bool = false
	public let defaultInt: Int = 0
	public let defaultString: String = ""
	public let defaultNSUUID: UUID = NSUUID(uuidBytes: "0000000000000000000000000000000") as UUID
	public let defaultFloat: Float = Float(0)
	public let defaultDouble: Double = Double(0)
	public let defaultNSDate: Foundation.Date = Foundation.Date()
	public let defaultDate: Foundation.Date = Date()
	public let defaultNSData: Data = Data()
	public let defaultNSNumber: NSNumber = NSNumber()
	public let defaultCharacter: Character = Character(" ")
}

