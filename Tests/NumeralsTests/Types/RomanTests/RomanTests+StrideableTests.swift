// RomanTests+StrideableTests.swift
// NumeralsTests
//
// Copyright © 2021 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Numerals

extension RomanTests {
	func test_advanceBySucceeds() {
		// Given
		let value: TestSubject = 1
		let amount: TestSubject.Stride = 3
		
		// When
		let result: TestSubject = value.advanced(by: amount)
		
		// Then
		XCTAssertEqual(result, 4)
	}
	
	func test_distanceToSucceeds() {
		// Given
		let value: TestSubject = 1
		let otherValue: TestSubject = 4
		
		// When
		let result: TestSubject.Stride = value.distance(to: otherValue)
		
		// Then
		XCTAssertEqual(result, 3)
	}
}
