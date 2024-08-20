//
//  UIColorTest.swift
//  UIKitPrime_Tests
//
//  Created by Herlandro Hermogenes on 20/08/2024.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import XCTest
import UIKitPrime

final class UIColorTest: XCTestCase {

    // MARK - WhenUIColorIsCreatedWithValidHexColorString

    func testShouldMakeSureThatValidHexColorStringWithHashIsValidColor() throws {
        let color = try UIColor(hex: "#FF5733")
        XCTAssertEqual(color, UIColor(red: 1.0, green: 0.341, blue: 0.2, alpha: 1.0))
    }

    func testShouldMakeSureThatValidHexColorStringWithoutHashIsValidColor() throws {
        let color = try UIColor(hex: "FF5733")
        XCTAssertEqual(color, UIColor(red: 1.0, green: 0.341, blue: 0.2, alpha: 1.0))
    }

    // MARK - WhenUIColorIsCreatedWithInvalidHexColorString

    func testShouldMakeSureThatTooShortHexColorStringIsInvalidColor() {
        XCTAssertThrowsError(try UIColor(hex: "FFF")) { error in
            XCTAssertEqual(error as? ColorError, ColorError.invalidHexLength)
        }
    }

    func testShouldMakeSureThatTooLongHexColorStringIsInvalidColor() {
        XCTAssertThrowsError(try UIColor(hex: "FF5733FF")) { error in
            XCTAssertEqual(error as? ColorError, ColorError.invalidHexLength)
        }
    }

    func testShouldMakeSureThatNonValidFormatHexColorStringIsInvalidColor() {
        XCTAssertThrowsError(try UIColor(hex: "ZZZZZZ")) { error in
            XCTAssertEqual(error as? ColorError, ColorError.invalidHexFormat)
        }
    }
}
