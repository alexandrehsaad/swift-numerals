// RomanTests+JSONDecodableTests.swift
// NumeralsTests
//
// Copyright © 2021 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Numerals

extension RomanTests {
	func test_decodeFromJSONSucceeds() throws {
		// Given
		let bundle: Bundle = .module
		let url: URL? = bundle.url(forResource: "Roman", withExtension: "json")
		let data: Data? = try .init(contentsOf: XCTUnwrap(url))
		
		// When
		let decoder: JSONDecoder = .init()
		let result: TestSubject = try decoder.decode(TestSubject.self, from: XCTUnwrap(data))
		
		// Then
		let value: TestSubject = .init(4)
		XCTAssertEqual(result, value)
	}
}
