// RomanTests+LosslessStringConvertibleTests.swift
// NumeralsTests
//
// Copyright © 2021 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Numerals

extension RomanTests {
	func test_initializedWithStringFails() {
		// Given
		let empty: TestSubject? = .init("")
		let order: TestSubject? = .init("IVIV")
		let recursion: TestSubject? = .init("IIII")
		
		// Then
		XCTAssertNil(empty)
		XCTAssertNil(order)
		XCTAssertNil(recursion)
	}
	
	func test_initializedWithStringSucceeds() {
		// Given
		let integer: TestSubject? = .init("1")
		let symbol: TestSubject? = .init("IV")
		let order: TestSubject? = .init("XVI")
		let recursion: TestSubject? = .init("III")
		
		// Then
		XCTAssertNotNil(integer)
		XCTAssertNotNil(symbol)
		XCTAssertNotNil(order)
		XCTAssertNotNil(recursion)
	}
}
