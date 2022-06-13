// StringTests.swift
// NumeralsTests
//
// Copyright © 2021 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Numerals

final class StringTests: XCTestCase {
	func test_isRomanSymbolReturnsTrue() {
		// Given
		let symbol: String = "I"
		let order: String = "IV"

		// Then
		for element in [symbol, order] {
			XCTAssertTrue(element.isRomanSymbol)
		}
	}
	
	func test_isRomanSymbolReturnsFalse() {
		// Given
		let empty: String = ""
		let order: String = "VI"
		let recursion: String = "II"

		// Then
		for element in [empty, order, recursion] {
			XCTAssertFalse(element.isRomanSymbol)
		}
	}
	
	func test_isRomanNumeralReturnsTrue() {
		// Given
		let symbol: String = "IV"
		let order: String = "XVI"
		let recursion: String = "III"
		
		// Then
		for element in [symbol, order, recursion] {
			XCTAssertTrue(element.isRomanNumeral)
		}
	}
	
	func test_isRomanNumeralReturnsFalse() {
		// Given
		let empty: String = ""
		let order: String = "IVIV"
		let recursion: String = "IIII"
		
		// Then
		for element in [empty, order, recursion] {
			XCTAssertFalse(element.isRomanNumeral)
		}
	}
}
