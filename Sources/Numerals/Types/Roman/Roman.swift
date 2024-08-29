//
// Roman.swift
// Numerals
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A representation of a roman numeral.
public struct Roman {
	/// The underlying value.
	internal typealias Value = UInt16
	
	/// Creates a new instance with the specified value.
	///
	/// - parameter value: The value of this instance.
	/// - Warning: The value must be in between 0 and 3999.
	internal init(value: Self.Value) {
		precondition(0...3999 ~= value)
		self.value = value
	}
	
	/// The underlying value.
	internal let value: Self.Value
}

// MARK: - Addable

extension Roman: Addable {
    /// Returns the sum of adding the two specified value.
    ///
    /// ```swift
    /// let one: Roman = 1
    /// print(one + one)
    /// // Prints "II"
    /// ```
    ///
    /// - parameter lhs: The augend.
    /// - parameter rhs: The addend.
    /// - returns: The sum.
    public static func + (_ lhs: Self, _ rhs: Self) -> Self {
        let newValue: Self.Value = lhs.value + rhs.value
        return .init(value: newValue)
    }
}

// MARK: - AdditiveArithmetic

extension Roman: AdditiveArithmetic {}

// MARK: - BinaryInteger

extension Roman: BinaryInteger {
    public typealias Words = UInt16.Words
    
    public var words: Self.Words {
        return self.value.words
    }
    
    public var trailingZeroBitCount: Int {
        return Swift.min(self.bitWidth, self.value.trailingZeroBitCount)
    }
    
    public static func &= (lhs: inout Self, rhs: Self) {
        let newValue: Self.Value = lhs.value & rhs.value
        lhs = .init(value: newValue)
    }
    
    public static func |= (lhs: inout Self, rhs: Self) {
        let newValue: Self.Value = lhs.value | rhs.value
        lhs = .init(value: newValue)
    }
    
    public static func ^= (lhs: inout Self, rhs: Self) {
        let newValue: Self.Value = lhs.value ^ rhs.value
        lhs = .init(value: newValue)
    }
}

// MARK: - Comparable

extension Roman: Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.value < rhs.value
    }
}

// MARK: - CustomStringConvertible

extension Roman: CustomStringConvertible {
    public var description: String {
        let symbols: Array<RomanSymbol> = RomanSymbol.allCases.reversed()
        
        var number: Self.Value = self.value
        var result: String = ""

        while number > 0 {
            for symbol in symbols {
                let report: Self.Value.Report = number.subtractingReportingOverflow(symbol.value)
                
                if report.overflow == false && report.partialValue >= 0 {
                    number -= symbol.value
                    result += symbol.description
                    break
                }
            }
        }

        return result
    }
}

// MARK: - Decodable

extension Roman: Decodable {
    public init(from decoder: Decoder) throws {
        let container: SingleValueDecodingContainer = try decoder.singleValueContainer()
        let value: Self.Value = try container.decode(Self.Value.self)
        
        self = .init(value: value)
    }
}

// MARK: - Divisible

extension Roman: Divisible {
    /// Returns the quotient of dividing the first specified value by the second.
    ///
    /// ```swift
    /// let six: Roman = 6
    /// let two: Roman = 2
    /// print(six / two)
    /// // Prints "III"
    /// ```
    ///
    /// - parameter lhs: The dividend.
    /// - parameter rhs: The divisor.
    /// - returns: The quotient.
    public static func / (lhs: Self, rhs: Self) -> Self {
        let newValue: Self.Value = lhs.value / rhs.value
        return .init(value: newValue)
    }
    
    /// Returns the remainder of dividing the first specified value by the second.
    ///
    /// - parameter lhs: The dividend.
    /// - parameter rhs: The divisor.
    /// - returns: The remainder.
    public static func % (lhs: Self, rhs: Self) -> Self {
        let newValue: Self.Value = lhs.value % rhs.value
        return .init(value: newValue)
    }
}

// MARK: - Encodable

extension Roman: Encodable {
    public func encode(to encoder: Encoder) throws {
        try self.value.encode(to: encoder)
    }
}

// MARK: - Equatable

extension Roman: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.value == rhs.value
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension Roman: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        let newValue: Self.Value = .init(value)
        
        self.init(value: newValue)
    }
}

// MARK: - Hashable

extension Roman: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.value.hashValue)
    }
}

// MARK: - LosslessStringConvertible

extension Roman: LosslessStringConvertible {
    public init?(_ description: String) {
        guard description.isEmpty == false else {
            return nil
        }
        
        if let value: Self.Value = .init(description) {
            guard value <= Self.max else {
                return nil
            }
            
            self.init(value: value)
        } else if description.isRomanNumeral == true {
            let symbols: Array<RomanSymbol> = RomanSymbol.allCases.reversed()
            
            var string: String = description
            var value: Self.Value = 0
            
            while string.isEmpty == false {
                for (index, symbol) in symbols.enumerated() {
                    if string.hasPrefix(symbol.description) {
                        string.removeFirst(symbol.description.count)
                        value += symbol.value
                        break
                    } else if index == symbols.endIndex - 1 {
                        return nil
                    }
                }
            }
            
            guard value <= Self.max else {
                return nil
            }
            
            self.init(value: value)
        } else {
            return nil
        }
    }
}

// MARK: - Multipliable

extension Roman: Multipliable {
    /// Returns the product of multiplying the two specified value.
    ///
    /// ```swift
    /// let two: Roman = 2
    /// print(two * two)
    /// // Prints "IV"
    /// ```
    ///
    /// - parameter lhs: The multiplicand.
    /// - parameter rhs: The multiplicator.
    /// - returns: The product.
    public static func * (_ lhs: Self, _ rhs: Self) -> Self {
        let newValue: Self.Value = lhs.value * rhs.value
        return .init(value: newValue)
    }
}

// MARK: - Numeric

extension Roman: Numeric {
    public typealias Magnitude = Self
    
    public init?<Source>(exactly source: Source)
    where Source: BinaryInteger {
        guard let value: Self.Value = .init(exactly: source),
                0...3999 ~= value else {
            return nil
        }
        
        self.init(value: value)
    }
}

// MARK: - Raisable

extension Roman: Raisable {}

// MARK: - ReportableAsOverflow

extension Roman: ReportableAsOverflow {
    public func addingReportingOverflow(_ rhs: Self) -> Self.Report {
        var newValue: Self.Value = self.value + rhs.value

        guard newValue <= Self.max.value else {
            newValue = newValue - Self.max.value - 1
            return (.init(newValue), true)
        }

        return (.init(newValue), false)
    }

    public func subtractingReportingOverflow(_ rhs: Self) -> Self.Report {
        let report: Self.Value.Report = self.value.subtractingReportingOverflow(rhs.value)
        var partialValue: Self = .init(clamping: report.partialValue)
        let overflow: Bool = report.overflow

        if overflow == true {
            partialValue -= partialValue - Self.max
        }

        return (partialValue, overflow)
    }

    public func multipliedReportingOverflow(by rhs: Self) -> Self.Report {
        var newValue: Self.Value = self.value * rhs.value

        guard newValue <= Self.max.value else {
            newValue = newValue - Self.max.value - 1
            return (.init(newValue), true)
        }

        return (.init(newValue), false)
    }

    public func dividedReportingOverflow(by rhs: Self) -> Self.Report {
        guard rhs.value != 0 else {
            return (self, true)
        }
        
        let report: Self.Value.Report = self.value.dividedReportingOverflow(by: rhs.value)
        let partialValue: Self = .init(value: report.partialValue)
        let overflow: Bool = report.overflow
        
        return (partialValue, overflow)
    }

    public func remainderReportingOverflow(dividingBy rhs: Self) -> Self.Report {
        guard rhs.value != 0 else {
            return (self, true)
        }
        
        let report: Self.Value.Report = self.value.remainderReportingOverflow(dividingBy: rhs.value)
        let partialValue: Self = .init(value: report.partialValue)
        let overflow: Bool = report.overflow
        
        return (partialValue, overflow)
    }
}

// MARK: - RepresentableByZero

extension Roman: RepresentableByZero {
    public static let zero: Self = .init(value: 0)
}

// MARK: - Sendable

extension Roman: Sendable {}

// MARK: - Strideable

extension Roman: Strideable {
    public typealias Stride = Int
    
    public func advanced(by amount: Self.Stride) -> Self {
        let newValue: Self.Stride = .init(self.value) + amount
        return .init(integerLiteral: newValue)
    }
    
    public func distance(to other: Self) -> Self.Stride {
        let newValue: Self.Value = other.value - self.value
        return .init(newValue)
    }
}

// MARK: - Subtractable

extension Roman: Subtractable {
    /// Returns the difference of subtracting the second specified value from the first.
    ///
    /// ```swift
    /// let two: Roman = 2
    /// let one: Roman = 1
    /// print(two - one)
    /// // Prints "I"
    /// ```
    ///
    /// - parameter lhs: The minuend.
    /// - parameter rhs: The subtrahend.
    /// - returns: The difference.
    public static func - (_ lhs: Self, _ rhs: Self) -> Self {
        let newValue: Self.Value = lhs.value - rhs.value
        return .init(value: newValue)
    }
}

// MARK: - UnsignedInteger

extension Roman: UnsignedInteger {}
