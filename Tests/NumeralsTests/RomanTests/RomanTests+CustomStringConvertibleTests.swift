// RomanTests+CustomStringConvertibleTests.swift
// NumeralsTests
//
// Copyright © 2021 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Numerals

extension RomanTests {
	func test_descriptionSucceeds() {
		// Given
		let value: TestSubject = 3999

		// When
		let description: String = value.description

		// Then
		XCTAssertEqual(description, "MMMCMXCIX")
	}
}
