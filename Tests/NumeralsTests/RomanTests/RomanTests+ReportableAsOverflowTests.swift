// RomanTests+ReportableAsOverflowTests.swift
// NumeralsTests
//
// Copyright © 2021 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import Numerals

extension RomanTests {
	func test_addingReportingOverflowReturnsFalse() {
		// Given
		let augend: TestSubject = 3998
		let addend: TestSubject = 1
		
		// When
		let report: TestSubject.Report = augend.addingReportingOverflow(addend)
		
		// Then
		XCTAssertEqual(report.partialValue, 3999)
		XCTAssertEqual(report.overflow, false)
	}
	
	func test_addingReportingOverflowReturnsTrue() {
		// Given
		let augend: TestSubject = 3998
		let addend: TestSubject = 2
		
		// When
		let report: TestSubject.Report = augend.addingReportingOverflow(addend)
		
		// Then
		XCTAssertEqual(report.partialValue, 0)
		XCTAssertEqual(report.overflow, true)
	}
	
	func test_subtractingReportingOverflowReturnsFalse() {
		// Given
		let minuend: TestSubject = 1
		let subtrahend: TestSubject = 1
		
		// When
		let report: TestSubject.Report = minuend.subtractingReportingOverflow(subtrahend)
		
		// Then
		XCTAssertEqual(report.partialValue, 0)
		XCTAssertEqual(report.overflow, false)
	}
	
	func test_subtractingReportingOverflowReturnsTrue() {
		// Given
		let minuend: TestSubject = 1
		let subtrahend: TestSubject = 2

		// When
		let report: TestSubject.Report = minuend.subtractingReportingOverflow(subtrahend)

		// Then
		XCTAssertEqual(report.partialValue, 3999)
		XCTAssertEqual(report.overflow, true)
	}
	
	func test_multipliedReportingOverflowByReturnsFalse() {
		// Given
		let multiplicand: TestSubject = 1000
		let multiplier: TestSubject = 1
		
		// When
		let report: TestSubject.Report = multiplicand.multipliedReportingOverflow(by: multiplier)
		
		// Then
		XCTAssertEqual(report.partialValue, 1000)
		XCTAssertEqual(report.overflow, false)
	}
	
	func test_multipliedReportingOverflowByReturnsTrue() {
		// Given
		let multiplicand: TestSubject = 1000
		let multiplier: TestSubject = 4
		
		// When
		let report: TestSubject.Report = multiplicand.multipliedReportingOverflow(by: multiplier)
		
		// Then
		XCTAssertEqual(report.partialValue, 0)
		XCTAssertEqual(report.overflow, true)
	}
	
	func test_dividedReportingOverflowByReturnsFalse() {
		// Given
		let dividend: TestSubject = 2
		let divisor: TestSubject = 2
		
		// When
		let report: TestSubject.Report = dividend.dividedReportingOverflow(by: divisor)
		
		// Then
		XCTAssertEqual(report.partialValue, 1)
		XCTAssertEqual(report.overflow, false)
	}
	
	func test_dividedReportingOverflowByReturnsTrue() {
		// Given
		let dividend: TestSubject = 2
		let divisor: TestSubject = 0
		
		// When
		let report: TestSubject.Report = dividend.dividedReportingOverflow(by: divisor)
		
		// Then
		XCTAssertEqual(report.partialValue, 2)
		XCTAssertEqual(report.overflow, true)
	}
	
	func test_remainderReportingOverflowDividingByReturnsFalse() {
		// Given
		let dividend: TestSubject = 2
		let divisor: TestSubject = 2
		
		// When
		let report: TestSubject.Report = dividend.remainderReportingOverflow(dividingBy: divisor)
		
		// Then
		XCTAssertEqual(report.partialValue, 0)
		XCTAssertEqual(report.overflow, false)
	}
	
	func test_remainderReportingOverflowDividingByReturnsTrue() {
		// Given
		let dividend: TestSubject = 2
		let divisor: TestSubject = 0
		
		// When
		let report: TestSubject.Report = dividend.remainderReportingOverflow(dividingBy: divisor)
		
		// Then
		XCTAssertEqual(report.partialValue, 2)
		XCTAssertEqual(report.overflow, true)
	}
	
	func test_raisedReportingOverflowToReturnsFalse() {
		// Given
		let base: TestSubject = 2
		let exponent: TestSubject = 3
		
		// When
		let report: TestSubject.Report = base.raisedReportingOverflow(to: exponent)
		
		// Then
		XCTAssertEqual(report.partialValue, 8)
		XCTAssertEqual(report.overflow, false)
	}
	
	func test_raisedReportingOverflowToReturnsTrue() {
		// Given
		let base: TestSubject = 16
		let exponent: TestSubject = 3
		
		// When
		let report: TestSubject.Report = base.raisedReportingOverflow(to: exponent)
		
		// Then
		XCTAssertEqual(report.partialValue, 96)
		XCTAssertEqual(report.overflow, true)
	}
}
