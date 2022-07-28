// RomanTests+ExpressibleByIntegerLiteralTests.swift
// NumeralsTests
//
// Copyright © 2021 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Numerals

extension RomanTests {
	func test_initializedWithIntegerLiteralSucceeds() {
		// Given
		let four: TestSubject = 4
		
		// When
		let value: TestSubject.Value = four.value
		
		// Then
		XCTAssertEqual(value, 4)
	}
}
