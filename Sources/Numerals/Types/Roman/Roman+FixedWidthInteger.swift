//
// Roman+FixedWidthInteger.swift
// Numerals
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Roman: FixedWidthInteger {
	public init<T>(clamping source: T)
	where T: BinaryInteger {
		let min: Int = .init(Self.min)
		let max: Int = .init(Self.max)
		let clampedSource: Int = Swift.min(Swift.max(min, .init(source)), max)
		let newValue: Self.Value = .init(clampedSource)
		
		self.init(value: newValue)
	}
	
	public var nonzeroBitCount: Int {
		return self.value.nonzeroBitCount
	}

	public var leadingZeroBitCount: Int {
		return self.value.leadingZeroBitCount - 4
	}

	public var byteSwapped: Self {
		return self
	}
	
	public static var bitWidth: Int {
		return 12
	}
	
	public static var max: Self {
		return 3999
	}
	
	public static var min: Self {
		return 0
	}
	
	// TODO: multipliedFullWidth
    @available(swift, deprecated: 1, message: "Not implemented!")
	public func multipliedFullWidth(by other: Self) -> (high: Self, low: Self.Magnitude) {
		let product: Self.Value = self.value * other.value
		let high: Self = .init(truncatingIfNeeded: product >> 4)
		let low: Self = .init(truncatingIfNeeded: product)
		
		return (high, low)
	}

	// TODO: dividingFullWidth
    @available(swift, deprecated: 1, message: "Not implemented!")
	public func dividingFullWidth(_ dividend: (high: Self, low: Self.Magnitude)) -> (quotient: Self, remainder: Self) {
		precondition(self != 0, "Division by zero")

		let dividend: Self.Value = (dividend.high.value << 4) | dividend.low.value
		let (quotient, remainder) = dividend.quotientAndRemainder(dividingBy: self.value)
		
		return (.init(quotient), .init(remainder))
	}
}

extension Roman {
	@available(swift, deprecated: 1)
	public init<T>(_truncatingBits source: T)
	where T: BinaryInteger {
		let newSource: Self.Value = .init(source)
		let bitWidth: Int = newSource.bitWidth - Self.bitWidth
		let newValue: Self.Value = (newSource << bitWidth) >> bitWidth

		self.init(value: newValue)
	}
}
