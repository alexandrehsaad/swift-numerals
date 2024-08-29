//
// RomanTests.swift
// NumeralsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import Foundation
import XCTest
@testable import Numerals

internal final class RomanTests: XCTestCase {}

// MARK: - Addable

extension RomanTests {
    internal func test_additionSucceeds() {
        // Given
        let augend: Roman = 2
        let addend: Roman = 4
        
        // When
        let sum: Roman = augend + addend
        
        // Then
        XCTAssertEqual(sum, 6)
    }
    
    internal func test_additionEqualSucceeds() {
        // Given
        var sum: Roman = 2
        let addend: Roman = 4
        
        // When
        sum += addend
        
        // Then
        XCTAssertEqual(sum, 6)
    }
    
    internal func test_addingSucceeds() {
        // Given
        let augend: Roman = 2
        let addend: Roman = 4
        
        // When
        let sum: Roman = augend.adding(addend)
        
        // Then
        XCTAssertEqual(sum, 6)
    }
    
    internal func test_addSucceeds() {
        // Given
        var sum: Roman = 2
        let addend: Roman = 4
        
        // When
        sum.add(addend)
        
        // Then
        XCTAssertEqual(sum, 6)
    }
}

// MARK: - BinaryInteger

extension RomanTests {
    internal func test_initializedClampingSucceeds() {
        // Given
        let min: Roman = .init(clamping: -1)
        let max: Roman = .init(clamping: 4000)

        // Then
        XCTAssertEqual(min, 0)
        XCTAssertEqual(max, 3999)
    }
    
    internal func test_trailingZeroBitCountSucceeds() {
        // Given
        let zero: Roman = .init(0b0000000000000000)
        let numeral: Roman = .init(0b0000111110011111)
        
        // Then
        XCTAssertEqual(zero.trailingZeroBitCount, 12)
        XCTAssertEqual(numeral.trailingZeroBitCount, 0)
    }
    
    internal func test_signumSucceeds() {
        // Given
        let zero: Roman = 0
        let four: Roman = 4
        
        // Then
        XCTAssertEqual(zero.signum(), 0)
        XCTAssertEqual(four.signum(), 1)
    }
}

// MARK: - Comparable

extension RomanTests {
    internal func test_isLessThanReturnsFalse() {
        // Given
        let lhs: Roman = 2
        let rhs: Roman = 1
        
        // When
        let result: Bool = lhs.isLess(than: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isLessThanReturnsTrue() {
        // Given
        let lhs: Roman = 1
        let rhs: Roman = 2
        
        // When
        let result: Bool = lhs.isLess(than: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isLessThanOrEqualToReturnsFalse() {
        // Given
        let lhs: Roman = 2
        let rhs: Roman = 1
        
        // When
        let result: Bool = lhs.isLessThanOrEqual(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isLessThanOrEqualToReturnsTrue() {
        // Given
        let lhs: Roman = 1
        let rhs: Roman = 1
        
        // When
        let result: Bool = lhs.isLessThanOrEqual(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isGreaterThanReturnsFalse() {
        // Given
        let lhs: Roman = 1
        let rhs: Roman = 2
        
        // When
        let result: Bool = lhs.isGreater(than: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isGreaterThanReturnsTrue() {
        // Given
        let lhs: Roman = 2
        let rhs: Roman = 1
        
        // When
        let result: Bool = lhs.isGreater(than: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isGreaterThanOrEqualToReturnsFalse() {
        // Given
        let lhs: Roman = 1
        let rhs: Roman = 2
        
        // When
        let result: Bool = lhs.isGreaterThanOrEqual(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isGreaterThanOrEqualToReturnsTrue() {
        // Given
        let lhs: Roman = 1
        let rhs: Roman = 1
        
        // When
        let result: Bool = lhs.isGreaterThanOrEqual(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isWithinClosedRangeReturnsFalse() {
        // Given
        let value: Roman = 4
        let lowerBound: Roman = 1
        let upperBound: Roman = 3
        let range: ClosedRange<Roman> = lowerBound...upperBound
        
        // Then
        XCTAssertFalse(value.isWithin(range))
    }
    
    internal func test_isWithinClosedRangeReturnsTrue() {
        // Given
        let value: Roman = 2
        let lowerBound: Roman = 1
        let upperBound: Roman = 3
        let range: ClosedRange<Roman> = lowerBound...upperBound
        
        // Then
        XCTAssertTrue(value.isWithin(range))
    }
    
    internal func test_isWithinBoundsReturnsFalse() {
        // Given
        let value: Roman = 4
        let lowerBound: Roman = 1
        let upperBound: Roman = 3
        
        // Then
        XCTAssertFalse(value.isWithin(lowerBound, to: upperBound))
    }
    
    internal func test_isWithinBoundsReturnsTrue() {
        // Given
        let value: Roman = 2
        let lowerBound: Roman = 1
        let upperBound: Roman = 3
        
        // Then
        XCTAssertTrue(value.isWithin(lowerBound, to: upperBound))
    }
}

// MARK: - CustomStringConvertible

extension RomanTests {
    internal func test_descriptionSucceeds() {
        // Given
        let value: Roman = 3999

        // When
        let description: String = value.description

        // Then
        XCTAssertEqual(description, "MMMCMXCIX")
    }
}

// MARK: - Decodable

extension RomanTests {
    #if !os(Linux)
    internal func test_decodeFromJSONSucceeds() throws {
        // Given
        let bundle: Bundle = .module
        let url: URL? = bundle.url(forResource: "Roman", withExtension: "json")
        let data: Data? = try .init(contentsOf: XCTUnwrap(url))
        
        // When
        let decoder: JSONDecoder = .init()
        let result: Roman = try decoder.decode(Roman.self, from: XCTUnwrap(data))
        
        // Then
        let value: Roman = .init(4)
        XCTAssertEqual(result, value)
    }
    #endif
}

// MARK: - Divisible

extension RomanTests {
    internal func test_isInvertibleReturnsFalse() {
        // Given
        let value: Roman = .zero
        
        // When
        let result: Bool = value.isInvertible
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isInvertibleReturnsTrue() {
        // Given
        let value: Roman = 1
        
        // When
        let result: Bool = value.isInvertible
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isDivisibleByReturnsFalse() {
        // Given
        let dividend: Roman = 3
        let divisor: Roman = 0
        
        // When
        let result: Bool = dividend.isDivisible(by: divisor)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isDivisibleByReturnsTrue() {
        // Given
        let dividend: Roman = 3
        let divisor: Roman = 1
        
        // When
        let result: Bool = dividend.isDivisible(by: divisor)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isFactorOfReturnsFalse() {
        // Given
        let dividend: Roman = 2
        let divisor: Roman = 3
        
        // When
        let result: Bool = dividend.isFactor(of: divisor)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isFactorOfReturnsTrue() {
        // Given
        let dividend: Roman = 1
        let divisor: Roman = 2
        
        // When
        let result: Bool = dividend.isFactor(of: divisor)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_divisionSucceeds() {
        // Given
        let dividend: Roman = 6
        let divisor: Roman = 2
        
        // When
        let quotient: Roman = dividend.dividing(by: divisor)
        
        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_divisionEqualSucceeds() {
        // Given
        var quotient: Roman = 6
        let divisor: Roman = 2
        
        // When
        quotient.divide(by: divisor)
        
        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_dividingBySucceeds() {
        // Given
        let dividend: Roman = 6
        let divisor: Roman = 2
        
        // When
        let quotient: Roman = dividend.dividing(by: divisor)
        
        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_divideBySucceeds() {
        // Given
        var quotient: Roman = 6
        let divisor: Roman = 2
        
        // When
        quotient.divide(by: divisor)
        
        // Then
        XCTAssertEqual(quotient, 3)
    }
    
    internal func test_halvedSucceeds() {
        // Given
        let value: Roman = 1
        
        // When
        let half: Roman = value.halved()
        
        // Then
        XCTAssertEqual(half, 0)
    }
    
    internal func test_halveSucceeds() {
        // Given
        var value: Roman = 1
        
        // When
        value.halve()
        
        // Then
        XCTAssertEqual(value, 0)
    }
}

// MARK: - Encodable

extension RomanTests {
    internal func test_encodeToJSONSucceeds() throws {
        // Given
        let value: Roman = 4

        // When
        let encoder: JSONEncoder = .init()
        let result: Data? = try encoder.encode(value)

        // Then
        let data: Data? = "4".data(using: .utf8)
        XCTAssertEqual(result, data)
    }
}

// MARK: - Equatable

extension RomanTests {
    internal func test_isEqualToReturnsFalse() {
        // Given
        let lhs: Roman = 1
        let rhs: Roman = 2
        
        // When
        let result: Bool = lhs.isEqual(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isEqualToReturnsTrue() {
        // Given
        let lhs: Roman = 1
        let rhs: Roman = 1
        
        // When
        let result: Bool = lhs.isEqual(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isUnequalToReturnsFalse() {
        // Given
        let lhs: Roman = 1
        let rhs: Roman = 1
        
        // When
        let result: Bool = lhs.isUnequal(to: rhs)
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isUnequalToReturnsTrue() {
        // Given
        let lhs: Roman = 1
        let rhs: Roman = 2
        
        // When
        let result: Bool = lhs.isUnequal(to: rhs)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isEvenReturnsFalse() {
        // Given
        let value: Roman = 1
        
        // When
        let result: Bool = value.isEven
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isEvenReturnsTrue() {
        // Given
        let value: Roman = 0
        
        // When
        let result: Bool = value.isEven
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_isOddReturnsFalse() {
        // Given
        let value: Roman = 0
        
        // When
        let result: Bool = value.isOdd
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isOddReturnsTrue() {
        // Given
        let value: Roman = 1
        
        // When
        let result: Bool = value.isOdd
        
        // Then
        XCTAssertTrue(result)
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension RomanTests {
    internal func test_initializedWithIntegerLiteralSucceeds() {
        // Given
        let four: Roman = 4
        
        // When
        let value: Roman.Value = four.value
        
        // Then
        XCTAssertEqual(value, 4)
    }
}

// MARK: - FixedWidthInteger

extension RomanTests {
    internal func test_leadingZeroBitCount() {
        // Given
        let zero: Roman = .init(0b000000000000)
        let numeral: Roman = .init(0b111110011111)
        
        // Then
        XCTAssertEqual(zero.leadingZeroBitCount, 12)
        XCTAssertEqual(numeral.leadingZeroBitCount, 0)
    }
    
    internal func test_nonzeroBitCount() {
        // Given
        let zero: Roman = .init(0b000000000000)
        let numeral: Roman = .init(0b111110011111)
        
        // Then
        XCTAssertEqual(zero.nonzeroBitCount, 0)
        XCTAssertEqual(numeral.nonzeroBitCount, 10)
    }
    
    internal func test_byteSwappedReturnsUnswapped() {
        // Given
        let byteUnswapped: Roman = .zero
        let byteSwapped: Roman = byteUnswapped.byteSwapped
        
        // When
        let result: Bool = byteUnswapped.isEqual(to: byteSwapped)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_bitWidthReturnsFour() {
        // Given
        let bitWidth: Int = Roman.bitWidth
        
        // When
        let result: Bool = bitWidth.isEqual(to: 12)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_maxReturnsFifteen() {
        // Given
        let max: Roman = .max
        
        // When
        let result: Bool = max.isEqual(to: 3999)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_minReturnsZero() {
        // Given
        let min: Roman = .min
        
        // When
        let result: Bool = min.isEqual(to: 0)
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_multipliedFullWidthSucceeds() {
        // TODO: Test
        XCTFail("Not Implemented!")
//        // Given
//        let integer: Roman = 1000
//
//        // When
//        let (high, low) = integer.multipliedFullWidth(by: 4)
//        let result: Roman.Value = .init(high) << 4 | .init(low)
//
//        // Then
//        XCTAssertEqual(result, 4000)
    }
    
    internal func test_dividingFullWidthSucceeds() {
        // TODO: Test
        XCTFail("Not Implemented!")
//        // Given
//        let integer: Roman = 10
//        // 0b01100100 = 100
//        let high: Roman = .init(0b0110) // = 6
//        let low: Roman = .init(0b0100) // = 4
//
//        // When
//        let (quotient, remainder) = integer.dividingFullWidth((high, low))
//
//        // Then
//        XCTAssertEqual(quotient, Roman(10))
//        XCTAssertEqual(remainder, Roman(0))
    }
}

// MARK: - LosslessStringConvertible

extension RomanTests {
    internal func test_initializedWithStringFails() {
        // Given
        let empty: Roman? = .init("")
        let order: Roman? = .init("IVIV")
        let recursion: Roman? = .init("IIII")
        
        // Then
        XCTAssertNil(empty)
        XCTAssertNil(order)
        XCTAssertNil(recursion)
    }
    
    internal func test_initializedWithStringSucceeds() {
        // Given
        let integer: Roman? = .init("1")
        let symbol: Roman? = .init("IV")
        let order: Roman? = .init("XVI")
        let recursion: Roman? = .init("III")
        
        // Then
        XCTAssertNotNil(integer)
        XCTAssertNotNil(symbol)
        XCTAssertNotNil(order)
        XCTAssertNotNil(recursion)
    }
}

// MARK: - Multipliable

extension RomanTests {
    internal func test_multiplicationSucceeds() {
        // Given
        let multiplicand: Roman = 2
        let multiplier: Roman = 3
        
        // When
        let product: Roman = multiplicand * multiplier
        
        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_multiplicationEqualSucceeds() {
        // Given
        var product: Roman = 2
        let multiplier: Roman = 3
        
        // When
        product *= multiplier
        
        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_multiplyingBySucceeds() {
        // Given
        let multiplicand: Roman = 2
        let multiplier: Roman = 3
        
        // When
        let product: Roman = multiplicand.multiplying(by: multiplier)
        
        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_multiplyBySucceeds() {
        // Given
        var product: Roman = 2
        let multiplier: Roman = 3
        
        // When
        product *= multiplier
        
        // Then
        XCTAssertEqual(product, 6)
    }
    
    internal func test_doubledSucceeds() {
        // Given
        let value: Roman = 1
        
        // When
        let double: Roman = value.doubled()
        
        // Then
        XCTAssertEqual(double, 2)
    }
    
    internal func test_doubleSucceeds() {
        // Given
        var value: Roman = 1
        
        // When
        value.double()
        
        // Then
        XCTAssertEqual(value, 2)
    }
}

// MARK: - Numeric

extension RomanTests {
    internal func test_magnitudeSucceeds() {
        // Given
        let integer: Roman = 4
        
        // When
        let magnitude: Roman.Magnitude = integer.magnitude

        // Then
        XCTAssertEqual(magnitude, 4)
    }
    
    internal func test_initializedExactlySucceeds() {
        // Given
        let zero: Roman? = .init(exactly: 0)
        let numeral: Roman? = .init(exactly: 3999)

        // Then
        XCTAssertNotNil(zero)
        XCTAssertNotNil(numeral)
    }
    
    internal func test_initializedExactlyFails() {
        // Given
        let negativeOne: Roman? = .init(exactly: -1)
        let sixteen: Roman? = .init(exactly: 4000)

        // Then
        XCTAssertNil(negativeOne)
        XCTAssertNil(sixteen)
    }
}

// MARK: - ReportableAsOverflow

extension RomanTests {
    internal func test_addingReportingOverflowReturnsFalse() {
        // Given
        let augend: Roman = 3998
        let addend: Roman = 1
        
        // When
        let report: Roman.Report = augend.addingReportingOverflow(addend)
        
        // Then
        XCTAssertEqual(report.partialValue, 3999)
        XCTAssertEqual(report.overflow, false)
    }
    
    internal func test_addingReportingOverflowReturnsTrue() {
        // Given
        let augend: Roman = 3998
        let addend: Roman = 2
        
        // When
        let report: Roman.Report = augend.addingReportingOverflow(addend)
        
        // Then
        XCTAssertEqual(report.partialValue, 0)
        XCTAssertEqual(report.overflow, true)
    }
    
    internal func test_subtractingReportingOverflowReturnsFalse() {
        // Given
        let minuend: Roman = 1
        let subtrahend: Roman = 1
        
        // When
        let report: Roman.Report = minuend.subtractingReportingOverflow(subtrahend)
        
        // Then
        XCTAssertEqual(report.partialValue, 0)
        XCTAssertEqual(report.overflow, false)
    }
    
    internal func test_subtractingReportingOverflowReturnsTrue() {
        // Given
        let minuend: Roman = 1
        let subtrahend: Roman = 2

        // When
        let report: Roman.Report = minuend.subtractingReportingOverflow(subtrahend)

        // Then
        XCTAssertEqual(report.partialValue, 3999)
        XCTAssertEqual(report.overflow, true)
    }
    
    internal func test_multipliedReportingOverflowByReturnsFalse() {
        // Given
        let multiplicand: Roman = 1000
        let multiplier: Roman = 1
        
        // When
        let report: Roman.Report = multiplicand.multipliedReportingOverflow(by: multiplier)
        
        // Then
        XCTAssertEqual(report.partialValue, 1000)
        XCTAssertEqual(report.overflow, false)
    }
    
    internal func test_multipliedReportingOverflowByReturnsTrue() {
        // Given
        let multiplicand: Roman = 1000
        let multiplier: Roman = 4
        
        // When
        let report: Roman.Report = multiplicand.multipliedReportingOverflow(by: multiplier)
        
        // Then
        XCTAssertEqual(report.partialValue, 0)
        XCTAssertEqual(report.overflow, true)
    }
    
    internal func test_dividedReportingOverflowByReturnsFalse() {
        // Given
        let dividend: Roman = 2
        let divisor: Roman = 2
        
        // When
        let report: Roman.Report = dividend.dividedReportingOverflow(by: divisor)
        
        // Then
        XCTAssertEqual(report.partialValue, 1)
        XCTAssertEqual(report.overflow, false)
    }
    
    internal func test_dividedReportingOverflowByReturnsTrue() {
        // Given
        let dividend: Roman = 2
        let divisor: Roman = 0
        
        // When
        let report: Roman.Report = dividend.dividedReportingOverflow(by: divisor)
        
        // Then
        XCTAssertEqual(report.partialValue, 2)
        XCTAssertEqual(report.overflow, true)
    }
    
    internal func test_remainderReportingOverflowDividingByReturnsFalse() {
        // Given
        let dividend: Roman = 2
        let divisor: Roman = 2
        
        // When
        let report: Roman.Report = dividend.remainderReportingOverflow(dividingBy: divisor)
        
        // Then
        XCTAssertEqual(report.partialValue, 0)
        XCTAssertEqual(report.overflow, false)
    }
    
    internal func test_remainderReportingOverflowDividingByReturnsTrue() {
        // Given
        let dividend: Roman = 2
        let divisor: Roman = 0
        
        // When
        let report: Roman.Report = dividend.remainderReportingOverflow(dividingBy: divisor)
        
        // Then
        XCTAssertEqual(report.partialValue, 2)
        XCTAssertEqual(report.overflow, true)
    }
    
    internal func test_raisedReportingOverflowToReturnsFalse() {
        // Given
        let base: Roman = 2
        let exponent: Roman = 3
        
        // When
        let report: Roman.Report = base.raisedReportingOverflow(to: exponent)
        
        // Then
        XCTAssertEqual(report.partialValue, 8)
        XCTAssertEqual(report.overflow, false)
    }
    
    internal func test_raisedReportingOverflowToReturnsTrue() {
        // Given
        let base: Roman = 16
        let exponent: Roman = 3
        
        // When
        let report: Roman.Report = base.raisedReportingOverflow(to: exponent)
        
        // Then
        XCTAssertEqual(report.partialValue, 96)
        XCTAssertEqual(report.overflow, true)
    }
}

// MARK: - RepresentableByZero

extension RomanTests {
    internal func test_isZeroReturnsFalse() {
        // Given
        let value: Roman = 1
        
        // When
        let result: Bool = value.isZero
        
        // Then
        XCTAssertFalse(result)
    }
    
    internal func test_isZeroReturnsTrue() {
        // Given
        let value: Roman = .zero
        
        // When
        let result: Bool = value.isZero
        
        // Then
        XCTAssertTrue(result)
    }
    
    internal func test_additionReturnsZero() {
        // Given
        let augend: Roman = .zero
        let addend: Roman = .zero
        
        // When
        let sum: Roman = augend + addend
        
        // Then
        XCTAssertEqual(sum, .zero)
    }
    
    internal func test_multiplicationReturnsZero() {
        // Given
        let multiplicand: Roman = .zero
        let multiplier: Roman = .zero
        
        // When
        let product: Roman = multiplicand * multiplier
        
        // Then
        XCTAssertEqual(product, .zero)
    }
    
    internal func test_subtractionReturnsZero() {
        // Given
        let minuend: Roman = .zero
        let subtrahend: Roman = .zero
        
        // When
        let difference: Roman = minuend - subtrahend
        
        // Then
        XCTAssertEqual(difference, .zero)
    }
}

// MARK: - Strideable

extension RomanTests {
    internal func test_advanceBySucceeds() {
        // Given
        let value: Roman = 1
        let amount: Roman.Stride = 3
        
        // When
        let result: Roman = value.advanced(by: amount)
        
        // Then
        XCTAssertEqual(result, 4)
    }
    
    internal func test_distanceToSucceeds() {
        // Given
        let value: Roman = 1
        let otherValue: Roman = 4
        
        // When
        let result: Roman.Stride = value.distance(to: otherValue)
        
        // Then
        XCTAssertEqual(result, 3)
    }
}

// MARK: - Subtractable

extension RomanTests {
    internal func test_subtractionSucceeds() {
        // Given
        let minuend: Roman = 6
        let subtrahend: Roman = 4
        
        // When
        let difference: Roman = minuend - subtrahend
        
        // Then
        XCTAssertEqual(difference, 2)
    }
    
    internal func test_subtractionEqualSucceeds() {
        // Given
        var difference: Roman = 6
        let subtrahend: Roman = 4
        
        // When
        difference -= subtrahend
        
        // Then
        XCTAssertEqual(difference, 2)
    }
    
    internal func test_subtractingSucceeds() {
        // Given
        let minuend: Roman = 6
        let subtrahend: Roman = 4
        
        // When
        let difference: Roman = minuend.subtracting(subtrahend)
        
        // Then
        XCTAssertEqual(difference, 2)
    }
    
    internal func test_subtractSucceeds() {
        // Given
        var difference: Roman = 6
        let subtrahend: Roman = 4
        
        // When
        difference.subtract(subtrahend)
        
        // Then
        XCTAssertEqual(difference, 2)
    }
}
