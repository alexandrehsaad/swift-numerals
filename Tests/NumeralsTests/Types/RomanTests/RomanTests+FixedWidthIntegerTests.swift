// RomanTests+FixedWidthIntegerTests.swift
// NumeralsTests
//
// Copyright © 2021 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Numerals

extension RomanTests {
	func test_leadingZeroBitCount() {
		// Given
		let zero: TestSubject = .init(0b000000000000)
		let numeral: TestSubject = .init(0b111110011111)
		
		// Then
		XCTAssertEqual(zero.leadingZeroBitCount, 12)
		XCTAssertEqual(numeral.leadingZeroBitCount, 0)
	}
	
	func test_nonzeroBitCount() {
		// Given
		let zero: TestSubject = .init(0b000000000000)
		let numeral: TestSubject = .init(0b111110011111)
		
		// Then
		XCTAssertEqual(zero.nonzeroBitCount, 0)
		XCTAssertEqual(numeral.nonzeroBitCount, 10)
	}
	
	func test_byteSwappedReturnsUnswapped() {
		// Given
		let byteUnswapped: TestSubject = .zero
		let byteSwapped: TestSubject = byteUnswapped.byteSwapped
		
		// When
		let result: Bool = byteUnswapped.isEqual(to: byteSwapped)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_bitWidthReturnsFour() {
		// Given
		let bitWidth: Int = Roman.bitWidth
		
		// When
		let result: Bool = bitWidth.isEqual(to: 12)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_maxReturnsFifteen() {
		// Given
		let max: TestSubject = .max
		
		// When
		let result: Bool = max.isEqual(to: 3999)
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_minReturnsZero() {
		// Given
		let min: TestSubject = .min
		
		// When
		let result: Bool = min.isEqual(to: 0)
		
		// Then
		XCTAssertTrue(result)
	}
	
	// TODO: test MultipliedFullWidth
//	func test_multipliedFullWidthSucceeds() {
//		// Given
//		let integer: TestSubject = 1000
//
//		// When
//		let (high, low) = integer.multipliedFullWidth(by: 4)
//		let result: TestSubject.Value = .init(high) << 4 | .init(low)
//
//		// Then
//		XCTAssertEqual(result, 4000)
//	}
	
	// TODO: test DividingFullWidth
//	func test_dividingFullWidthSucceeds() {
//		// Given
//		let integer: TestSubject = 10
//		// 0b01100100 = 100
//		let high: TestSubject = .init(0b0110) // = 6
//		let low: TestSubject = .init(0b0100) // = 4
//
//		// When
//		let (quotient, remainder) = integer.dividingFullWidth((high, low))
//
//		// Then
//		XCTAssertEqual(quotient, Roman(10))
//		XCTAssertEqual(remainder, Roman(0))
//	}
}
