/*
 MIT License
 
 Copyright (c) 2018 Tandem Innovation
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import Foundation

open class Default {

	public static let shared = Default()

	private init() {
	}

	public let defaultInt: Int = 0
	public let defaultString: String = ""
	public let defaultBool: Bool = false
	public let defaultNSUUID: UUID = NSUUID(uuidBytes: "0000000000000000000000000000000") as UUID
	public let defaultFloat: Float = Float(0)
	public let defaultDouble: Double = Double(0)
	public let defaultNSDate: Foundation.Date = Foundation.Date()
	public let defaultDate: Foundation.Date = Date()
	public let defaultNSData: Data = Data()
	public let defaultNSNumber: NSNumber = NSNumber()
	public let defaultCharacter: Character = Character(" ")
}

