// Roman+BinaryInteger.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

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
