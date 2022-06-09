// RomanTests+RepresentableByZeroTests.swift
// NumeralsTests
//
// Copyright © 2021 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Numerals

extension RomanTests {
	func test_isZeroReturnsFalse() {
		// Given
		let value: TestSubject = 1
		
		// When
		let result: Bool = value.isZero
		
		// Then
		XCTAssertFalse(result)
	}
	
	func test_isZeroReturnsTrue() {
		// Given
		let value: TestSubject = .zero
		
		// When
		let result: Bool = value.isZero
		
		// Then
		XCTAssertTrue(result)
	}
	
	func test_additionReturnsZero() {
		// Given
		let augend: TestSubject = .zero
		let addend: TestSubject = .zero
		
		// When
		let sum: TestSubject = augend + addend
		
		// Then
		XCTAssertEqual(sum, .zero)
	}
	
	func test_multiplicationReturnsZero() {
		// Given
		let multiplicand: TestSubject = .zero
		let multiplier: TestSubject = .zero
		
		// When
		let product: TestSubject = multiplicand * multiplier
		
		// Then
		XCTAssertEqual(product, .zero)
	}
	
	func test_subtractionReturnsZero() {
		// Given
		let minuend: TestSubject = .zero
		let subtrahend: TestSubject = .zero
		
		// When
		let difference: TestSubject = minuend - subtrahend
		
		// Then
		XCTAssertEqual(difference, .zero)
	}
}
