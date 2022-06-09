// RomanTests+JSONEncodableTests.swift
// NumeralsTests
//
// Copyright © 2021 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Numerals

extension RomanTests {
	func test_encodeToJSONSucceeds() throws {
		// Given
		let value: TestSubject = 4

		// When
		let encoder: JSONEncoder = .init()
		let result: Data? = try encoder.encode(value)

		// Then
		let data: Data? = "4".data(using: .utf8)
		XCTAssertEqual(result, data)
	}
}

