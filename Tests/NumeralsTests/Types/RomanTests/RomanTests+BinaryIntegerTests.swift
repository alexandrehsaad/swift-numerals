// RomanTests+BinaryIntegerTests.swift
// NumeralsTests
//
// Copyright © 2021 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Numerals

extension RomanTests {
	func test_initializedClampingSucceeds() {
		// Given
		let min: TestSubject = .init(clamping: -1)
		let max: TestSubject = .init(clamping: 4000)

		// Then
		XCTAssertEqual(min, 0)
		XCTAssertEqual(max, 3999)
	}
	
	func test_trailingZeroBitCountSucceeds() {
		// Given
		let zero: TestSubject = .init(0b0000000000000000)
		let numeral: TestSubject = .init(0b0000111110011111)
		
		// Then
		XCTAssertEqual(zero.trailingZeroBitCount, 12)
		XCTAssertEqual(numeral.trailingZeroBitCount, 0)
	}
	
	func test_signumSucceeds() {
		// Given
		let zero: TestSubject = 0
		let four: TestSubject = 4
		
		// Then
		XCTAssertEqual(zero.signum(), 0)
		XCTAssertEqual(four.signum(), 1)
	}
}
