// RomanTests+NumericTests.swift
// NumeralsTests
//
// Copyright © 2021 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Numerals

extension RomanTests {
	func test_magnitudeSucceeds() {
		// Given
		let integer: TestSubject = 4
		
		// When
		let magnitude: TestSubject.Magnitude = integer.magnitude

		// Then
		XCTAssertEqual(magnitude, 4)
	}
	
	func test_initializedExactlySucceeds() {
		// Given
		let zero: TestSubject? = .init(exactly: 0)
		let numeral: TestSubject? = .init(exactly: 3999)

		// Then
		XCTAssertNotNil(zero)
		XCTAssertNotNil(numeral)
	}
	
	func test_initializedExactlyFails() {
		// Given
		let negativeOne: TestSubject? = .init(exactly: -1)
		let sixteen: TestSubject? = .init(exactly: 4000)

		// Then
		XCTAssertNil(negativeOne)
		XCTAssertNil(sixteen)
	}
}
